[title]: # (Minimum Requirements for Windows Local Accounts)
[tags]: # (Minimum Requirements for Windows Local Accounts)
[priority]: # (1000)

# Minimum Requirements for Windows Local Accounts

Due to a security issue ([MS KB3178465](https://support.microsoft.com/en-us/help/3178465/ms16-101-security-update-for-windows-authentication-methods-august-9-2)), we do not allow Windows local accounts to change their own passwords. Instead, we recommend using the discovery privileged account to change them. Each privileged account should meet the following requirements:

- Must be a domain user
- Must be a member of the local administrator group on all target end points

> **Note:** The discovery account for SS can also be used for RPC.
