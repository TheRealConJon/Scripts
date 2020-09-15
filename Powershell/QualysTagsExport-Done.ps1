$username = "username"
$password = "password"
$authInfo = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$username`:$password"))
$Date = Get-Date -Format "yyyy-MM-dd"



$CsvPath = "Y:\CORP\VulnerabilityMgnt\QualysAPI\Connor Powershell API\QualysTags_$Date.csv"

$headers = @{"X-Requested-With"="powershell";"Authorization"="Basic $authInfo";"Accept"="application/json"}

$baseurl = "https://qualysapi.qg2.apps.qualys.com:443/qps/rest/2.0/search/am/tag?fields=id,name,parentTagId,ruleText,ruleType"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-NetworkR.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response2.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QAPI-file2.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response3.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Asset.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response4.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Cloud.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response5.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Groovy.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response6.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-OS.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response7.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Ports.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response8.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Software.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response9.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Static.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response10.json"

Invoke-RestMethod -Headers $headers -Method POST -ContentType "application/json" -Uri $baseurl > QT-Vulns.xml -OutFile "C:\Security\Security Groups\Qualys_Community\response11.json"

$js1 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response1.json" -Raw | ConvertFrom-Json
$js2 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response2.json" -Raw | ConvertFrom-Json
$js3 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response3.json" -Raw | ConvertFrom-Json
$js4 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response4.json" -Raw | ConvertFrom-Json
$js5 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response5.json" -Raw | ConvertFrom-Json
$js6 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response6.json" -Raw | ConvertFrom-Json
$js7 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response7.json" -Raw | ConvertFrom-Json
$js8 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response8.json" -Raw | ConvertFrom-Json
$js9 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response9.json" -Raw | ConvertFrom-Json
$js10 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response10.json" -Raw | ConvertFrom-Json
$js11 = Get-Content -Path "C:\Security\Security Groups\Qualys_Community\response11.json" -Raw | ConvertFrom-Json

$JsObjs = $js1, $js2, $js3, $js4, $js5, $js6, $js7, $js8, $js9, $js10, $js11
 
foreach ($object in $JsObjs){
    foreach($item in $object.ServiceResponse.data){
        [string] $id = ""
        [string] $Name = ""
        [string] $DateCreated = ""
        [string] $DateModified = ""
        [string] $parent = ""
        [string] $tags = ""
        [string] $RuleType = ""
        [string] $RuleText = ""
 
        $id = $item.Tag.id
        $Name = $item.Tag.name
        $DateCreated = $item.Tag.created
        $DateModified = $item.Tag.modified
        $parent = $item.Tag.parentTagId
        $RuleType = $item.Tag.ruleType
        $RuleText = $item.Tag.ruleText
        foreach ($tag in $item.Tag.children.list){
            if ($tags.length -gt 0){
                $tags = $tags + ", " + $tag.TagSimple.id.ToString() + " - " + $tag.TagSimple.name
            }else{
            $tags = $tag.TagSimple.id.ToString() + " - " + $tag.TagSimple.name
            }
 
        }
        $writableObj = [PSCustomObject]@{
            Id = $id
            Name = $Name
            DateCreated = $DateCreated
            DateModified = $DateModified
            parentTagId = $parent
            RuleType = $RuleType
            RuleText = $RuleText
        }
        Export-Csv -Path $CsvPath -InputObject $writableOBJ -NoTypeInformation -Append
    }
}
