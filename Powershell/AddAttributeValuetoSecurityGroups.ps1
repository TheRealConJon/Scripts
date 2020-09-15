Get-ADGroup -Filter 'GroupCategory -eq "Security"'| ? { $_.samaccountname.length -eq 6 -and $_.distinguishedname -like "*.security*"} | select name ,DistinguishedName | Export-Csv -Path C:\RegroupSecurityGroups.csv -NoTypeInformation
$list = Import-Csv -Path C:\RegroupSecurityGroups.csv
$list | foreach {Set-ADGroup -Identity $_.DistinguishedName -Add @{extensionAttribute15="Regroup"}}