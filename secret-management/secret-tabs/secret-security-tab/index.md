[title]: # (Secret Security Tab)
[tags]: # (Security)
[priority]: # (1000)

# Secret Security Tab

The Security tab contains settings that can be enabled to increase security for a secret. The settings listed below may or may not be visible, depending on your configuration settings:

## Check Out

- **Require Check Out:** Only one user at a time has access to a secret. When enabled users must checkout a secret before they can access it. Checkout prevents other users from accessing the Secret while it is checked out. See [Secret Checkout](../../../secret-checkout/index.md) for details.
- **Check Out Interval:** The default time a checkout lasts.

## Approval

**Require Approval Type:** Require users to get approval before accessing this secret. Define whether standard users, editors, or everyone has to have approval and the workflow through which approval occurs.

## Password Requirements

- Defines which password rules apply to password fields on this secret. By default, a secret uses the password requirements as defined on the secret template and can be overridden per secret as needed. 
- **Validation:** Lists requirements from the template.
- **Password:** Either confirms the default or lists the chosen override.
- **Private Key Passphrase:** The password required to access a private key. Either confirms the default or lists the chosen override.

## Other Security

- **Require Comment:** Users must enter a comment before being granted access to view the secret. The comment is stored in the audit log for that secret.
- **Enable DoubleLock:** User must enter a doubleLock password to decrypt and view a secret.
- **Enable Proxy:** Enable or disable proxying. When enabled, SSH and RDP launcher traffic passes through SS.
- **Enable Session Recording:** Record the Launcher session. This applies to secrets with a launcher associated with the secret template.
- **Viewing Password Requires Edit:** To view the password, the user must have at least edit permission.
