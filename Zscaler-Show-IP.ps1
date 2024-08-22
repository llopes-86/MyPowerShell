<#
.SYNOPSIS
Retrieves the public IP address from http://ip.zscaler.com/

.DESCRIPTION
This script sends an HTTP request to http://ip.zscaler.com/ and extracts the public IP address from the response.

.PARAMETER None
This script does not take any parameters.

.EXAMPLE
.\Get-PublicIpAddress.ps1
This will output the public IP address, for example: "192.168.1.100"

.NOTES
This script assumes that the http://ip.zscaler.com/ website returns a JSON response with a "srcip" field containing the public IP address.
#>

try { 
    $url = Invoke-WebRequest "http://ip.zscaler.com/" 
} 
catch { 
    Write-Host -f Red "pagina não encontrada" $_.Exception.Message 
    return
}

if ($url.StatusCode -eq '200') {
    ($url.InputFields.value | ConvertFrom-Json | select -exp srcip)
} else {
    Write-Output "pagina não respondeu"
}