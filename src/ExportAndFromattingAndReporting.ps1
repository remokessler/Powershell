# todo from ppt
Format-Table
ft

Format-List
fl


Out-Host -Paging

ls;ls;ls --> nacheinander ausgeben / mehrere befehle ausühren

Out-Null
$null = ls
# $null ist immer null und effizienter als out-null
ls >> my.txt #append
ls > my.txt #write
Out-File -Append
Export-Csv -IncludeTypeInformation
Export-Clixml #xml export

ConvertTo-SecureString
ConvertFrom-SecureString -AsPlainText