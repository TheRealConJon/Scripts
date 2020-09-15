$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" 
$img =  "\\tnhfs2\SDT\Misc\LockscreenImage\LockscreenDinner.jpg"

Set-ItemProperty -Path $path -Name LockScreenImage -value $img