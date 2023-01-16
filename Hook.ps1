[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [semver]$NextVersion
)

[string]$NextVersion | Set-AzPipelineVariable nextVersion
$true | Set-AzPipelineVariable triggerRelease