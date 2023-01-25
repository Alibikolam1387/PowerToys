#AlwaysOnTop
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName AlwaysOnTopFiles -wxsFilePath $PSScriptRoot\AlwaysOnTop.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\AlwaysOnTop"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""AlwaysOnTopFiles"" -wxsFilePath $PSScriptRoot\AlwaysOnTop.wxs"

#AwakeFiles
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\Awake\PowerToys.Awake.deps.json"" -fileListName AwakeFiles -wxsFilePath $PSScriptRoot\Awake.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName AwakeImagesFiles -wxsFilePath $PSScriptRoot\Awake.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\Awake\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""AwakeFiles"" -wxsFilePath $PSScriptRoot\Awake.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""AwakeImagesFiles"" -wxsFilePath $PSScriptRoot\Awake.wxs"

#ColorPicker
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\ColorPicker\PowerToys.ColorPickerUI.deps.json"" -fileListName ColorPickerFiles -wxsFilePath $PSScriptRoot\ColorPicker.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ColorPickerResourcesFiles -wxsFilePath $PSScriptRoot\ColorPicker.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\ColorPicker\Resources"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ColorPickerFiles"" -wxsFilePath $PSScriptRoot\ColorPicker.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ColorPickerResourcesFiles"" -wxsFilePath $PSScriptRoot\ColorPicker.wxs"

Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\ColorPicker\PowerToys.ColorPickerUI.deps.json"" -fileListName ColorPickerFiles -wxsFilePath $PSScriptRoot\ColorPicker.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ColorPickerFiles"" -wxsFilePath $PSScriptRoot\ColorPicker.wxs"

#FancyZones
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\FancyZones\PowerToys.FancyZonesEditor.deps.json"" -fileListName FancyZonesFiles -wxsFilePath $PSScriptRoot\FancyZones.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FancyZonesFiles"" -wxsFilePath $PSScriptRoot\FancyZones.wxs"

#FileExplorerAdd-ons
#TODO: There are multiple .deps.json files, make sure it works as expected
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\FileExplorerPreview\PowerToys.SvgThumbnailProvider.deps.json"" -fileListName PowerPreviewFiles -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName MonacoCustomLanguagesFiles -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\FileExplorerPreview\customLanguages"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerPreviewFiles"" -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""MonacoCustomLanguagesFiles"" -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs"

#FileLocksmith
#TODO: There are multiple .deps.json files, make sure it works as expected
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\FileLocksmith\PowerToys.FileLocksmithUI.deps.json"" -fileListName FileLocksmithFiles -wxsFilePath $PSScriptRoot\FileLocksmith.wxs -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName FileLocksmithAssetsFiles -wxsFilePath $PSScriptRoot\FileLocksmith.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\FileLocksmith\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FileLocksmithFiles"" -wxsFilePath $PSScriptRoot\FileLocksmith.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FileLocksmithAssetsFiles"" -wxsFilePath $PSScriptRoot\FileLocksmith.wxs"

#Hosts
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\Hosts\PowerToys.Hosts.deps.json"" -fileListName HostsFiles -wxsFilePath $PSScriptRoot\Hosts.wxs -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName HostsAssetsFiles -wxsFilePath $PSScriptRoot\Hosts.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\Hosts\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HostsFiles"" -wxsFilePath $PSScriptRoot\Hosts.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HostsAssetsFiles"" -wxsFilePath $PSScriptRoot\Hosts.wxs"

#ImageResizer
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\ImageResizer\PowerToys.ImageResizer.deps.json"" -fileListName ImageResizerFiles -wxsFilePath $PSScriptRoot\ImageResizer.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ImageResizerAssetsFiles -wxsFilePath $PSScriptRoot\ImageResizer.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\ImageResizer\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ImageResizerFiles"" -wxsFilePath $PSScriptRoot\ImageResizer.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ImageResizerAssetsFiles"" -wxsFilePath $PSScriptRoot\ImageResizer.wxs"

#MouseUtils
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName MouseUtilsFiles -wxsFilePath $PSScriptRoot\MouseUtils.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\MouseUtils\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""MouseUtilsFiles"" -wxsFilePath $PSScriptRoot\MouseUtils.wxs"

#MeasureTool
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\MeasureTool\PowerToys.MeasureToolUI.deps.json"" -fileListName MeasureToolFiles -wxsFilePath $PSScriptRoot\MeasureTool.wxs -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""MeasureToolFiles"" -wxsFilePath $PSScriptRoot\MeasureTool.wxs"

#PowerAccent
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\PowerAccent\PowerToys.PowerAccent.deps.json"" -fileListName PowerAccentFiles -wxsFilePath $PSScriptRoot\PowerAccent.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerAccentFiles"" -wxsFilePath $PSScriptRoot\PowerAccent.wxs"

#PowerRename
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PowerRenameFiles -wxsFilePath $PSScriptRoot\PowerRename.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\PowerRename\"" -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PowerRenameAssetsFiles -wxsFilePath $PSScriptRoot\PowerRename.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\PowerRename\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerRenameFiles"" -wxsFilePath $PSScriptRoot\PowerRename.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerRenameAssetsFiles"" -wxsFilePath $PSScriptRoot\PowerRename.wxs"

