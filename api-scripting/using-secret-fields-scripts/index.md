[title]: # (Using Secret Fields in Scripts)
[tags]: # (REST API,API,Scripting,PowerShell,secret fields,dependency tokens)
[priority]: # (1000)

# Using Secret Fields in Scripts

Secret Server supports using PowerShell, SSH, and SQL scripts as dependencies on a secret. These scripts can use information on the secret through the field name prepended with a `$`.  For example, `$DOMAIN`, `$PASSWORD`, or `$USERNAME`. Linked secrets are accessible by `$[1]$FIELDNAME` for the first linked secret, `$[2]$FIELDNAME` for the second, and so on.  

There are two contexts in which script dependencies run:

- As part of the RPC process. See [Password Changing Scripts](../../remote-password-changing/custom-password-changers/password-changing-scripts/index.md).
- When run manually from the Dependencies tab on the secret.

For a complete list of tokens that are available to script dependencies, see [List of Dependency Tokens](../dependency-tokens/index.md).