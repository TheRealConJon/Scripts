$GetDNSRoot = Get-ADDomain -Current LocalComputer | Select-Object DNSRoot
$Domain = $GetDNSRoot.DNSRoot
$BizcoLTserviceName = 'BIZLT'
$LabtechServiceName = 'LTService'
$InstallerPath = "\\"+$Domain+"\NETLOGON\Agent_Install.MSI"
$UnInstallerPath = "\\"+$Domain+"\NETLOGON\Agent_Uninstall.exe"
$StartTime = Get-Date
$CSV_LogDate = Get-Date -Format MMddyyyy
$LogDate = Get-Date -Format MM-dd-yyyy_HHmmss
$LogPath = "C:\Labtech Logs\LT_PS_Ins_Log_"+$LogDate+".txt"
$LtNotInstalled = "Labtech agent not installed on "
$LtTryingToInstall = ", Trying to install the Bizco Labtech Agent"
$CSV_Log_Path = "C:\Labtech Logs\LT_Log_"+$CSV_LogDate+".csv"
$DeviceCount = 0
$LogEntry = "Scan Started on $StartTime"
$DaysInactive = 90
$time = (Get-Date).Adddays(-($DaysInactive))

Add-Content -Path $LogPath -Value $LogEntry
Write-Host $LogEntry
$CSV_Exists = Test-Path $CSV_Log_Path
If ($CSV_Exists -eq $False)
    {
        Add-Content -Path $CSV_Log_Path -Value "Computer,Status,Date"
    }

$LogEntry = "Scan Started on $StartTime"
Add-Content -Path $LogPath -Value $LogEntry
Write-Host $LogEntry
Foreach ($Computer in Get-ADComputer -Filter {LastLogonTimeStamp -gt $time} -ResultPageSize 2000 -resultSetSize $null | Select-Object -ExpandProperty dnshostname)  ## Get all computers from AD and loop through them
{
    $DeviceCount++
    $LogCSV = " "
    IF ((Test-Connection -Cn $Computer -BufferSize 16 -count 1 -ea 0 -Quiet) -eq "True") ## Check if computers respond to ping
        {
            $CurrentDate = Get-Date
            $PSHostName = "\\"+$Computer
            $LTService = Get-Service -Name $LabtechServiceName -ComputerName $Computer -ErrorAction SilentlyContinue
            If ($LTService.Status -ne "Running")  # If labtech agent is not running
                {   #install the Labtech Agent
                    $LogEntry = $LtNotInstalled+$Computer+$LtTryingToInstall
                    Add-Content -Path $LogPath -Value $LogEntry
                    Write-Host $LogEntry
                    & C:\scripts\psexec.exe $PSHostName -s msiexec.exe /i $InstallerPath /qn 2>&1 | Out-Null
                    IF ($lastexitcode -eq 0) # If True Install Succeded
                        {   
                            $LogEntry = "Labtech installation is complete on $Computer" 
                            $LogCSV = "$Computer,Installed,$CurrentDate"
                        }
                    Else # Installed failed
                        {   
                            $LogEntry = "$IP -- Error !!! Labtech was not installed successfully $Computer" 
                            $LogCSV = "$Computer,Failed - No agent previously installed,$CurrentDate"
                        }                                                 
                                
                }
            Else  #  If Labtech Agent is Running
                {
                    If ($LTService.DisplayName -eq $BizcoLTserviceName)  # Check for Bizco's Labtech Agent
                        {
                            $LogEntry = "Bizco Labtech agent is already installed on $Computer"
                            $LogCSV = "$Computer,Already Installed,$CurrentDate"
                        }
                    Else # Other Agent is installed   
                        {
                                & C:\scripts\psexec.exe $PSHostName -s $UnInstallerPath 2>&1 | Out-Null  #Delete the Agent
                                IF ($lastexitcode -eq 0) #If True Agent Uninstalled successfully
                                    {  
                                        $LogEntry = $LTService.DisplayName+" was uninstalled from "+$Computer
                                        Write-Host $LogEntry
                                        Add-Content -Path $LogPath -Value $LogEntry
                                        # Install Bizco Labtech Agent #
                                        $LogEntry = "Trying to install install the Bizco Labtech Agent on $Computer"
                                        Add-Content -Path $LogPath -Value $LogEntry
                                        Write-Host $LogEntry
                                        $PSHostName = "\\"+$Computer
                                        & C:\scripts\psexec.exe $PSHostName -s msiexec.exe /i $InstallerPath /qn 2>&1 | Out-Null
                                        IF ($lastexitcode -eq 0) # If True Install Succeded
                                            {   
                                                $LogEntry = "Labtech installation is complete on $Computer"
                                                $LogCSV = "$Computer,Installed - Removed Previous Agent,$CurrentDate"
                                            }
                                        Else # Install Failed
                                            {   
                                                $LogEntry = "!!! Error !!! The Labtech failed to install on $Computer"
                                                $LogCSV = "$Computer,Labtech agent install failed - failed to install after previus agent was uninstall,$CurrentDate"                                                   
                                            }
                                    }
                                Else # Could not remove agent - Not installing agent
                                    {  
                                        $LogEntry = "!!! Error !!! Could not remove "+$LTService.DisplayName+" from "+$Computer+", The Bizco Agent will not be isntalled"
                                        $LogCSV = "$Computer,Labtech agent install failed - Previous agent did not uninstall,$CurrentDate" 
                                    }
                            }
                                
                }
                                      
        }   
    Else
        {
            $LogEntry = $Computer+" Did not respond to ping"
        }
    Write-Host "$DeviceCount $LogEntry"
    Add-Content -Path $LogPath -Value $LogEntry
    If ($LogCSV -ne " ")
        {
            Add-Content -Path $CSV_Log_Path -Value $LogCSV
        }
}