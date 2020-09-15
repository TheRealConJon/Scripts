$list = Import-Csv -Path C:\RegroupStaffingSecurityGroups.csv
$list | foreach {Set-ADGroup -Identity $_.DistinguishedName -Add @{extensionAttribute15="Regroup"}}