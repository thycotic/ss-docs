[title]: # (Basic SSH Key Rotation)
[tags]: # (SSH,key rotation)
[priority]: # (1000)
[display]: # (none)

# Basic SSH Key Rotation 

This topic is a tutorial on how to quickly get started using SSH key rotation to change a Unix account's public and private key and automatically update a remote machine using Remote Password Changing (RPC).

## Introduction

SSH key rotation allows you to manage your Unix account private keys and passphrases as well as their passwords. With key rotation, whenever the password is changed on the secret (manually, during a scheduled auto-change, or when checking in a secret that changes the password on check-in), the public/private key pair is regenerated and the private key encrypted using a new passphrase. The public key is then be updated on the Unix machine referenced on the secret.

This document is a tutorial showing you how to quickly get started using SSH key rotation using our default key rotation password changers. For an in-depth description of SSH key rotation including modifying the command sets for your environment, see our [Custom SSH Key Rotation](../ssh-key-rotation-custom/index.md) topic.

## Requirements

To use our default SSH key rotation commands, the following minimum requirements must be met on the machine being managed:

- SSH key logins should be enabled on the target using keys in OpenSSH format. A secret can be created with keys in PuTTY format but they will be converted to OpenSSH when the key is rotated.

- Public keys should be stored in `[~userhome]/.ssh/authorized_keys` (not `authorized_keys2`).

- Grep and Sed should be installed on the target.

- If doing a privileged SSH key rotation, where a privileged user sets the key for another user, the privileged user must have sudo permissions that do not prompt for a password and the permissions to edit the user’s `authorized_keys` file with sudo.

If a system does not meet these requirements it may still be possible to do key rotation by modifying the key rotation command sets. Our [Custom SSH Key Rotation](../ssh-key-rotation-custom/index.md) topic describes how to do this.

## Configuring a Secret for SSH Key Rotation

Secret Server comes with two secret templates for SSH key rotation: **Unix Account (SSH key rotation)** and **Unix Account (Privileged Account SSH Key Rotation)**.

 Use **Unix Account (SSH Key Rotation)** if:

- The account is able to change its own password and modify its own `authorized_keys` file.

- The account password and key should only be changed by SS (SS will always have the current password and keys).

Use **Unix Account (Privileged Account SSH Key Rotation)** if:

- The account is not able to change its own password or modify its own `authorized_keys` file.

- The account password and key may be changed outside of SS, and SS may not have the current account credentials. A privileged account that is able to change the password and `authorized_keys` files of other users will still be able to change the account credentials.

## SSH Key Rotation Using the Secret's Credentials

### Creating the Secret

1. Create a new secret in SS using the **Unix Account (SSH Key Rotation)** template.
1. Enter the account user name and password.
1. Upload the private key file.
1. If the private key is encrypted using a passphrase, enter the passphrase.
1. Uploading a public key is optional but recommended. If a public key is not provided, SS will regenerate it from the private key during key rotation, but if the key in `authorized_keys` is not in the same format as the generated key or does not match exactly (including comments), the rotation will fail because it could not find the public key that needs to be removed.
1. After the secret is created you should see a successful heartbeat status. If heartbeat isn’t running, make sure heartbeat and RPC are enabled under **Admin \> Remote Password Changing**.

### Rotating the Key

1. Go to the **Remote Password Changing** tab and click **Change Password Remotely**.
1. Enter the new password or click **Generate** next to the **Next Password** field to generate a random password.
1. Click to select **Generate New SSH Key** to create a new, random SSH key. If you want to supply your own private key, uncheck this option and paste the key into the **Next Private Key** text box that appears.
1. If you have unchecked **Generate New SSH Key** you must enter the passphrase that was used to encrypt the private key at the time it was created. Leave this field blank if the private key was not encrypted with a passphrase. If you have checked **Generate New SSH Key** you have the option to enter your own passphrase, leave it blank (for an unencrypted private key), or click the **Generate** button next to the field to create a new, random passphrase. If you want to change the key without changing the passphrase, you must put the current passphrase in the **Next Private Key Passphrase** text box.
1. Click **Change** to start the key rotation and a password change. After you start the change, you can check the status either in **Admin \> Remote Password Changing** or on the **Remote Password Changing** tab of the secret.
1. Once the password change / key rotation is complete the heartbeat status should be successful. You can check the audit log to see notes that the key was rotated and start a session using the key with the PuTTY Launcher.

