$GetDNSRoot = Get-ADDomain -Current LocalComputer | Select-Object DNSRoot
$Domain = $GetDNSRoot.DNSRoot
$ServiceName = 'CylanceSvc'
$InstallerPath_x64 = "\\"+$Domain+"\NETLOGON\CylanceProtect_x64.MSI"
$InstallerPath_x86 = "\\"+$Domain+"\NETLOGON\CylanceProtect_x86.MSI"
$StartTime = Get-Date
$LogDate = Get-Date -Format MM-dd-yyyy_HHmmss
$CSV_LogDate = Get-Date -Format MMddyyyy
$LogPath = "C:\Cylance Push Logs\Cylance_Ins_Log_"+$LogDate+".txt"
$CylanceNotInstalled = "Cylance agent not installed on "
$CylanceTryingToInstall = ", Trying to install the Cylance Agent"
$CSV_Log_Path = "C:\Cylance Push Logs\CyIns_Log_"+$CSV_LogDate+".csv"
$LogEntry = "Scan Started on $StartTime"
$DaysInactive = 90
$time = (Get-Date).Adddays(-($DaysInactive))

Add-Content -Path $LogPath -Value $LogEntry
Write-Host = $LogEntry
$CSV_Exists = Test-Path $CSV_Log_Path
If ($CSV_Exists -eq $False)
    {
        Add-Content -Path $CSV_Log_Path -Value "Computer,Status,Date"
    }
$DeviceCount = 0
Foreach ($Computer in Get-ADComputer -Filter {LastLogonTimeStamp -gt $time} -ResultPageSize 2000 -resultSetSize $null | Select-Object -ExpandProperty dnshostname)  ## Get all computers from AD and loop through them
    {
    $DeviceCount++
    $FailLog = " "
    IF ((Test-Connection -Cn $Computer -BufferSize 16 -count 1 -ea 0 -Quiet) -eq "True") ## Check if computers respond to ping
        {
            $CurrentDate = Get-Date
            $PSHostName = "\\"+$Computer
            $CylanceService = Get-Service -Name $ServiceName -ComputerName $Computer -ErrorAction SilentlyContinue
            If ($CylanceService.Status -ne "Running")  # If Cylance agent is not running
                {   #install the Cylance Agent
                    $LogEntry = $CylanceNotInstalled+$Computer+$CylanceTryingToInstall
                    Add-Content -Path $LogPath -Value $LogEntry
                    Write-Host $LogEntry
                    if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
                        {
                            #64 bit installer
                            & C:\scripts\psexec.exe $PSHostName -s msiexec.exe /i $InstallerPath_x64 /passive PIDKEY=ZxbDflRWLyTTTxheyhhWsBf0  2>&1 | Out-Null
                            $LogEntry = "64-bit OS"
                        }
                    else
                        {
                            #32 bit installer
                            & C:\scripts\psexec.exe $PSHostName -s msiexec.exe /i $InstallerPath_x32 /passive PIDKEY=ZxbDflRWLyTTTxheyhhWsBf0  2>&1 | Out-Null
                            $LogEntry = "32-bit OS"
                        }
                    Add-Content -Path $LogPath -Value $LogEntry
                    Write-Host $LogEntry
                    
                    IF ($lastexitcode -eq 0) # If True Install Succeded
                        {   
                            $LogEntry = "Cylance installation is complete on $Computer"
                            $LogCSV = "$Computer,Succeded,$CurrentDate"
                        }
                    Else # Installed failed
                        {   
                            $LogEntry = "$IP -- Error !!! Cylance was not installed successfully $Computer" 
                            $LogCSV = "$Computer,Failed,$CurrentDate"
                        }                                                 
                                
                }
            Else  #  If Cylance Agent is Running
                {
                            $LogEntry = "Cylance is already installed on $Computer"
                            $LogCSV = "$Computer,Already Installed,$CurrentDate"
                }
                                
                }
                                      
 
    Else
        {
            $LogEntry = $Computer+" Did not respond to ping"
            $LogCSV = "$Computer,No Ping,$CurrentDate"
        }
    Write-Host "$DeviceCount $LogEntry"
    Add-Content -Path $LogPath -Value $LogEntry
    If ($LogCSV -ne " ")
        {
            Add-Content -Path $CSV_Log_Path -Value $LogCSV
        }
}