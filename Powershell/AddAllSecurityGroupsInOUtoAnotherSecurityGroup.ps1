﻿Get-ADGroup -SearchBase 'OU=GracePointe,OU=.Security Groups,DC=tabitha,DC=org' -Filter * | ForEach-Object {Add-ADPrincipalGroupMembership -Identity $_ -MemberOf 'RGP_GracePointe'}