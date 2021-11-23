Start-Process "C:/windows/system32/dir.exe"
&"C:/windows/system32/dir.exe" # only use when path contains whitespace characters

ipconfig # returns a string

# Regex
ipconfig | Select-String '(?<=(IPv4.*))([0-9]{1,3}\.){3}([0-9]{1,3})' | ForEach-Object { $_.Matches.Groups[0].Value}