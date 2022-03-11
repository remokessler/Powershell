# 1
# 1.1: dotnet framework
# 1.2.1
Get-PSProvider
# 1.2.2
Get-PSProvider # spalte drive
# 1.3.1
Get-Command -Verb export
# 1.3.2
Get-ChildItem | Select-Object X,Y,Z
# 1.4
Copy-Item -Path C:\temp -Destination C:\temp2 -Recurse
# 1.5
ForEach-Object | % | foreach
Where-Object | ? | where
# 1.6
New-Alias -Name tgif -Value Stop-Computer
# 1.7
Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\
# 1.8
$users | select Username,Parent
# 1.9
(Get-ChildItem c:/temp | select Length | Measure-Command Length -sum).sum
# 2.1
Test-Path $users # is var set or not
# 2.2
Write-Host -ForegroundColor Blue ($size/1GB)
# 2.3
Get-ChildItem -R c:/temp | sort Length | select -Last 10
# 2.4
Measure-Command {}
# 2.5
Get-ChildItem -R *.iso | sort Length | select -Last 3 | Remove-Item -Confirm
# 1.10
$env:PSModulePath -split ';'
# 1.11
$env:PSModulePath += ";$PWD"
# 1.12
Set-PSRepository -SourceLocation c:/temp -PublishLocation
# 1.13
function Say-Hello {
    [CmdletBinding()]
    param (
        [string[]] $name
    )
    begin{
        Write-Host 'Hello'
    }
    process{
        Write-Host $name
    }
    end{
        Write-Host 'bye'
    }
    
}