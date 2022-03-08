# cmdlet --> tab
function Verb-Noun {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    begin {   
    }
    process {
        # if -WhatIf:$true
        if ($PSCmdlet.ShouldProcess()) {
            #do stuff
        }
    }
    end { }
}

# ex-cmdlet --> example commandlet