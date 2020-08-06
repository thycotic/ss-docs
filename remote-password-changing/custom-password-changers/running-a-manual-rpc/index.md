[title]: # (Running a Manual RPC)
[tags]: # (Running a Manual RPC)
[priority]: # (1000)

# Running a Manual RPC

On the RPC tab there is a button called Change Password Remotely button that allows the use to change the password immediately instead of waiting for it to expire. When this button is clicked the user is taken to the Change Password Remotely page where they can enter in or generate the new password for the account. When the user clicks the Change button the secret enters the queue for having its password changed. The RPC Log found on the Remote Password Changing page details the results of the password change attempts and can be used for debugging.

If the secret is a Unix or Linux account and uses a password changer that supports SSH key rotation, the user can change the account's password, public and private keypair, and the private key passphrase. The user can enter or generate any of these items.

> **Note:** If the password change fails, SS continues to retry until it is successful, or the change is canceled by the user. To manually cancel the change, click Cancel Password Change on the RPC tab.

To run a manual RPC:
$1
$2$1
$2
   ![1564434752428](images/1564434752428.png)
$1
$2
   1. The Password text box appears.
   1. Type the new password in the **Password** text box.
   1. Click the **Change Password** button.

    Otherwise, click the  **Change Password** button. The password change is now queued.
$1
$2