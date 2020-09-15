
#THE SCRIPT WILL CHANGE THE CONFIGURATION FOR THE CONFERENCES ROOMS :


$credObject = Get-Credential

                   #For credentials you will have to use your full email.

$ExchOnlineSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credObject -Authentication Basic -AllowRedirection 

                   #If the line about fails you will have to install the PPohTools ( this is the script: Install-Module -Name PPoShTools ) to get it installed


Import-PSSession $ExchOnlineSession


Set-MailboxFolderPermission -Identity CR_trainingconfrm@tabitha.org:\calendar -User default -AccessRights LimitedDetails

                   #This command will apply the settings to the Room that has been added, replace the *ConferenceTest@tabitha.org* for the one that will be applied


Set-CalendarProcessing -Identity CR_trainingconfrm@tabitha.org -AddOrganizerToSubject $false -DeleteComments $false -DeleteSubject $false -OrganizerInfo $true

                   # The attributes in this command will decide and change the behaviour of the end result

Remove-PSSession $ExchOnlineSession

                   #Will close the session
                   #JT