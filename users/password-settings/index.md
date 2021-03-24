[title]: # (Password Settings)
[tags]: # (Users)
[priority]: #

# Password Settings

The following settings are found in the **Administration > Configuration** page, inside the **Local User Passwords** tab. These settings apply to users that were created manually, not users brought into SS through Active Directory synchronization:

- **Allow Users to Reset Forgotten Passwords:** If enabled, the "Forgot your password?" link appears on all users' login screens. Clicking on this link prompts the user to enter the email address that is associated with the user's SS account. If the email address is found, then an email containing a link for password reset is sent. Note that this only works for local user accounts and not for Active Directory accounts.
- **Enable Local User Password Expiration:** When enabled, SS forces a password change for a user after a set interval. After the interval time has elapsed, the next time the user attempts to log in, they are prompted for the old password, a new password, and a confirmation of the new password. The new password is validated against all the password requirements. Newly created local users are also be prompted to change their password upon logging into SS for the first time when this setting is enabled.
- **Enable Local User Password History:** If enabled, this prevents a user from reusing a password. For example, if set to "20 Passwords", this would prevent the user from using a password they have used the previous 20 times. This in conjunction with "Enable Minimum Local Password Age" helps ensure that users are using a new and unique password frequently rather than recycling old passwords.
- **Enable Local User Password Expiration:** When enabled, SS forces a password change for a user after a set interval. After the interval time has elapsed, the next time the user attempts to log in, they are prompted for the old password, a new password, and a confirmation of the new password. The new password is validated against all the password requirements. Newly created local users are also be prompted to change their password upon logging into SS for the first time when this setting is enabled.
- **Local User Password is valid for:** If enabled, this is the interval that a local user password is valid before it must be changed (see "Enable Local User Password Expiration" setting for details). If this setting is disabled, the entered value displays as "Unlimited".
- **Enable Local User Password Expiration:** When enabled, SS forces a password change for a user after a set interval. After the interval time has elapsed, the next time the user attempts to log in, they are prompted for the old password, a new password, and a confirmation of the new password. The new password is validated against all the password requirements. Newly created local users are also be prompted to change their password upon logging into SS for the first time when this setting is enabled.
- **Minimum Password Length:** Force all user SS login passwords to contain a set minimum number of characters.

  > **Note:** The maximum number of characters is 1024.

- **Numbers Required for Passwords:** Force all user SS login passwords to contain at least one number.
- **Symbols Required for Passwords:** Force all user SS login passwords to contain at least one symbol, such as `!@#$%^&*`.
- **Uppercase Letters Required for Passwords:** Force all user SS login passwords to contain at least one uppercase letter.
