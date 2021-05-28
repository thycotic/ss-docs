[title]: # (Create a New Dependency Changer for Synchronizing Passwords During RPC)
[tags]: # (synchronize,passwords,rpc,remote password changing, dependency)
[priority]: # (1000)

# Create a New Dependency Changer for Synchronizing Passwords During RPC

In most environments, we recommend using a separate password for each account for optimal security. However in environments where identical credentials are used in multiple secrets, we recommend using RPC to change the password on one primary parent account secret, and then using a PowerShell dependency script to update values in child secrets. The PowerShell script calls back to Secret Server's API, retrieves a list of comma-separated values representing child secret IDs, and updates the values stored in the child secrets. We recommend using this process for no more than 25 child secrets.

## Requirements

* a Secret Server instance version 10.1.000000 or newer with a premium add-on or Enterprise Plus
* a PowerShell implementation enabled and working properly. See [Configuring WinRM for PowerShell](../../api-scripting/configuring-winrm-powershell/index.md)
* the [WellnessChecker tool](http://updates.thycotic.net/tools/powershell.wellnesschecker.zip)

For this procedure you will need to create the four types of user accounts listed below, and for each account you will need to create a corresponding secret in Secret Server with the account's login credentials and other information.

Create the user accounts and secrets described below:

* an API User account and a corresponding secret. This API User account will NOT take up a user license. Recommended templates for the secret include the Active Directory template and the Web Password template. Credentials may be a local account or an Active Directory service account assigned to the Synchronization group, but must be stored in Secret Server to be passed to the PowerShell script.
* a primary parent account and a corresponding secret that has RPC set up and the PowerShell dependency script from this page attached. The primary parent account credentials may be either a local account or an Active Directory service account assigned to the Synchronization group.
* Child accounts with a corresponding secret for each account containing the child secret ID, with edit permissions granted to the API User account.
* a privileged Active Directory account and a corresponding secret that can run PowerShell on the Secret Server machine.

To create a new dependency changer for synchronizing passwords during RPC, follow the procedure below.

1. Download the [WellnessChecker tool](http://updates.thycotic.net/tools/powershell.wellnesschecker.zip) ZIP file.
1. Extract the ZIP file and run this command:

   `PowerShell.WellnessChecker.exe -fixerrors`

1. In Secret Server, browse to **Admin \> Scripts**.
1. Click the ![image-PlusNew](images\PlusNew.png) symbol next to **Create New**.

   ![image-create-new-script.png](images\create-new-script.png)

1. In the **New PowerShell Script** dialog, fill in the fields for **Name**, **Description**, and **Category**.
1. In the **Script** field, paste in the script provided at the bottom of this page.
1. Click **OK** to save the file.

     ![image-new-powershell-script](images\new-powershell-script.png)

1. Browse to **Admin > Configuration**.

1. On the **General** tab, make sure **Enable Webservices** is set to **Yes**.

     ![image-enable-web-services](images\enable-web-services.png)

1. Browse to the primary parent account secret and ensure that RPC is setup on it. See [link-to-page]().

1. In the primary parent account secret, click the **RPC** tab.
1. Click **Edit**.
1. In the Secret grid at the bottom, select the API User account secret you created. The API User account secret should be the only secret in the grid. If you have not yet created the PowerShell script, you will see no grid.

1. Browse to **Admin \> Discovery** and click the **Configuration** tab.
1. Click **Discovery Configuration Options** and select **Extensible Discovery** from the drop-down list.

     ![image-discovery-configuration-options.png](images\discovery-configuration-options.png)

1. On the **Extensible Discovery Configuration** page, click **Configure Dependency Changers**.

     ![image-configure-dependency-changers.png](images\configure-dependency-changers.png)

1. On the **Secret Dependency Changers** page, click **Create New Dependency Changer**.

     ![image-create-new-dependency-changer.png](images\create-new-dependency-changer.png)

1. In the **New Dependency Changer** dialog, click the **Basic** tab and enter the following information:

    ![image-new-dependency-changer-basic.png](images\new-dependency-changer-basic.png)

1. Click the **Scripts** tab and enter the following information:

    ![image-new-dependency-changer-scripts.png](images\new-dependency-changer-scripts.png)

1. In the **Arguments** field, paste the following:

   `$[1]$USERNAME $[1]$PASSWORD $PASSWORD $NOTES $[1]$DOMAIN`

    The actions of the Arguments are as follows:
   * `$[1]$USERNAME` pulls the username from the first linked secret on the primary parent account, which will be used to execute the PowerShell script.

   * `$[1]$PASSWORD` pulls the password from the first linked secret on the primary parent account, which will be used to execute the PowerShell script.

   * `$PASSWORD` pulls the password from the primary parent account, which will be set for all secrets listed in the **Notes** field.

   * `$NOTES` pulls the **Notes** content from the primary parent account, and parses the comma separated list of secret IDs to find the other secrets to update.

   * `$[1]$DOMAIN` pulls the **Domain** field from the first linked secret on the primary parent account. For local accounts, leave the **Domain** field on the linked secret empty. It must be listed last because of the way PowerShell parses empty fields.

1. Browse back to the **Extensible Discovery Configuration** page and this time, click **Configure Dependency Templates**.

    ![image-configure-dependency-templates.png](images\configure-dependency-templates.png)

1. On the **Secret Dependency Templates Designer** page, select the new dependency changer you configured in the last step.

    ![image-create-powershell-template.png](images\create-powershell-template.png)

THEN WHAT?

1. Browse to the primary parent account secret and click the **Dependencies** tab.
1. Click **New Dependency**.

    ![image-new-dependency.png](images\new-dependency.png)

1. In the **Create Dependency** dialog, click the **Select Type** dropdown and select the PowerShell dependency template you created.

    ![image-create-dependency.png](images\create-dependency.png)

1. In the **Edit Dependency** dialog, enter `default` in the **Machine Name** field.

1. Select a Privileged Account (active directory account secret able to run PowerShell on the Server)

1. In the primary parent account secret's **Notes** field, ensure that the child secret IDs appear in a comma-separated-values list, for example `19,39,81...`

Now the dependency has been added and you can test the full process by running a Remote Password Change on the primary parent account. All of the Secrets listed by ID in the **Notes** field should be updated with the same password.

## PowerShell Script

Replace `$url` with the name of the machine hosting your Secret Server instance.

```powershell
$url = 'http://MySecretServerURL/webservices/sswebservice.asmx';
$username = $Args[0]
$password = $Args[1]
$newpassword = $Args[2]
$secretIdArray = $Args[3]
$domain = $Args[4]
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential
$result1 = $proxy.Authenticate($username, $password, '', $domain)
if ($result1.Errors.length -gt 0){
    $errors = $result1.Errors[0]
    Write-Debug "Errors result1: $errors"
    exit
} else {
    $token = $result1.Token
}
$secretIds = $secretIdArray -split ","
foreach($secretId in $secretIds){
    $result2 = $proxy.GetSecret($token, $secretId, $false, $null)
    if ($result2.Errors.length -gt 0){
        $errors = $result2.Errors[0]
        Write-Debug "Errors result2: $errors" 
    } else {
        $secretName = $result2.Secret.Name
        Write-Debug "Updating Secret: $secretName"
        foreach ($item in $result2.Secret.Items) {
            if($item.IsPassword) {
                $item.Value = $newpassword
            }
        }
        $secret = $result2.Secret
        $result3 = $proxy.UpdateSecret($token, $secret)
        if ($result3.Errors.length -gt 0) {
        $errors = $result3.Errors[0]
            Write-Debug "Errors result3: $errors" 
        } else {
            Write-Debug "Updated Secret: $secretName"
        }
    }
}

```
