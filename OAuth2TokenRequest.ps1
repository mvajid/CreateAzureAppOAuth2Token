######################################################
#   Script to create an Azure App for OAuth2 token   #
#                    [mvajid]                        #
######################################################

Import-Module .\Helpers.ps1

#Set Tenant Variables
$tenantid = Read-Host -Prompt "Enter Tenant ID"
$environmentname = Read-Host -Prompt "Enter Environment Name"

#Install AzureAD
#Install-Module AzureAD

#Connect to AzureAD Tenant
Connect-AzureAD -TenantId $tenantid

#Set Variables for App
$appName = "OAuth2 Token for API Access"
$appURL = "https://businesscentral.dynamics.com/$tenantid/$environmentname/"

#Set required Resource Access for Dynamcis 365 Business Central
$req = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess" 
$req.ResourceAppId = "996def3d-b36c-4153-8607-a6fd3c01b89f"
$req.ResourceAccess = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "bce0976a-cb0b-473b-8800-84eda9f8e447","Scope"

#Create App
$myApp = New-AzureADApplication -DisplayName $appName -ReplyUrls $appURL -RequiredResourceAccess $req

#Create Client secret for App
$startDate = Get-Date
$AppKeyValue = Create-AesKey
New-AzureADApplicationPasswordCredential -ObjectId $myApp.ObjectId -Value $AppKeyValue -CustomKeyIdentifier "OAuth2" -StartDate $startDate -EndDate $startDate.AddYears(10)

#Moment of truth
clear
DisplayValues