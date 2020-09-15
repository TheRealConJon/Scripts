$computers = Get-ADComputer -Filter * -SearchBase "OU=.NewComputers,OU=.Computers,DC=tabitha,DC=org"
$computers | move-adobject -TargetPath  "OU=.Computers,DC=tabitha,DC=org"