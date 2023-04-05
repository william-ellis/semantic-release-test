[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ManifestPath,

    [Parameter(Mandatory)]
    [System.Version]$Version
)

Update-ModuleManifest $ManifestPath -ModuleVersion $Version
Publish-PSResource -Path $ManifestPath -Repository LocalRepo -SkipDependenciesCheck -SkipModuleManifestValidate
