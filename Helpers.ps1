#Function to Create-AesKey
function Create-AesKey {
   $aesManaged = New-Object "System.Security.Cryptography.AesManaged"
   $aesManaged.Mode = [System.Security.Cryptography.CipherMode]::CBC
   $aesManaged.Padding = [System.Security.Cryptography.PaddingMode]::Zeros
   $aesManaged.BlockSize = 128
   $aesManaged.KeySize = 256
   $aesManaged.GenerateKey()
   [System.Convert]::ToBase64String($aesManaged.Key)
}

#Function to Display Output Values 
function DisplayValues {

Write-Host (" ")
Write-Host ("Client ID: " + $myApp.AppId)
Write-Host ("Client Secret: " + $AppKeyValue)
Write-Host (" ")
Write-Host ("Callback URL:") $appURL
Write-Host ("Auth URL:") "https://login.windows.net/$tenantid/oauth2/authorize?resource=https://api.businesscentral.dynamics.com"
Write-Host ("Access Token URL:") "https://login.windows.net/$tenantid/oauth2/token?resource=https://api.businesscentral.dynamics.com"
Write-Host (" ")

}