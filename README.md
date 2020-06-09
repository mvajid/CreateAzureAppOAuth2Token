# CreateAzureAppOAuth2Token
The script was created so that you can easily copy values to Postman and generate an access token. The script should be seen as a sample on how to create the Azure App (not the access token itself). The script was developed primarily to use for API authentication with a Microsoft Dynamics 365 Business Central tenant. The script is provided AS-IS.

USAGE:
1. Download both OAuth2TokenRequest.ps1 and Helpers.ps1 in the same directory.
2. Open OAuth2TokenRequest.ps1 with Windows PowerShell ISE and Run (F5)
3. You will be prompted to enter a tenantid and environment name. (You can get your Business Central tenantID and Environment Name from your Admin Center.)
4. You will be asked to sign-in with your AAD credentials so it can create the App registration.
5. The script will create the Azure app with and output the following values:

Client ID: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
Client Secret: YTxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx756rBM=

Callback URL: https://businesscentral.dynamics.com/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/PRODUCTION/
Auth URL: https://login.windows.net/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/oauth2/authorize?resource=https://api.businesscentral.dynamics.com
Access Token URL: https://login.windows.net/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/oauth2/token?resource=https://api.businesscentral.dynamics.com

You can use the above values for OAuth 2.0 Authorization when requesting a New Access Token.

Note: The script assumes that you have AzureAD module installed. If not, uncomment #Install-Module AzureAD and run the script.
