[title]: # (Privileged Accounts and Reset Secrets)
[tags]: # (Privileged Accounts and Reset Secrets)
[priority]: # (130)

# Privileged Accounts and Reset Secrets

By default, RPC uses the credentials on secret option, using the credentials stored in the secret to invoke a password change. For Windows and Active Directory accounts, a privileged account can be used instead by selecting the Privileged Account Credentials option and selecting an Active Directory secret with permission to change the account's password.

For secret templates with a custom commands password type, any number of associated reset secrets can assign for use in the custom commands. See [Custom Command Sets](#Custom-Command-Sets) (Professional or Premium Edition) for details on resetting secrets in custom commands.

When a secret is wired up with a privileged account or reset secrets, the ability to edit the username, host, domain, or machine is restricted if the user does not have access to those associated secrets. On the RPC tab, the user sees "You do not have access to View this secret" for the secret name and on the Edit page all text-entry fields mapped for RPC except the password is disabled. This added security prevents the user from changing the username and resetting another account's password.

> **Note:** If the user does not have access to the privileged account or reset secrets, the ability to edit all secret text-entry fields mapped for RPC except the password text-entry field is restricted to prevent changing the password on another account.
