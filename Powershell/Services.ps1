$Computers = @('tnhreports','tnhdatarelay','tnhrightfax','UTility','TNH_sql' )
#$Computers= Get-ADComputer -Filter { OperatingSystem -Like '*Windows Server*'} | select Name
#$Computers
$Services = Get-WmiObject -Class Win32_Service -computername $Computers | ? { $_.StartName -match $LogonAccount } | Select name, StartName,status,machinename 
#Where { !($_.Samaccountname  -in $excluded) }
$excluded = @('LocalSystem','NT AUTHORITY\LocalService','NT AUTHORITY\NetworkService')
$Services |Where { !($_.Startname  -in $excluded) }  | out-gridview
