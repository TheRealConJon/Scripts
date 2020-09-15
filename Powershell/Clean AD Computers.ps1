$30 = (Get-Date).AddDays(-30) # The 60 is the number of days from today since the last logon.
$1yeard = (Get-Date).AddDays(-365)

# Disable computer objects and move to disabled OU (Older than 1 year):
Get-ADComputer -Property Name,lastLogonDate -Filter {lastLogonDate -lt $30} | Set-ADComputer -Enabled $false
Get-ADComputer -Property Name,Enabled -Filter {Enabled -eq $False} | Move-ADObject -TargetPath "OU=.Disabled,OU=.Computers,DC=tabitha,DC=org"

# Delete Older Disabled computer objects:
Get-ADComputer -Property Name,lastLogonDate -Filter {lastLogonDate -lt $1yeard} | Remove-ADComputer