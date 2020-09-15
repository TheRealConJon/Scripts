$datetime = get-date -f yyyy-MM-dd
$vuln2020share = "\\corporate.unificompanies.com\Shared\PUBLIC\PUBLIC-Cincinnati\Legacy\CORP\VulnerabilityMgnt\2020 Vuln Files"
$input = read-host "If this is for the start of week report creation, press T and enter. If it is for a report update during the work week, press F and enter"
if ($input -eq 'T' -or $input -eq 't')
{
    if((Test-Path -Path "C:\VM AVR Work Area\Q-Master Query.xlsx"))
    {
    rename-item "C:\VM AVR Work Area\Q-Master Query.xlsx" -newname "Vuln Report $datetime - FINAL.xlsx"   
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - FINAL.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied FINAL.xlsx to Vuln2020" 
    }
}
Else { Write-Host "Final.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master Query with SR Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master Query with SR Info via DNS.xlsx" -newname "Vuln Report $datetime - FINAL & SRs_updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - FINAL & SRs_updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied Final & SRs.xlsx to Vuln2020"
    }
} 
Else { Write-Host "Final & SRs.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-AllAssets-With-LOB-User-SR-via-DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-AllAssets-With-LOB-User-SR-via-DNS.xlsx" -newname "Vuln Report $datetime - AllAssets - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - AllAssets - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied AllAssets.xlsx to Vuln2020"
    }
} 
Else { Write-Host "AllAssets.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-Confirmed Exploitable-With-SR-Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-Confirmed Exploitable-With-SR-Info via DNS.xlsx" -newname "Vuln Report $datetime - ConfExploitable - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - ConfExploitable - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied ConfExploitable.xlsx to Vuln2020"
    }
} 
Else { Write-Host "ConfExploitable.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-PCI-Vulns-With-SR-Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-PCI-Vulns-With-SR-Info via DNS.xlsx" -newname "Vuln Report $datetime - PCI - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - PCI - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied PCI.xlsx to Vuln2020"
    }
} 
Else { Write-Host "PCI.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-PlatformServices-With-SR-Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-PlatformServices-With-SR-Info via DNS.xlsx" -newname "Vuln Report $datetime - PlatServices - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - PlatServices - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied PlatServices.xlsx to Vuln2020"
    }
} 
Else { Write-Host "PlatServices.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx"))
{
rename-item "C:\VM AVR Work Area\Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx" -newname "$datetime Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx"   
if (Test-Path $vuln2020share) {
    Copy-Item -Path "C:\VM AVR Work Area\$datetime Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx" -Destination "$vuln2020share" -Force
    Write-Progress -Activity "Copied EP-Confirmed-RTI.xlsx to Vuln2020" 
}
}
Else { Write-Host "EP-Confirmed-RTI.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx"))
{
rename-item "C:\VM AVR Work Area\Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx" -newname "$datetime Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx"   
if (Test-Path $vuln2020share) {
    Copy-Item -Path "C:\VM AVR Work Area\$datetime Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx" -Destination "$vuln2020share" -Force
    Write-Progress -Activity "Copied SRV-Confirmed-RTI.xlsx to Vuln2020" 
}
}
Else { Write-Host "SRV-Confirmed-RTI.xlsx file is not found to copy"}
}
elseif ($input -eq 'F' -or $input -eq 'f') {
    $inputdate = read-host "What Monday were the reports originally ran? Please enter in a yyyy-mm-dd format:"
    if((Test-Path -Path "C:\VM AVR Work Area\Q-Master Query.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master Query.xlsx" -newname "Vuln Report $datetime - FINAL.xlsx"   
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $datetime - FINAL.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied FINAL.xlsx to Vuln2020"
    }
}
Else { Write-Host "Final.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master Query with SR Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master Query with SR Info via DNS.xlsx" -newname "Vuln Report $inputdate - FINAL & SRs_updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $inputdate - FINAL & SRs_updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied FINAL & SRs.xlsx to Vuln2020"
    }
} 
Else { Write-Host "Final & SRs.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-AllAssets-With-LOB-User-SR-via-DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-AllAssets-With-LOB-User-SR-via-DNS.xlsx" -newname "Vuln Report $inputdate - AllAssets - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $inputdate - AllAssets - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied AllAssets.xlsx to Vuln2020"
    }
} 
Else { Write-Host "AllAssets.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-Confirmed Exploitable-With-SR-Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-Confirmed Exploitable-With-SR-Info via DNS.xlsx" -newname "Vuln Report $inputdate - ConfExploitable - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $inputdate - ConfExploitable - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied ConfExploitable.xlsx to Vuln2020"
    }
} 
Else { Write-Host "ConfExploitable.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-PCI-Vulns-With-SR-Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-PCI-Vulns-With-SR-Info via DNS.xlsx" -newname "Vuln Report $inputdate - PCI - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $inputdate - PCI - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied PCI.xlsx to Vuln2020"
    }
} 
Else { Write-Host "PCI.xlsx file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Master-PlatformServices-With-SR-Info via DNS.xlsx"))
{
    rename-item "C:\VM AVR Work Area\Q-Master-PlatformServices-With-SR-Info via DNS.xlsx" -newname "Vuln Report $inputdate - PlatServices - With AppMgrs & SRs Updated $datetime.xlsx"  
    if (Test-Path $vuln2020share) {
        Copy-Item -Path "C:\VM AVR Work Area\Vuln Report $inputdate - PlatServices - With AppMgrs & SRs Updated $datetime.xlsx" -Destination "$vuln2020share" -Force
        Write-Progress -Activity "Copied PlatServices.xlsx to Vuln2020"
    }
}
Else { Write-Host "PlatServices.xlsx file is not found to copy"} 
if((Test-Path -Path "C:\VM AVR Work Area\Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx"))
{
rename-item "C:\VM AVR Work Area\Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx" -newname "$datetime Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx"   
if (Test-Path $vuln2020share) {
    Copy-Item -Path "C:\VM AVR Work Area\$datetime Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx" -Destination "$vuln2020share" -Force
    Write-Progress -Activity "Copied EP-Confirmed-RTI.xlsx to Vuln2020" 
}
}
Else { Write-Host "EP-Confirmed-RTI.xlsx file is not found to copy"}
}
if((Test-Path -Path "C:\VM AVR Work Area\Q-Risk-Priorities-EP-Confirmed-With-QTP-RTI.xlsx"))
{
rename-item "C:\VM AVR Work Area\Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx" -newname "$datetime Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx"   
if (Test-Path $vuln2020share) {
    Copy-Item -Path "C:\VM AVR Work Area\$datetime Q-Risk-Priorities-SRV-Confirmed-With-QTP-RTI.xlsx" -Destination "$vuln2020share" -Force
    Write-Progress -Activity "Copied SRV-Confirmed-RTI.xlsx to Vuln2020" 
}
}

else {
    Write-Output "Please only enter T or F"
}