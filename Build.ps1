[CmdletBinding()]
param(
    [AllowEmptyString()]
    [Parameter(Mandatory)]
    [string]$Version
)

Remove-Item .\output -Force -Recurse -ErrorAction Ignore
New-Item .\output -ItemType Directory | Out-Null

if ($Version -ne '') {
    Update-ModuleManifest Test.psd1 -ModuleVersion $Version
}

Copy-Item Test.psd1 output
Copy-Item Test.psm1 output
