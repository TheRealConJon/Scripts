Set-ExecutionPolicy -ExecutionPolicy Bypass
$abacus = "\\corporate.unificompanies.com\Shared\PUBLIC\PUBLIC-Cincinnati\Legacy\CORP\VulnerabilityMgnt\AbacusExtract"
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\1.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\1.csv" -newname "QTP-RTI-PredictedHighRisk.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-PredictedHighRisk.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied PredictedHighRisk.csv to abacus"
    }
} 
Else { Write-Host "PredictedHighRisk.csv file is not found to copy"}
    if((Test-Path -Path "C:\VM AVR Work Area\Downloads\2.csv"))
    {
    rename-item "C:\VM AVR Work Area\Downloads\2.csv" -newname "QTP-RTI-ActiveAttacks.csv"   
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-ActiveAttacks.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied ActiveAttacks to abacus" 
    }
}
Else { Write-Host "ActiveAttacks file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\3.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\3.csv" -newname "QTP-RTI-Wormable.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-Wormable.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied Wormable.csv to abacus"
    }
} 
Else { Write-Host "Wormable.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\4.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\4.csv" -newname "QTP-RTI-ExploitKit.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-ExploitKit.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied ExploitKit.csv to abacus"
    }
} 
Else { Write-Host "ExploitKit.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\5.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\5.csv" -newname "QTP-RTI-PublicExploit.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-PublicExploit.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied PublicExploit.csv to abacus"
    }
} 
Else { Write-Host "PublicExploit.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\6.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\6.csv" -newname "QTP-RTI-HighLateralMovement.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-HighLateralMovement.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied HighLateralMovement.csv to abacus"
    }
} 
Else { Write-Host "HighLateralMovement.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\7.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\7.csv" -newname "QTP-RTI-HighDataLoss.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-HighDataLoss.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied highDataLoss.csv to abacus"
    }
} 
Else { Write-Host "highDataLoss.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\8.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\8.csv" -newname "QTP-RTI-Malware.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-Malware.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied Malware.csv to abacus"
    }
} 
Else { Write-Host "Malware.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\9.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\9.csv" -newname "QTP-RTI-DenialOfService.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-DenialOfService.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied DenialofService to abacus"
    }
} 
Else { Write-Host "DenialofService file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\10.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\10.csv" -newname "QTP-RTI-EasyExploit.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-EasyExploit.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied EasyExploit.csv to abacus"
    }
} 
Else { Write-Host "EasyExploit.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\11.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\11.csv" -newname "QTP-RTI-UnauthenticatedExploitation.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-UnauthenticatedExploitation.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied UnauthenticatedExploitation.csv to abacus"
    }
} 
Else { Write-Host "UnauthenticatedExploitation.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\12.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\12.csv" -newname "QTP-RTI-RemoteCodeExecution.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-RemoteCodeExecution.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied RemoteCodeExecution.csv to abacus"
    }
} 
Else { Write-Host "RemoteCodeExecution.csv.csv file is not found to copy"}
if((Test-Path -Path "C:\VM AVR Work Area\Downloads\13.csv"))
{
    rename-item "C:\VM AVR Work Area\Downloads\13.csv" -newname "QTP-RTI-PrivilegeEscalation.csv"  
    if (Test-Path $abacus) {
        Copy-Item -Path "C:\VM AVR Work Area\Downloads\QTP-RTI-PrivilegeEscalation.csv" -Destination "$abacus" -Force
        Write-Progress -Activity "Copied PrivilegeEscalation.csv.csv to abacus"
    }
} 
Else { Write-Host "PrivilegeEscalation.csv file is not found to copy"}

