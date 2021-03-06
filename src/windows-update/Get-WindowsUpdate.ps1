function Get-WindowsUpdate {
    $Filter = @{
        ProviderName="Microsoft-Windows-WindowsUpdateClient"
        ID=19
    }
    Get-WinEvent -FilterHashtable $Filter | foreach {
        $rv = $_ | select -Property TimeCreated,Name,Activity,Status
        $rv.Name = $_.Properties[0].Value
        $rv.Activity = $_.KeywordsDisplayNames[0]
        $rv.Status = $_.KeywordsDisplayNames[1]
        $rv
    }    
}