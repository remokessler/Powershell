$env:Path -split ';'

Start-Process -WorkingDirectory 'C:/git' -WindowStyle Maximized

# dos commands
choice /C ync /T 5 /D n /M "You sure mate?"

# -- disables powershell syntax checking
npm run-script build --prod

# gives 'y' as input to xcopy to stdIn
'y' | xcopy.exe /p source.txt

# 0 == good, not 0 == bad
$LASTEXITCODE

# LASTEXITODE != error
# cmdlets schmeissen errors, tools geben nur Exitcodes

trap { Write-Error 'Oh no'; exit 1}

# gibt alle treiber retour /FO == format | ConvertFrom-Csv creates PSObject
driverquery.exe /FO csv | ConvertFrom-Csv

(Invoke-WebRequest -uri https://raw.githubusercontent.com/dotnet/core/main/release-notes/releases-index.json | ConvertFrom-Json).'releases-index' 
| Where-Object {$_.'support-phase' -ne 'eol'} 
| ForEach-Object {((Invoke-WebRequest $_.'releases.json' | ConvertFrom-Json).releases | select -First 1).runtime.files 
    | Where-Object {$_.url -like '*x64.exe'} 
    | ForEach-Object { Invoke-WebRequest -uri $_.url -OutFile "c:/git/dotnets/$(Split-Path -Path $_.url -Leaf)"}}



Wait-Process -Name 'excel' -Timeout 10

# pwsh ist der prozess für powershell
# bash oder für Scheduled Tasks
pswh -NoProfile -Command { Write-Host "Hello World"}


# Ps variante von Scheduled Tasks
Register-ScheduledJob -FilePath 'C:/git/src/BasicCommands.ps1' -Name 'Superscript' -RunNow

# Register Scheduled Task
Register-ScheduledTask 'HiPs1' -InputObject (New-ScheduledTask -Action (New-ScheduledTaskAction -Execute {pwsh.exe -Command {Write-Host 'Hi Ps'}}))


# dynamisches hinzufügen von eigenschaften | label muss unique sein
1,2,3 | Select-Object @{Label="Age";Expression={"3"}} -Unique -Last 1 -Skip 2

ConvertFrom-Csv
ConvertTo-Csv

Group-Object
1,2,3 | ForEach-Object {'abc'; Get-Date}

Compare-Object @(1,2,3) @(2,3,4)