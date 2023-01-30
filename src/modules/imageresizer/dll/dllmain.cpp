#include "pch.h"
#include "Generated Files/resource.h"
#include "ImageResizerExt_i.h"
#include "dllmain.h"

#include <ImageResizerConstants.h>
#include <Settings.h>
#include <trace.h>

#include <common/logger/logger.h>
#include <common/SettingsAPI/settings_objects.h>
#include <common/utils/package.h>
#include <common/utils/process_path.h>
#include <common/utils/registry.h>
#include <common/utils/resources.h>
#include <common/utils/logger_helper.h>
#include <interface/powertoy_module_interface.h>

#include <filesystem>
#include <string>
#include <vector>

namespace
{
    // Class CLSID - see CContextMenuHandler definition in ContextMenuHandler.h
    const wchar_t CLASS_CLSID[] = L"{51B4D7E5-7568-4234-B4BB-47FB3C016A69}";
}

CImageResizerExtModule _AtlModule;
HINSTANCE g_hInst_imageResizer = 0;

extern "C" BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved)
{
    switch (dwReason)
    {
    case DLL_PROCESS_ATTACH:
        g_hInst_imageResizer = hInstance;
        Trace::RegisterProvider();
        break;
    case DLL_PROCESS_DETACH:
        Trace::UnregisterProvider();
        break;
    }
    return _AtlModule.DllMain(dwReason, lpReserved);
}

class ImageResizerModule : public PowertoyModuleIface
{
private:
    // Enabled by default
    bool m_enabled = true;
    std::wstring app_name;
    //contains the non localized key of the powertoy
    std::wstring app_key;

public:
    // Constructor
    ImageResizerModule()
    {
        m_enabled = CSettingsInstance().GetEnabled();
        app_name = GET_RESOURCE_STRING(IDS_IMAGERESIZER);
        app_key = ImageResizerConstants::ModuleKey;
        LoggerHelpers::init_logger(app_key, L"ModuleInterface", LogSettings::imageResizerLoggerName);
    };

    // Destroy the powertoy and free memory
    virtual void destroy() override
    {
        delete this;
    }

    // Return the localized display name of the powertoy
    virtual const wchar_t* get_name() override
    {
        return app_name.c_str();
    }

    // Return the non localized key of the powertoy, this will be cached by the runner
    virtual const wchar_t* get_key() override
    {
        return app_key.c_str();
    }

    // Return the configured status for the gpo policy for the module
    virtual powertoys_gpo::gpo_rule_configured_t gpo_policy_enabled_configuration() override
    {
        return powertoys_gpo::getConfiguredImageResizerEnabledValue();
    }

    // Return JSON with the configuration options.
    virtual bool get_config(wchar_t* buffer, int* buffer_size) override
    {
        HINSTANCE hinstance = reinterpret_cast<HINSTANCE>(&__ImageBase);

        // Create a Settings object.
        PowerToysSettings::Settings settings(hinstance, get_name());
        settings.set_description(GET_RESOURCE_STRING(IDS_SETTINGS_DESCRIPTION));
        settings.set_overview_link(L"https://aka.ms/PowerToysOverview_ImageResizer");
        settings.set_icon_key(L"pt-image-resizer");
        settings.add_header_szLarge(L"imageresizer_settingsheader", GET_RESOURCE_STRING(IDS_SETTINGS_HEADER_DESCRIPTION), GET_RESOURCE_STRING(IDS_SETTINGS_HEADER));
        return settings.serialize_to_buffer(buffer, buffer_size);
    }

    // Signal from the Settings editor to call a custom action.
    // This can be used to spawn more complex editors.
    virtual void call_custom_action(const wchar_t* /*action*/) override {}

    // Called by the runner to pass the updated settings values as a serialized JSON.
    virtual void set_config(const wchar_t* /*config*/) override {}

    // Enable the powertoy
    virtual void enable()
    {
        m_enabled = true;
        CSettingsInstance().SetEnabled(m_enabled);

        if (!get_registry_change_set(true).apply())
        {
            Logger::error(L"Applying registry entries failed");
        }

        if (package::IsWin11OrGreater())
        {
            std::wstring path = get_module_folderpath(g_hInst_imageResizer);
            std::wstring packageUri = path + L"\\ImageResizerContextMenuPackage.msix";

            if (!package::IsPackageRegistered(ImageResizerConstants::ModulePackageDisplayName))
            {
                package::RegisterSparsePackage(path, packageUri);
            }
        }

        Trace::EnableImageResizer(m_enabled);
    }

    // Disable the powertoy
    virtual void disable()
    {
        if (!get_registry_change_set(true).unApply())
        {
            Logger::error(L"Un-applying registry entries failed");
        }

        m_enabled = false;
        CSettingsInstance().SetEnabled(m_enabled);
        Trace::EnableImageResizer(m_enabled);
    }

    // Returns if the powertoys is enabled
    virtual bool is_enabled() override
    {
        return m_enabled;
    }

    registry::ChangeSet get_registry_change_set(const bool perUser)
    {
        const std::vector<std::wstring> extensions = { L".bmp",
                                                       L".dib",
                                                       L".gif",
                                                       L".jfif",
                                                       L".jpe",
                                                       L".jpeg",
                                                       L".jpg",
                                                       L".jxr",
                                                       L".png",
                                                       L".rle",
                                                       L".tif",
                                                       L".tiff",
                                                       L".wdp" };

        const HKEY scope = perUser ? HKEY_CURRENT_USER : HKEY_LOCAL_MACHINE;

        std::wstring clsidPath = L"Software\\Classes\\CLSID";
        clsidPath += L'\\';
        clsidPath += CLASS_CLSID;

        std::wstring inprocServerPath = clsidPath;
        inprocServerPath += L'\\';
        inprocServerPath += L"InprocServer32";

        const std::wstring installationDir = get_module_folderpath();
        const std::wstring handlerPath = (std::filesystem::path{ installationDir } /
                                          LR"d(modules\ImageResizer\PowerToys.ImageResizerExt.dll)d")
                                             .wstring();

        using vec_t = std::vector<registry::ValueChange>;

        vec_t changes = { { scope, inprocServerPath, std::nullopt, handlerPath },
                          { scope, inprocServerPath, L"ThreadingModel", L"Apartment" } };

        const std::wstring dragDropRegPath = L"SOFTWARE\\Classes\\Directory\\ShellEx\\DragDropHandlers\\ImageResizer";
        changes.push_back({ scope, dragDropRegPath, std::nullopt, CLASS_CLSID });

        const std::wstring extensionContextMenuHandlerRegPath = L"SOFTWARE\\Classes\\SystemFileAssociations\\<pwt_ext>\\ShellEx\\ContextMenuHandlers\\ImageResizer";
        const std::size_t replacePos = extensionContextMenuHandlerRegPath.find(L"<pwt_ext>");
        const std::size_t replaceLen = std::wstring(L"<pwt_ext>").size();

        for (const auto& extension : extensions)
        {
            std::wstring currentPath = extensionContextMenuHandlerRegPath;
            currentPath.replace(replacePos, replaceLen, extension);
            changes.push_back({ scope, currentPath, std::nullopt, CLASS_CLSID });
        }

        return { changes };
    }
};

extern "C" __declspec(dllexport) PowertoyModuleIface* __cdecl powertoy_create()
{
    return new ImageResizerModule();
}