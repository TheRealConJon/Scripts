#This is where we define the parameters.
#It prompts for username and the forward to email address. 
#Be sure to edit the Exchange server to match your environment. 




Param (
[Parameter(Mandatory=$true)]
[string]$FolderName,
[Parameter(Mandatory=$true)]
[string]$FolderDescription,
[Parameter(Mandatory=$true)]
[string]$RequestingManager,
[string]$ExchangeServer="mail.tabitha.org"
)
#
#Here we create the connection to the exchange server.
#
#$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$ExchangeServer/PowerShell
#Import-PSSession $ExchangeSession
#
#Here we import the tools to work with AD.
#
Import-Module ActiveDirectory
#
#This is where group memberships are removed.
#
#Get-ADPrincipalGroupMembership -Identity $Username | % {Remove-ADPrincipalGroupMembership -Identity $Username -MemberOf $_ -Confirm:$False}
#
#This is where we disabled the account
#
New-ADGroup -Name $FolderName' RW' -Path “OU=G Drive Folder Permissions,DC=Tabitha,DC=org” -Description $FolderDescription -GroupCategory Security -GroupScope Universal -ManagedBy $RequestingManager
#
New-ADGroup -Name $FolderName' RO' -Path “OU=G Drive Folder Permissions,DC=Tabitha,DC=org” -Description $FolderDescription -GroupCategory Security -GroupScope Universal -ManagedBy $RequestingManager
#
#Start-Sleep -s 10
#
#enable-distributiongroup -identity $SecurityGroupNameModify
#
#enable-distributiongroup -identity $SecurityGroupNameReadExecute
#
#Start-Sleep -s 10
#
#set-distributiongroup -identity $securitygroupnamemodify -hiddenfromaddresslistsenabled $true
#
#set-distributiongroup -identity $securitygroupnamereadexecute -hiddenfromaddresslistsenabled $true
#
