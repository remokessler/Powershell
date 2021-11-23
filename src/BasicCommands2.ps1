Install-Module PSWriteHHTML -Scope CurrentUser

#get trusted repository
Get-PSRepository 

Get-Command

# sorts objects by attribute
group-object attribute

# measure execution length
Measure-command { Get-ChildItem .\Thema2_AnalyseFiles\ | Where-Object { $_.Name.ToLower() -like 'a*' -or $_.Name.ToLower() -like 'w*' } }

# whatif example this way it does nothing
Get-ChildItem .\Thema2_AnalyseFiles\ | Where-Object { $_.Name.ToLower() -like 'a*' -or $_.Name.ToLower() -like 'w*' } -PipelineVariable $_.path | Remove-Item -WhatIf


# confirm
Stop-Service -Confirm -Name BITS


$true # == true
$false


# load a psm1
Import-Module .\myPsm1.psm1
Remove-Module Hello-World
# see if module is installed
Get-InstalledModule

# search in powershellgallery.com
Find-Module