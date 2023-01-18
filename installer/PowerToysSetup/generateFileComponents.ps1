[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True, Position = 1)]
    [string]$fileListName,
    [Parameter(Mandatory = $True, Position = 2)]
    [string]$wxsFilePath
)

$wxsFile = Get-Content $wxsFilePath;

$wxsFile | ForEach-Object {
    if ($_ -match "(<?define $fileListName=)(.*)\?>") {
        [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'fileList',
        Justification = 'variable is used in another scope')]

        $fileList = $matches[2] -split ';'
        return
    }
}

$componentDefs = "`r`n"

foreach ($file in $fileList) {
    $componentDefs +=
@"
        <Component Id="$($fileListName)_Comp_$($file)" Win64="yes">
          <File Id="$($fileListName)_File_$($file)" Source="`$(var.$($fileListName)Path)\$($file)" />
        </Component>`r`n
"@
}

$wxsFile = $wxsFile -replace "\s+(<!--$($fileListName)_Component_Def-->)", $componentDefs

Set-Content -Path $wxsFilePath -Value $wxsFile