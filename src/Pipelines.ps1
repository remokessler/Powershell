# examples
Get-Process -Name notepad | Stop-Process
# alternative
Stop-Process -Name notepad

$filter = {$_.filter -eq "Pictures"}
$filter.Invoke("x");

Get-Process | Select-Object -ExpandProperty Threads -Property Threads,@{Label="ProcessId";Expression={$_.Id}} -First 5| Format-List

Get-ChildItem | Select-Object Name,@{Label="Child-Count";Expression={(Get-ChildItem $_. | Measure-Object).count}},@{Label="MB";Expression={(Get-ChildItem -Recurse $_  | Measure-Object -sum Length).sum}}

@("Xi","Jana","Ueli") | Select-Object @{Name="Name";Expression={$_}}, @{Name="Gender";Expression={(Invoke-WebRequest -Uri "https://api.genderize.io?name=$_" | ConvertFrom-Json).gender}}

ForEach-Object -Parallel {Write-Host 'hello world'}