[CmdletBinding()]
param()

Remove-Item .\output -Force -Recurse -ErrorAction Ignore
New-Item .\output -ItemType Directory | Out-Null

Copy-Item Test.psd1 output
Copy-Item Test.psm1 output
