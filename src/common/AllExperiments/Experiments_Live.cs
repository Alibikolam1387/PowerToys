﻿// Copyright (c) Microsoft Corporation
// The Microsoft Corporation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System.Text.Json;
using Microsoft.PowerToys.Settings.UI.Library.Telemetry.Events;
using Microsoft.PowerToys.Telemetry;
using Microsoft.VariantAssignment.Client;
using Microsoft.VariantAssignment.Contract;
using Windows.System.Profile;

namespace AllExperiments
{
// The dependencies required to build this project are only available in the official build pipeline and are internal to Microsoft.
// However, this project is not required to build a test version of the application.
#pragma warning disable SA1649 // File name should match first type name. Suppressed because it needs to be the same class name as Experiments_Inert.cs
    public class Experiments
#pragma warning restore SA1649 // File name should match first type name
    {
        public async Task<bool> EnableLandingPageExperimentAsync()
        {
            Experiments varServ = new Experiments();
            await varServ.VariantAssignmentProvider_Initialize();
            var landingPageExperiment = varServ.IsExperiment;

            return landingPageExperiment;
        }

        private async Task VariantAssignmentProvider_Initialize()
        {
            IsExperiment = false;
            string jsonFilePath = CreateFilePath();

            var vaSettings = new VariantAssignmentClientSettings
            {
                Endpoint = new Uri("https://default.exp-tas.com/exptas77/a7a397e7-6fbe-4f21-a4e9-3f542e4b000e-exppowertoys/api/v1/tas"),
                EnableCaching = true,
                ResponseCacheTime = TimeSpan.FromMinutes(5),
            };

            try
            {
                var vaClient = vaSettings.GetTreatmentAssignmentServiceClient();
                var vaRequest = GetVariantAssignmentRequest();
                using var variantAssignments = await vaClient.GetVariantAssignmentsAsync(vaRequest).ConfigureAwait(false);

                if (variantAssignments.AssignedVariants.Count != 0)
                {
                    var dataVersion = variantAssignments.DataVersion;
                    var featureVariables = variantAssignments.GetFeatureVariables();
                    var assignmentContext = variantAssignments.GetAssignmentContext();
                    var featureFlagValue = featureVariables[0].GetStringValue();

                    if (featureFlagValue == "alternate" && assignmentContext != string.Empty)
                    {
                        IsExperiment = true;
                    }

                    string json = File.ReadAllText(jsonFilePath);
                    var jsonDictionary = JsonSerializer.Deserialize<Dictionary<string, object>>(json);

                    if (jsonDictionary != null)
                    {
                        if (!jsonDictionary.ContainsKey("dataversion"))
                        {
                            jsonDictionary.Add("dataversion", dataVersion);
                        }

                        if (!jsonDictionary.ContainsKey("variantassignment"))
                        {
                            jsonDictionary.Add("variantassignment", featureFlagValue);
                        }
                        else
                        {
                            var jsonDataVersion = jsonDictionary["dataversion"].ToString();
                            if (jsonDataVersion != null && int.Parse(jsonDataVersion) < dataVersion)
                            {
                                jsonDictionary["dataversion"] = dataVersion;
                                jsonDictionary["variantassignment"] = featureFlagValue;
                            }
                        }

                        string output = JsonSerializer.Serialize(jsonDictionary);
                        File.WriteAllText(jsonFilePath, output);
                    }

                    PowerToysTelemetry.Log.WriteEvent(new OobeVariantAssignmentEvent() { AssignmentContext = assignmentContext, ClientID = AssignmentUnit });
                }
            }
            catch (HttpRequestException ex)
            {
                string json = File.ReadAllText(jsonFilePath);
                var jsonDictionary = JsonSerializer.Deserialize<Dictionary<string, object>>(json);

                if (jsonDictionary != null && jsonDictionary.ContainsKey("variantassignment"))
                {
                    if (jsonDictionary["variantassignment"].ToString() == "alternate")
                    {
                        IsExperiment = true;
                    }
                }

                Logger.LogError("Error getting to TAS endpoint", ex);
            }
            catch (Exception ex)
            {
                Logger.LogError("Error getting variant assignments for experiment", ex);
            }
        }

        public bool IsExperiment { get; set; }

        private string? AssignmentUnit { get; set; }

        private IVariantAssignmentRequest GetVariantAssignmentRequest()
        {
            var jsonFilePath = CreateFilePath();
            try
            {
                if (!File.Exists(jsonFilePath))
                {
                    AssignmentUnit = Guid.NewGuid().ToString();
                    var data = new Dictionary<string, string>()
                    {
                        ["clientid"] = AssignmentUnit,
                    };
                    string jsonData = JsonSerializer.Serialize(data);
                    File.WriteAllText(jsonFilePath, jsonData);
                }
                else
                {
                    string json = File.ReadAllText(jsonFilePath);
                    var jsonDictionary = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, object>>(json);
                    if (jsonDictionary != null)
                    {
                        AssignmentUnit = jsonDictionary["clientid"]?.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogError("Error creating/getting AssignmentUnit", ex);
            }

            var attrNames = new List<string> { "FlightRing" };
            var attrData = AnalyticsInfo.GetSystemPropertiesAsync(attrNames).AsTask().GetAwaiter().GetResult();

            var flightRing = string.Empty;

            if (attrData.ContainsKey("FlightRing"))
            {
                flightRing = attrData["FlightRing"];
            }

            return new VariantAssignmentRequest
            {
                Parameters =
                {
                    // TBD: Adding traffic filters to target region.
                    { "flightRing", flightRing },
                    { "clientid", AssignmentUnit },
                },
            };
        }

        private string CreateFilePath()
        {
            var exeDir = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            var settingsPath = @"Microsoft\PowerToys\experimentation.json";
            var filePath = Path.Combine(exeDir, settingsPath);
            return filePath;
        }
    }
}
