$CopyFrom = Read-Host "Please Enter Security Group you want to Copy all ""Member Of"" Groups from"
$CopyTo = Read-Host "Please Enter Security Group you want to Copy all ""Member Of"" Groups to"
get-adgroup $CopyFrom -Properties memberof |
Select-Object -ExpandProperty memberof |
Add-ADGroupMember -Members $CopyTo