$username = "amert2ch3"
$password = "CRDvda6MF4!$"
$authInfo = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$username`:$password"))
$headers = @{"X-Requested-With"="powershell";"Authorization"="Basic $authInfo";"Accept"="application/json"}

$baseurl = "https://qualysapi.qg2.apps.qualys.com:443/msp/ignore_vuln.php?action=ignore&qids=90080&ips=10.96.0.158,10.96.0.239,10.96.1.1,10.96.1.4,10.96.1.15,10.96.1.20,10.96.1.25,10.96.1.28,10.96.1.32,10.96.1.43,10.96.1.50,10.96.1.52,10.96.1.58,10.96.1.68,10.96.1.84,10.96.1.88,10.96.1.92,10.96.1.97,10.96.1.104,10.96.1.111,10.96.1.113,10.96.1.116,10.96.1.118,10.96.1.124,10.96.1.129&reopen_ignored_days=365&comments=SR00423681"

Invoke-RestMethod -Headers $headers -Method POST -Uri $baseurl