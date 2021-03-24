[title]: # (Active Directory)
[tags]: # (Active Directory)
[priority]: # (1000)

# Active Directory Rights for Synchronization Account

Below is a listing of the Active Directory permissions required by the account used for synchronization.

## Recommended Permissions

###  Object Tab

This object and all descendant objects:

- List contents
- Read all properties

## Minimum Required Permissions

> **Note:** These all require ADSI Edit - Allow (Active Directory Service Interfaces Editor) permission.

### Object Tab

This object and all descendant objects:

- List contents

### Properties Tab

This object and all descendant objects:

- Read objectClass

Descendant User objects:

- Read Display Name
- Read Distinguished Name
- Read E-mail-Address
- Read Distinguished Name
- Read Logon Name
- Read Logon Name (pre-Windows 2000)

Descendant Group objects:

- Read displayName
- Read Distinguished Name
- Read Group name (pre-Windows 2000)
- Read Distinguished Name
- Read memberOf
- Read Distinguished Name
- Read objectGUID
