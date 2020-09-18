[title]: # (Dependency Token List)
[tags]: # (API,Scripting,Dependency token)
[priority]: # (1000)

# Dependency Token List

## Overview

A list of all valid tokens that can be used in PowerShell, SSH, and SQL dependency script arguments.

PowerShell, SSH, and SQL dependencies can have script arguments that derive their values from values on the dependency, the secret it belongs to, or any other secrets associated for remote password changing. Starting with Secret Server 10.0, tokens can also be used in ODBC connection string arguments. Script arguments are defined on dependency changers in Secret Server 10.0 and above and on the dependency in earlier versions of Secret Server. The following table lists the tokens available to dependency scripts.

## Best Practices

### Wrap Fields in Quotation Marks

When specifying PowerShell arguments, the $fieldname argument is replaced with  the information in the field, and *then* the whole string is passed to PowerShell. Thus, if the string returned has spaces,  PowerShell parses the spaces as separate arguments, which causes errors.

Therefore, we recommend you wrap your fields in two quotation marks. For example: `"$fieldname"`,  which is then parsed by PowerShell as one string.

### Avoid Using Spaces in Field Names

We recommend not using spaces within your field names. In many cases, that would not cause a problem, but if the first word in the field name is also a reserved word, it will cause an error because the reserved word is parsed separately from the rest of the field name.

For example, a field named:

`$machine name`

Because `$machine` is a reserved word, the parser would separate the reserved `$machine` value, followed by `name` as a separate argument.

> **Note:** Surrounding the field name in quotation marks would *not* fix this—SS makes the substitution prior to PowerShell parsing the string.

## Token List

**Table:** Dependency Tokens

Token                              | Available In | Translates To
---------------------------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
`$USERNAME`                          | pre-10.0     | The username on the secret.
`$PASSWORD`                          | pre-10.0     | The password on the secret.
`${name of any field on secret}`     | pre-10.0     | The value of the field on the secret with the same name. Examples: `$DOMAIN` matches the secret's "Domain" field, and `$NOTES` matches the "Notes" field.
`$[x]$USERNAME`                      | pre-10.0     | The username on the xth secret on the RPC tab for use in custom password changing commands and scripts. Example: `$[1]$USERNAME` is the username of the first associated secret.
`$[x]$PASSWORD`                      | pre-10.0     | The password on the xth secret on the RPC tab for use in custom password changing commands and scripts.
`$[x]${name of any field on secret}` | pre-10.0     | The value of the field with the same name on the xth secret on the RPC tab for use in custom password changing commands and scripts.
`$DATABASE`                          | pre-10.0     | The value of the Database field from the dependency. Only valid for SQL dependencies unless added as a field by the scan item template (see below).
`$PORT`                              | pre-10.0     | The value of the Port field from the dependency. Only valid for SQL and SSH dependencies unless added as a field by the scan item template (see below).
`$SERVICENAME`                       | 10.0         | The value of the Service Name field on the dependency. Service Name may have a different name based on the dependency type, but it is always the first part of the dependency title (\<service name\> on \<machine\>).
`$MACHINE`                           | 10.0         | The value of the Machine Name field on the dependency. This is always the second part of the dependency title (\<service name\> on \<machine\>).
`${scan item field name}`            | 10.0         | The name of any scan item field (defined on the scan item template) that is visible in the dependency edit dialog. If a scan item field is derived from a parent field, you may also use the parent field name as a parameter that translates to this field's value.
`$CURRENTPASSWORD`                   | pre-10.0     | The password currently on the secret (context-sensitive to whether script is run before or after password change).
`$NEWPASSWORD`                       | 10.2         | This is not available to the dependency at the time of the password change. It will no longer be set as the NewPassword gets set to the Password.
`$PRIORPASSWORD`                     | 10.2         | In the context of a password change, this is the password at the beginning of the password change. The password that was set on the secret before the current password change. In the context of run dependency from the Dependency tab, this is the prior value of the password before the last password change.
`$PASSPHRASE`                        | 10.2         | The passphrase used to encrypt the private key in a public/private key pair on this secret.
`$PRIORPASSPHRASE`                   | 10.2         | The passphrase that was set on the secret before the current passphrase rotation.
`$PUBLICKEY`                         | 10.2         | The public key on the secret.
`$CURRENTPUBLICKEY`                  | 10.2         | The public key currently on the secret (context-sensitive to whether script is run before or after key rotation).
`$NEWPUBLICKEY`                      | 10.2         | The new public key that is being set on the secret.
`$PRIORPUBLICKEY`                    | 10.2         | The public key that was set on the secret before the current key rotation.
`$DEPENDENCYPRIVILEGEDUSERNAME`      | 10.3         | The user name on the privileged account assigned to the dependency.
`$DEPENDENCYPRIVILEGEDPASSWORD`      | 10.3         | The password on the privileged account assigned to the dependency.
`$DEPENDENCYPRIVILEGEDPRIVATEKEY`    | 10.3         | The private key on the privileged account assigned to the dependency.
`$DEPENDENCYPRIVILEGEDPASSPHRASE`    | 10.3         | The private key passphrase on the privileged account assigned to the dependency.
`$DEPENDENCYSSHKEY`                  | 10.3         | The new SSH key to set on the dependency.
`$DEPENDENCYSSHKEYPASSPHRASE`        | 10.3         | The new passphrase of the SSH key to be set on the dependency.

> **Note:** Some of these tokens, such as `$PASSWORD`, `$CURRENTPASSWORD`, `$NEWPASSWORD`, and `$PRIORPASSWORD`, may seem to duplicate each other, but they have distinctions based on the context as described above.

> **Note:** In some cases, whether or not the dependency is being changed locally or through a distributed engine may have an impact on what these tokens return. This is due to the asynchronous nature of distributed engines. The newer tokens, such as `$NEWPASSWORD` and `$PRIORPASSWORD`, were created to address this issue. If you are using older tokens, such as `$PASSWORD` and `$CURRENTPASSWORD`, and seeing unexpected results, try using `$PRIORPASSWORD` and `$NEWPASSWORD`.