## SSH Key Rotation Using a Privileged Account

To use **Unix Account (Privileged Account SSH Key Rotation)**, you must have a secret that is able to use the sudo command to access other accounts' `authorized_keys` files and change their passwords. This can be any type of Unix secret and can use a password and/or private key to authenticate. If you have a secret that meets these requirements, you can set up SSH key rotation using a privileged account as follows.

### Creating the Secret

1. Create a new secret in SS using the **Unix Account (Privileged Account SSH key rotation)** template.
1. Enter the account user name and password.
1. Upload the private key file.
1. If the private key is encrypted using a passphrase, enter the passphrase.
1. Uploading a public key is optional, but recommended. If it is not provided, SS will regenerate it from the private key during key rotation, but if the key in `authorized_keys` is not in the same format as the generated key or does not match exactly (including comments), the rotation will fail because it could not find the public key that needs to be removed.
1. After the Secret is created you should see a successful heartbeat status. If heartbeat is not running, make sure that heartbeat and RPC are enabled under **Admin \> Remote Password Changing**.
1. Next go to the **Remote Password Changing** tab and choose the privileged secret that can authenticate to the machine and modify the user’s `authorized_keys` file.
1. Click the **Back** button after adding the associated secret.

### Rotating the Key

1. Go to the **Remote Password Changing** tab and click **Change Password Remotely**.
1. Enter the new password or click **Generate** next to the **Next Password** field to generate a random password.
1. Click to select **Generate New SSH Key** to create a new, random SSH key. If you want to supply your own private key, uncheck this option and paste the key into the **Next Private Key** text box that appears.
1. If you have unchecked **Generate New SSH Key** you must enter the passphrase that was used to encrypt the private key at the time it was created. Leave this text box blank if the private key was not encrypted with a passphrase. If you have checked **Generate New SSH Key** you have the option to enter your own passphrase, leave it blank (for an unencrypted private key), or click the **Generate** button next to the field to create a new, random passphrase. If you want to change the key without changing the passphrase, you must put the current passphrase in the **Next Private Key Passphrase** text box.
1. Click **Change** to start the key rotation and a password change. After you start the change, you can check the status either in **Admin \> Remote Password Changing** or on the **Remote Password Changing** tab of the secret.
1. Once the password change / key rotation is complete the heartbeat status should be successful. You can check the audit log to see notes that the key was rotated and start a session using the key with the PuTTY Launcher.

## Troubleshooting

- The SSH Password Changers are targeted to OpenSSH. If using a different SSH library or if the user keys are not in the user's `/.ssh/authorized_keys` file you can check the commands used and modify them as appropriate under **Admin \> Remote Password Changing** and clicking **Configure Password Changers**. The password changers used are **SSH Key Rotation** and **SSH Key Rotation Privileged Account**.

- Errors are logged to **Admin \> Remote Password Changing**. Additional logs can be found in the Secret Server directory in the log subfolder. That is: `C:\inetpub\wwwroot\secretserver\log`.

- A change was made to how SSH script variables are named to differentiate them from tokens when testing command sets on the Configure Password Changers page. Non-token script variables should begin with an underscore. Anything in the script beginning with a dollar sign not followed by an underscore will be treated as a token and displayed as a field in the test dialog. For example:

  - `$USERNAME`References the username from the secret.
  - `$[1]$USERNAME` References the username from the first linked secret.
  - `$_USERNAME` References a bash variable defined in the script.

- The default command set for the SSH key rotation privileged account password changer assumes that the sudo command will not prompt for a password. If your environment prompts for a password when using sudo the command sets will need to be modified to supply the password. If your environment caches the sudo credentials, the easiest way to handle this is to add the following two lines at the top of each command set on the SSH key rotation privileged account password changer:

  `sudo -i echo`

  `$[1]$PASSWORD`

  This caches the credentials for the rest of the script.



 