#Run
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\PowerToys.PowerLauncher.deps.json"" -fileListName launcherFiles -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName launcherImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""launcherFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""launcherImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
## Plugins
###Calculator
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Calculator\Microsoft.PowerToys.Run.Plugin.Calculator.deps.json"" -fileListName calcComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName calcImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Calculator\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""calcComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""calcImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Folder
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Folder\Microsoft.Plugin.Folder.deps.json"" -fileListName FolderComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName FolderImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Folder\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FolderComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FolderImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Program
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Program\Microsoft.Plugin.Program.deps.json"" -fileListName ProgramComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ProgramImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Program\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ProgramComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ProgramImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Shell
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Shell\Microsoft.Plugin.Shell.deps.json"" -fileListName ShellComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ShellImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Shell\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShellComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShellImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Indexer
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Indexer\Microsoft.Plugin.Indexer.deps.json"" -fileListName IndexerComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName IndexerImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Indexer\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""IndexerComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""IndexerImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###UnitConverter
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\UnitConverter\Community.PowerToys.Run.Plugin.UnitConverter.deps.json"" -fileListName UnitConvCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName UnitConvImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\UnitConverter\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UnitConvCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UnitConvImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WebSearch
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WebSearch\Community.PowerToys.Run.Plugin.WebSearch.deps.json"" -fileListName WebSrchCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WebSrchImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WebSearch\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WebSrchCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WebSrchImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###History
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\History\Microsoft.PowerToys.Run.Plugin.History.deps.json"" -fileListName HistoryPluginComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName HistoryPluginImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\History\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HistoryPluginComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HistoryPluginImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Uri
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Uri\Microsoft.Plugin.Uri.deps.json"" -fileListName UriComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName UriImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Uri\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UriComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UriImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###VSCodeWorkspaces
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\VSCodeWorkspaces\Community.PowerToys.Run.Plugin.VSCodeWorkspaces.deps.json"" -fileListName VSCWrkCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName VSCWrkImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\VSCodeWorkspaces\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""VSCWrkCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""VSCWrkImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WindowWalker
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WindowWalker\Microsoft.Plugin.WindowWalker.deps.json"" -fileListName WindowWlkrCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WindowWlkrImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WindowWalker\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WindowWlkrCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WindowWlkrImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###OneNote
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\OneNote\Microsoft.PowerToys.Run.Plugin.OneNote.deps.json"" -fileListName OneNoteComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName OneNoteImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\OneNote\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""OneNoteComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""OneNoteImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Registry
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Registry\Microsoft.PowerToys.Run.Plugin.Registry.deps.json"" -fileListName RegistryComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName RegistryImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Registry\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Service
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Service\Microsoft.PowerToys.Run.Plugin.Service.deps.json"" -fileListName ServiceComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ServiceImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\Service\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ServiceComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ServiceImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###System
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\System\Microsoft.PowerToys.Run.Plugin.System.deps.json"" -fileListName SystemComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SystemImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\System\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SystemComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SystemImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###TimeDate
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\TimeDate\Microsoft.PowerToys.Run.Plugin.TimeDate.deps.json"" -fileListName TimeDateComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName TimeDateImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\TimeDate\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeDateComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeDateImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###TimeZone
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\TimeZone\Microsoft.PowerToys.Run.Plugin.TimeZone.deps.json"" -fileListName TimeZoneComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName TimeZoneImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\TimeZone\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeZoneComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeZoneImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WindowsSettings
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WindowsSettings\Microsoft.PowerToys.Run.Plugin.WindowsSettings.deps.json"" -fileListName WinSetCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WinSetImagesCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WindowsSettings\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinSetCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinSetImagesCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WindowsTerminal
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WindowsTerminal\Microsoft.PowerToys.Run.Plugin.WindowsTerminal.deps.json"" -fileListName WinTermCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WinTermImagesCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\launcher\Plugins\WindowsTerminal\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinTermCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinTermImagesCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
## Plugins

#ShortcutGuide
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ShortcutGuideSvgFiles -wxsFilePath $PSScriptRoot\ShortcutGuide.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\modules\ShortcutGuide\ShortcutGuide\svgs\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShortcutGuideSvgFiles"" -wxsFilePath $PSScriptRoot\ShortcutGuide.wxs"

#TextExtractor
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\modules\PowerOCR\PowerToys.PowerOCR.deps.json"" -fileListName TextExtractorFiles -wxsFilePath $PSScriptRoot\TextExtractor.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TextExtractorFiles"" -wxsFilePath $PSScriptRoot\TextExtractor.wxs"

#Settings
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\x64\Release\Settings\PowerToys.Settings.deps.json"" -fileListName SettingsV2Files -wxsFilePath $PSScriptRoot\Settings.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2AssetsFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\Settings\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2AssetsModulesFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\Settings\Assets\Modules\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2OOBEAssetsModulesFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\Settings\Assets\Modules\OOBE\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2OOBEAssetsFluentIconsFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\x64\Release\Settings\Assets\FluentIcons\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2Files"" -wxsFilePath $PSScriptRoot\Settings.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2AssetsFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2AssetsModulesFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2OOBEAssetsModulesFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2OOBEAssetsFluentIconsFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs"

#WinAppSdk
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinAppSDKFiles"" -wxsFilePath $PSScriptRoot\WinAppSDK.wxs"
