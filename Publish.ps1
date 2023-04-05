[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ManifestPath,

    [Parameter(Mandatory)]
    [System.Version]$Version
)

Update-ModuleManifest $ManifestPath -ModuleVersion $Version

try {
    $repoName = [string](New-Guid)
    $repoDir = New-Item -ItemType Directory -Path (Join-Path ([System.IO.Path]::GetTempPath()) $repoName)
    Register-PSResourceRepository -Name $repoName -Uri $repoDir

    Publish-PSResource -Path $ManifestPath -Repository $repoName -SkipDependenciesCheck -SkipModuleManifestValidate
    
    $nupkg = Get-ChildItem $repoDir -Filter *.nupkg
    Write-Verbose "Publishing $nupkg"
    dotnet nuget push $nupkg `
        --source https://pkgs.dev.azure.com/william-ellis/_packaging/william-ellis/nuget/v3/index.json `
        --api-key notused
}
finally {
    Unregister-PSResourceRepository -Name $repoName
    Remove-Item $repoDir -Force -Recurse -ErrorAction Ignore
}
