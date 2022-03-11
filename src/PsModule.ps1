# Kapitel 13
'Is nuget package'
Install-Module windows-update -Repository darkweb -Scope CurrentUser
Register-PSRepository -Name darkweb -SourceLocation 'C:\git\Powershell\src\'
Get-PSRepository

# create psd1
New-ModuleManifest -Path .\windows-update.psd1
# in psd1 "public" functions des modules
FunctionsToExport = @("Get-WindowsUpdate")
# in psd1 setzt startup-skript
RootModule = 'windows-update.psm1'
# install
$env:PSModulePath += ";$pwd" # append current 
Import-Module .\windows-update\

#publish
Publish-Module -Name windows-update -Repository darkweb

Update-ModuleManifest