[title]: # (Remote Password Changing Errors)
[tags]: # (Remote Password Changing,errors)
[priority]: # (1000)
[redirect]: # "PasswordChangingErrors"
# Remote Password Changing Errors

## Overview

This topic lists some of the common errors experienced when setting up Remote Password Changing (RPC) for an account. 

To view the errors, navigate to **Admin \> Remote Password Changing** in Secret Server and look for the name of the secret you are testing.

## Errors

### The user name cannot be found

For local Windows accounts, ensure you only have the username in the username field (do not include the machine name). The machine name should go in the Machine field only. If the RDP Launcher stops working when you remove the machine name from the username field, see [RDP Proxy Configuration](../../networking/rdp-proxy-configuration/index.md). 

### Change password failed: Unknown. (ERROR_CANT_ACCESS_DOMAIN_INFO)

For RPC on local Windows accounts, this error can be deceptive because the built-in Windows method used to change a password takes either a machine or domain name, so if the machine is not found, it thinks a domain was passed in and throw a domain error. 

For RPC on Active Directory accounts, this error may occur if the account does not have permission to perform the password change or the domain name is wrong or abbreviated. Verify by checking the account properties in Active Directory or log in to the account and try to change the password manually or use privileged secret to perform the RPC.

> **Note:** The RPC process uses information from the secret, not a central configuration for resetting the password. The Active Directory configuration settings are used for user synchronization only, so ensure the information on the secret is correct, including the Active Directory domain.

Common causes include:

- The machine name is wrong or abbreviated. For example: comp3 is entered as the machine name instead of comp3.yourdomain.com.

  Try replacing the machine name in the secret with the IP address of the machine and seeing if you still receive the domain error.

- The firewall is blocking the ports. See [Secret Server Ports](../../networking/secret-server-ports/index.md).

Monitor activity to see if the authentication is accepted on the machine by viewing the security log:

1. Run secpol.msc from the Run prompt. 

1. Click on Local Policies, Audit Policy.  

1. Turn on "Audit account logon events" and "Audit logon events" for both Successes and Failures.  

1. View the logs at Administrative Tools \> Event Viewer. Check the Security Logs to determine whether the requests are getting through to the computer.

   > **Note:** The RPC log looks different if the firewall denies the connection, and will show  ERROR_ACCESS_DENIED in some cases.
   >
   > Firewall settings also apply to changing passwords on the local machine that Secret Server is running on because net authentication is used.

### Change password failed: Unknown. (NERR_PasswordPolicySettings)

Cause: repeating password or a password that does not meet domain standards. 

Check the minimum password age. When performing RPC on Active Directory accounts, this error may occur due to a minimum password age policy on the domain. If the minimum password age is set to 1 day or greater, and due to testing, the password has already been changed once, a follow up password change will violate the domain policy.

If you need to change the user's password more than the policy allows, change their policy so they are not subject to minimum password ages, or use the privileged account option in the Remote Password Changing tab on the secret. Privileged account will perform a password reset instead of changing the password using the accounts credentials.

### Change password failed: Unknown. (ERROR_ACCESS_DENIED)

Cause: User account is set to Not Able to Change Password, firewall denial, or login incorrect.  May also occur when the userWorkstations attribute on the user is set.

### Change password failed: Unknown. (ERROR_INVALID_PASSWORD)

Cause: Either the user does not exist (ensure the usernames match) or the password is not correct.

### Change password failed: Unknown. (ERROR_ACCOUNT_LOCKED_OUT)

Cause: User account is locked out.

### ExpiredSecretMonitor - Unspecified error

Cause: Firewall issue or ports are blocked.

### DirectoryEntry.Invoke SetPassword - The network path was not found.

Cause: Domain can not be found from the computer. Check the machine can ping the domain.

### Secret '[secretname]' (Id = [secretid]) returned (ArgumentError). Exception: Command requires associated Item. ($[1]$USERNAME) 

Cause: the password changer for the secret template this secret is based on is looking for an "associated secret." Associated secrets are additional accounts that are needed in the password change process. 

You can view the commands being used for the password change and add the associated Secret by going to the Remote Password Changing tab of the Secret in question and clicking Edit (you may also need to click Show Commands).

### Error changing password - Check Out is enabled on associated Secret.

Cause: The secret has a Privileged Account Credentials option selected for performing the password change and the privileged account secret has the Require Check Out option enabled. This configuration causes an error with the remote password change process because the Required Check Out option is not intended for use by the system to avoid conflict from user's request, which is the intended usage.