Set-ExecutionPolicy Unrestricted

Get-Command -Verb Write -Noun Host

# [myParam] == Optional | {param1, param2} == Options of params | myParam == mandatory without brackets
Get-Help Get-Service -Full -Online

# Displays Object + it's Props and Methodes
Get-Service | Get-Member

# Change Display of object, Format-List expresses as list and not as table
Get-Service | Select-Object -Property Name, ServiceType, Status | Format-List

# saves all commands as a file and stop to save
Start-Transcript
Stop-Transcript

# search in list $_ == current object
Get-Service | Where-Object { $_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic'}

# use c# in powershell :: for static methods
[Math]::Pow(10, 100);