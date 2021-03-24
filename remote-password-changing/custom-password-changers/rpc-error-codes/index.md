[title]: # (RPC Error Codes)
[tags]: # (RPC Error Codes)
[priority]: # (1000)

# RPC Error Codes

The most common RPC errors are:

- **NERR_PasswordPolicySettings**: The password SS attempted to set is a repeating password or one that does not meet domain password policy standards. A common reason is minimum password age, which is often defaulted to 24 hours.
- **ERROR_ACCESS_DENIED**: The user account's "Not Able to Change Password" setting could not be set or logon was denied.
- **ERROR_INVALID_PASSWORD**: Either the user does not exist (ensure the usernames match) or the password is not correct.

For more information about common error messages for Remote Password Changing, see [Remote Password Changing Errors](https://updates.thycotic.net/links.ashx?PasswordChangingErrors) (KB).
