[title]: # (AWS Key Management in Secret Server Cloud)
[tags]: # (secret server cloud, aws)
[priority]: # (1000)
[redirect]: # (CloudKeyManagement)

# AWS Key Management in Secret Server Cloud

## Introduction

Secret Server (SS) protects your secrets using a master encryption key, as well as an additional intermediate encryption key that is unique for each secret. These effectively act as internal passwords that Secret Server itself needs to unlock your data, for example any time you view or update a secret.

Key Management in Secret Server Cloud (SSC) allows you to add an additional layer of encryption using a third-party provider to protect these encryption keys for added protection and control. To do this, you must first set up your own encryption key with a third party that you fully control, and then provide SS limited access to it. This external encryption key is used to protect the SS encryption keys. You can revoke Secret Server's access at any time if the need arises, rendering Secrets unusable.

> **Important:** Once enabled, beware that if you delete your external third-party encryption key, or the credentials you gave Secret Server no longer work. *You will not be able to access your existing Secrets, and even Thycotic will not be able to help!*

You can change your key management configuration through SS's Web interface or by using the REST API. If key management has already been enabled, you can switch to a new configuration or disable key management completely. To make any change, your existing key management configuration **must still be valid**, so your secrets and the master encryption keys can be converted to the new configuration. Your new settings are validated before they can be saved.

Secret Server Cloud currently supports  Amazon's Key Management Service.

## Configuring Key Management

### Overview

To enable key management, you will first create an encryption key with your third-party provider, then an API account that SS will use in order to access the key. After the external encryption key is setup, you will update SS with the details.

> **Important:** Changing your key management settings will trigger "maintenance mode" and a secret key rotation that will re-encrypt all your secret keys. No one will be able to access secrets until the rotation finishes, and it must finish successfully before further key management changes can be made.

 Navigate to Secret Server's key management page by clicking **Admin \> All \> Key Management**.

 Here you can change your key management settings, as well as view the audit history showing all key management updates.

#### Key Management Providers

SSC currently supports one provider, AWS Key Management Service. More providers may be added over time. Azure's KeyVault service is not a viable provider at this time due to slow speed limits when using strong encryption keys (such as 4096-bit RSA with HSM).

### AWS Key Management Services Pricing

Please see [AWS Key Management Service Pricing](https://aws.amazon.com/kms/pricing/).

SSC requires one AWS Key ("CMK"), and the number of requests per month will vary depending on how often secrets are accessed.

## Procedure

> **Important:** Changing your key management settings triggers SSC maintenance mode and a secret key rotation that re-encrypts (or de-encrypts) all your secret keys! No one can access secrets until the rotation finishes, and it must finish successfully before further key management changes can be made.

### Task 1: Setting up the Encryption Key and IAM User in AWS

1. Log into the AWS Console website at https://console.aws.amazon.com/.

1. Under **Services**, search for **IAM** (Identity and Access Management). This is where you will configure both your encryption key and  an IAM user for SS to use to access the encryption key.

1. Click the **Users** button on the left menu.

1. Click **Add User** button.

1. Type a name (such as *SecretServerCloud*) in the **User Name** text box.

1. Click to select the **Programmatic Access** check box in the **Access Type** section.

1. Click the **Next: Permissions** button. The Permissions page appears.

1. Click the **Next: Review** button (on the Permissions page, no special permissions are needed). The Review page appears.

1. Click the **Create User** button. A Success page appears confirming the user was created. Both the access key ID and the secret access key appear (click the **Show** link).

1. Click the **Download .csv** button to save the credentials

   > **Important:**  Be sure to **save both the  access key ID and the secret access key**! If you lose them, you can never view the secret access key again. Even after you enter them in SSC, you cannot retrieve the secret access key.

1. Click the **Encryption Keys** button in the left menu.

1. Click the **Region** dropdown list to select a region. We recommend picking **US East (Virginia)** if you are using `*.secretservercloud.com`, or **EU (Frankfurt)** if you are using `*.secretservercloud.eu`.

1. Click the **Create key** button. The Create Alias and Description page appears.

1. Type an alias in the **Alias** text box (such as *SecretServerCloud*).

1. (Optional) Type a description in the **Description** text box.

1. In the **Advanced Options** section, you can either let Amazon create a new random key for you (default), or you can provide your own key, which is beyond the scope of this guide. Click the **Learn More** link for more information. Either way, Amazon will have access to the key because they are providing the encryption and decryption services.

1. Click the **Next Step** button. The Add Tags page appears.

1. Click the **Next Step** button again, unless you want to add optional tags. The Define Key Administrative Permissions page appears.

1. Click the **Next Step** button again. The Define Key Usage Permissions page appears.

   > **Important:**  Do **not** give access to the user you created earlier for SSC. It is unnecessary for SS to have administrative     access to the key.

1. Click to select the check box next to SecretServerCloud to give that user access to the key.

1. Click the **Next Step** button. The Preview Key Policy page appears.

1. Click the **Finish** button. The new key appears in your Encryption Keys list.

1. Click to select the new key in the list. The Summary section on the key's page appears.

1. Copy and save the contents of the read-only **ARN** text box. You will need it later.

> **Note:** AWS supports automatically rotating this key every year. You can change that setting on this page in the **Key Rotation** section (select the "Rotate this Key every year" check box). Once rotated, the key management settings in SS will not require further changes, and your existing secrets can still be accessed by the old encryption settings. However, only new secrets will be created under the new version of the encryption key, and you must perform a secret key rotation inside SSC if you want to update all secrets to use the new version of the AWS key.

> **Note:** As a security best practice, we recommend performing a secret key rotation inside of SSC on a regular basis to refresh the encryption keys on your Secrets. Go to **Admin \> Configuration \> Security**, and click **Rotate Secret Keys**.

### Task 2: Adding Encryption Key and User Details in Secret Server

1. In SSC, go to **Administration \> Key Management**. The Key Management page appears.

1. Click the **Edit** button.  The page becomes editable.

1. Click the **Key Management Type** dropdown list to select **Amazon KMS**.

1. Type your AWS key details that you saved earlier in the remaining four text boxes.

1. Click the **Save** button.

### Task 3: Secret Key Rotation

1. Once you save your changes, your new settings are validated and a secret key rotation is triggered.

1. View the progress of the rotation:
   1. Go to **Admin \> Configuration**.
   1. Click the **Security** tab.
   1. Go to the **Key Rotation** section.
1. Later you can repeat the process to change the AWS encryption key, or you can select **None** for the **Key Management Type** to disable it completely.


## Secret Server Key Management via the REST API

SSC has a REST API for retrieving or updating your key management configuration. For details:

1. Log on your SSC instance.

1. Click the question mark icon in the top right corner and select **Secret Server REST API Guide**.

1. Click on the **Documentation for REST API** document link for your authentication style, normal tokens or Windows Integrated Authentication.

1. Search for `KeyManagement` to view that section of our API.

> **Important:** When changed via the API, maintenance mode and a secret key rotation still occur.

 