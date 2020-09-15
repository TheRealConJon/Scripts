<#
first part of script finds all disbled users, displays their membership, looks for users that have one or 
more group memberships and adds t hem to a list that read into a file

#>

$DisabledUsers = @()

$AllUsersNow = Get-ADUser -Filter {Enabled -eq $false} -Properties memberof
$AllUsersNow  | Out-GridView

Foreach ($ThisUser in $AllUsersNow)
{


If ($ThisUser.memberof.Count -gt 0) {
$row = [PsCustomObject]@{
samaccountname = $ThisUser.samaccountname 
}
$DisabledUsers += $row 
}



}

$DisabledUsers  | Export-Csv -Path c:\DisabledUsers.csv -NoTypeInformation -Force

<#
after editing contents of DisabledUsers.csv  Unocomment the folloing code.
It read the file into memory, loop through it line by line and take some action 
#>

<#
$csv = Import-csv -path c:\DisabledUsers.csv 

foreach($line in $csv)
{ 
   $line.samaccountname
   ##Uncomment one of these:

   #### this  line will execise the code but make no changes
  ### Get-ADUser $line.samaccountname  -properties memberof | Select -ExpandProperty memberof | %{Remove-ADGroupMember -Identity  $_ -member $line.samaccountname -WhatIf }
  #### this  line will prompt you to confirm each shnge
  ### Get-ADUser $line.samaccountname  -properties memberof | Select -ExpandProperty memberof | %{Remove-ADGroupMember -Identity  $_ -member $line.samaccountname  }
  #### this  line will make chnages without you confirming
  ### Get-ADUser $line.samaccountname  -properties memberof | Select -ExpandProperty memberof | %{Remove-ADGroupMember -Identity  $_ -member $line.samaccountname -Confirm:$false }
} 
#> 
