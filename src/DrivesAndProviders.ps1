# List all Providers. FS, Registry, Env Vars, Functions, Variables
Get-PSProvider

# changing into registry provider
cd HKCU:
cd Env:


# Filter Child Items
Get-ChildItem -Filter -Include -Exclude
# Get-ChildItems -Filters --> filtert auf FS ebene. Include und Exclude erst danach.
# -include has to have a path with an Asteristk *

Set-Location
Push-Location
Pop-Location

Get-Item
Clear-Content # Clear-Item is the equivalent just for variables / registry keys etc not for files
Invoke-Item # Default behaviour:  double click on item
Copy-Item
Move-Item
New-Item
Remove-Item
Rename-Item
Set-Item # set properties of items

Get-Member


Get-Content # get file content
Set-Content # override
Add-Content # append
Clear-Content


Convert-Path # PS Pfad zu Windows Pfad
Join-Path
Resolve-Path
Split-Path
Test-Path


Set-ItemProperty
Rename-ItemProperty
Set-ItemProperty -Path . -Name '' -Value


# Setting of env variables
[System.Environment]::SetEnvironmentVariable("PATH", $env:Path, [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable("PATH", $env:Path, [System.EnvironmentVariableTarget]::User)

# new PSDrive
New-PSDrive -Name psscripts -Root "$HOME\Documents\WindowsPowerShell" -PSProvider FileSystem


Convert-Path 'c:/git'
Convert-Path .
Join-Path 'c:' 'git'
Resolve-Path .
Split-Path -Path . -Resolve

Get-ChildItem -path 'function:/*' -Include Write*

if ( Test-Path -Path 'c:/git' )
{
    Write-Host 'c:/git'
}

New-Item -Name test.txt -ItemType File -Value 'Inhalt der Testdatei' | Invoke-Item
Set-ItemProperty -Path .\myitem.txt -Value (Get-Date 24.12.2021 -Hour 8) -Name CreationTime

Measure-Command { Get-ChildItem -Recurse -Filter *.exe -ErrorAction SilentlyContinue } # 16 ms
Measure-Command { Get-ChildItem -Recurse * -Include *.exe -ErrorAction SilentlyContinue } # 171 ms

Get-ChildItem -Recurse -Filter *.ps1 | Select-String -Pattern 'ItemProperty' | select Path