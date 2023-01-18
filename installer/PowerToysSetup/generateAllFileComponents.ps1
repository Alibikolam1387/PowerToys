#AwakeFiles
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\Awake\PowerToys.Awake.deps.json"" -fileListName AwakeFiles -wxsFilePath $PSScriptRoot\Awake.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""AwakeFiles"" -wxsFilePath $PSScriptRoot\Awake.wxs"

#ColorPicker
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\ColorPicker\PowerToys.ColorPickerUI.deps.json"" -fileListName ColorPickerFiles -wxsFilePath $PSScriptRoot\ColorPicker.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ColorPickerFiles"" -wxsFilePath $PSScriptRoot\ColorPicker.wxs"

#FancyZones
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\FancyZones\PowerToys.FancyZonesEditor.deps.json"" -fileListName FancyZonesFiles -wxsFilePath $PSScriptRoot\FancyZones.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FancyZonesFiles"" -wxsFilePath $PSScriptRoot\FancyZones.wxs"

#FileExplorerAdd-ons
#TODO: There are multiple .deps.json files, make sure it works as expected
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\FileExplorerPreview\PowerToys.SvgThumbnailProvider.deps.json"" -fileListName PowerPreviewFiles -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerPreviewFiles"" -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs"

#FileLocksmith
#TODO: There are multiple .deps.json files, make sure it works as expected
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\FileLocksmith\PowerToys.FileLocksmithUI.deps.json"" -fileListName FileLocksmithFiles -wxsFilePath $PSScriptRoot\FileLocksmith.wxs -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FileLocksmithFiles"" -wxsFilePath $PSScriptRoot\FileLocksmith.wxs"

#Hosts
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\Hosts\PowerToys.Hosts.deps.json"" -fileListName HostsFiles -wxsFilePath $PSScriptRoot\Hosts.wxs -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HostsFiles"" -wxsFilePath $PSScriptRoot\Hosts.wxs"

#ImageResizer
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\ImageResizer\PowerToys.ImageResizer.deps.json"" -fileListName ImageResizerFiles -wxsFilePath $PSScriptRoot\ImageResizer.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ImageResizerFiles"" -wxsFilePath $PSScriptRoot\ImageResizer.wxs"

#MeasureTool
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\MeasureTool\PowerToys.MeasureToolUI.deps.json"" -fileListName MeasureToolFiles -wxsFilePath $PSScriptRoot\MeasureTool.wxs -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""MeasureToolFiles"" -wxsFilePath $PSScriptRoot\MeasureTool.wxs"

#PowerAccent
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\PowerAccent\PowerToys.PowerAccent.deps.json"" -fileListName PowerAccentFiles -wxsFilePath $PSScriptRoot\PowerAccent.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerAccentFiles"" -wxsFilePath $PSScriptRoot\PowerAccent.wxs"

#PowerRename
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PowerRenameFiles -wxsFilePath $PSScriptRoot\PowerRename.wxs -depsPath "".\..\..\x64\Release\modules\PowerRename\"" -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerRenameFiles"" -wxsFilePath $PSScriptRoot\PowerRename.wxs"

#Run
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\PowerToys.PowerLauncher.deps.json"" -fileListName launcherFiles -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName launcherImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""launcherFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""launcherImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
## Plugins
###Calculator
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Calculator\Microsoft.PowerToys.Run.Plugin.Calculator.deps.json"" -fileListName calcComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""calcComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Folder
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Folder\Microsoft.Plugin.Folder.deps.json"" -fileListName FolderComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName FolderImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\Folder\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FolderComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FolderImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Program
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Program\Microsoft.Plugin.Program.deps.json"" -fileListName ProgramComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ProgramImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\Program\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ProgramComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ProgramImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Shell
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Shell\Microsoft.Plugin.Shell.deps.json"" -fileListName ShellComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ShellImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\Shell\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShellComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShellImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Indexer
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Indexer\Microsoft.Plugin.Indexer.deps.json"" -fileListName IndexerComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName IndexerImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\Indexer\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""IndexerComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""IndexerImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###UnitConverter
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\UnitConverter\Community.PowerToys.Run.Plugin.UnitConverter.deps.json"" -fileListName UnitConvCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UnitConvCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WebSearch
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\WebSearch\Community.PowerToys.Run.Plugin.WebSearch.deps.json"" -fileListName WebSrchCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WebSrchCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###History
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\History\Microsoft.PowerToys.Run.Plugin.History.deps.json"" -fileListName HistoryPluginComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HistoryPluginComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Uri
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Uri\Microsoft.Plugin.Uri.deps.json"" -fileListName UriComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UriComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###VSCodeWorkspaces
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\VSCodeWorkspaces\Community.PowerToys.Run.Plugin.VSCodeWorkspaces.deps.json"" -fileListName VSCWrkCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""VSCWrkCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WindowWalker
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\WindowWalker\Microsoft.Plugin.WindowWalker.deps.json"" -fileListName WindowWlkrCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WindowWlkrImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\WindowWalker\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WindowWlkrCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WindowWlkrImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###OneNote
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\OneNote\Microsoft.PowerToys.Run.Plugin.OneNote.deps.json"" -fileListName OneNoteComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""OneNoteComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Registry
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Registry\Microsoft.PowerToys.Run.Plugin.Registry.deps.json"" -fileListName RegistryComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###Service
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\Service\Microsoft.PowerToys.Run.Plugin.Service.deps.json"" -fileListName ServiceComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ServiceComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###System
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\System\Microsoft.PowerToys.Run.Plugin.System.deps.json"" -fileListName SystemComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SystemImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\System\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SystemComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SystemImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###TimeDate
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\TimeDate\Microsoft.PowerToys.Run.Plugin.TimeDate.deps.json"" -fileListName TimeDateComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName TimeDateImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath "".\..\..\x64\Release\modules\launcher\Plugins\TimeDate\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeDateComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeDateImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###TimeZone
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\TimeZone\Microsoft.PowerToys.Run.Plugin.TimeZone.deps.json"" -fileListName TimeZoneComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeZoneComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WindowsSettings
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\WindowsSettings\Microsoft.PowerToys.Run.Plugin.WindowsSettings.deps.json"" -fileListName WinSetCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinSetCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
###WindowsTerminal
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\launcher\Plugins\WindowsTerminal\Microsoft.PowerToys.Run.Plugin.WindowsTerminal.deps.json"" -fileListName WinTermCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinTermCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs"
## Plugins

#TextExtractor
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson "".\..\..\x64\Release\modules\PowerOCR\PowerToys.PowerOCR.deps.json"" -fileListName TextExtractorFiles -wxsFilePath $PSScriptRoot\TextExtractor.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TextExtractorFiles"" -wxsFilePath $PSScriptRoot\TextExtractor.wxs"
