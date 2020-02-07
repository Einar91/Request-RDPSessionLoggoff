<#
.SYNOPSIS
The template gives a good starting point for creating powershell functions and tools.
Start your design with writing out the examples as a functional spesification.
.DESCRIPTION
.PARAMETER
.EXAMPLE
#>

function Request-CybRDPSessionLoggoff {
    [CmdletBinding()]
    #^ Optional ..Binding(SupportShouldProcess=$True,ConfirmImpact='Low')
    param (
    [Parameter(Mandatory=$True,
        ValueFromPipeline=$True,
        ValueFromPipelineByPropertyName=$True)]
    [Alias('CN','MachineName','HostName','Name')]
    [string[]]$ComputerName,

    [Parameter(ValueFromPipelineByPropertyName=$True)]
    [INT]$ID,

    [string]$Username
    )

BEGIN {
    # Intentionaly left empty.
    # Provides optional one-time pre-processing for the function.
    # Setup tasks such as opening database connections, setting up log files, or initializing arrays.
}

PROCESS {
    foreach($computer in $ComputerName){
        Write-Verbose "Requesting logoff for session ID $ID on $computer"
        logoff $ID /server:$computer /V
    }
}


END {
    # Intentionaly left empty.
    # This block is used to provide one-time post-processing for the function.
}

} #Function