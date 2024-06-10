$AppId = ""
$AppSecret = ""
$TenantId = ""
$SubscriptionId = ""

Disable-AzContextAutosave

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

Connect-AzAccount -ServicePrincipal -Credential $Credential -TenantId $TenantId

Set-AzContext -Subscription $SubscriptionId

$scope = "/subscriptions/$SubscriptionId/providers/Microsoft.Compute/locations/westeurope"

$ApiVersion = "2019-07-01"

$QuotaUrl = "https://management.azure.com$($Scope)/usages?api-version=$ApiVersion"

$AccessToken = (Get-AzAccessToken -ResourceUrl "https://management.azure.com").Token

$response = Invoke-RestMethod -Method Get -Uri $QuotaUrl -Headers @{
    "Authorization" = "Bearer $AccessToken"
}

if ($response.value) {
    $response.value | ForEach-Object {
        [PSCustomObject]@{
            Name        = $_.name.localizedValue
            CurrentValue= $_.currentValue
            Limit       = $_.limit
            Unit        = $_.unit
        }
    } | Format-Table -AutoSize
} else {
    Write-Output "No data found in the response."
}