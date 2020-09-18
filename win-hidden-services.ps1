<#
.SYNOPSIS
    Hide or Unhide Windows services 
.DESCRIPTION
    Windows allows a service to hide by manipulating its security descriptor. Using SDDL (Service Descriptor Definition Language) services can be hidden an unhidden. Thanks to a lovely post by Harry Johnston at Stackoverflow here: https://stackoverflow.com/questions/25736268/how-to-register-a-windows-service-but-avoid-it-being-listed-in-the-services-cons/25736814#25736814. 
.EXAMPLE
    
.NOTES
    Author: Chris Dale 
    Date:   2020.09.14
#>

[CmdletBinding()]
   param (
		[bool]$hide,
		[bool]$unhide,
        [string]$name
    )

if ($name -eq $null) {
		Write-Host "Select a service name" -ForegroundColor Red
	Get-Service | %{Write-Host $_.Name -ForegroundColor Blue} 
	$choice = Read-Host -Prompt "Type in service name..."
}

function Hide-Service {

	#sc sdset $name D:(D;;DCLCWPDTSD;;;IU)(D;;DCLCWPDTSD;;;SU)(D;;DCLCWPDTSD;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)
}

function Unhide-Service {
   

	#for /f "tokens=5 delims=\" %s in ('reg query hklm\system\currentcontrolset\services\') do @sc query "%s" 1>nul 2>&1|| @reg query "hklm\system\currentcontrolset\services\%s" /v objectname 1>nul 2>&1 && echo %s
	#for /f "tokens=5 delims=\" %s in ('reg query hklm\system\currentcontrolset\services\') do @reg query "hklm\system\currentcontrolset\services\%s" /v objectname 1>nul 2>&1 && echo %s

	#sc sdset $name D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)
}


