function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$TimeZone
	)

    [string]$CurrentTZ = Invoke-Command {tzutil /g}
    Write-Verbose "Current TZ Setting is $CurrentTZ"

	$returnValue = @{
		TimeZone = $CurrentTZ
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$TimeZone
	)

    try
    {
        [string]$CurrentTZ = Invoke-Command {tzutil /g}
        Write-Verbose "Setting TZ Setting to $TimeZone"
        Invoke-Command {tzutil /s $TimeZone}
    }
    catch
    {
        
    }
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$TimeZone
	)

    try
    {
        [string]$CurrentTZ = Invoke-Command {tzutil /g}
        Write-Verbose "Current TZ Setting is $CurrentTZ"

        if ($CurrentTZ -like $TimeZone)
        {
            Write-Verbose "TZ setting is consistent"
            $result = $true
        }
        else
        {
            Write-Verbose "TZ setting is inconsistent"
            $result = $false
        }

    }
    catch
    {
        
    }

	$result
}

Export-ModuleMember -Function *-TargetResource
