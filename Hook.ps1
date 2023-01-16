[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [semver]$NextVersion
)

[string]$NextVersion | Set-AzPipelineVariable nextVersion -Output
$true | Set-AzPipelineVariable trigger -Output