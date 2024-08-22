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

Write-Output "pagina não respondeu" }