[title]: # (User Login Settings)
[tags]: # (User)
[priority]: #

# User Login Settings

SS users can be set up with many different login requirements. For example, you can force strong Login passwords by requiring a minimum length and the use of various character sets.

The following settings are available under the **Administration > Configuration** page, inside the **Login** tab:

- **Allow AutoComplete:** AutoComplete is a feature provided by most Web browsers to automatically remember and pre-fill-in forms for you. This can be a great security concern since they typically do not save the data in a secure manner. You can enable or disable Web browser pre-fill on the login screen by using this option.
- **Allow Remember Me:** This option enables the Remember Me checkbox on the Login screen. When a user chooses to use remember me, an encrypted cookie is set in their browser. This enables the user to revisit SS without the need to log in. This cookie is no longer be valid when the remember me period has expired. They then have to enter their login information again. This option allows users to remain logged in for up to a specific period (specified in the "Remember Me Is Valid for" setting mentioned below). This option can be a security concern as it does not require re-entry of credentials to gain access to SS.

> **Note:** "Remember me" is only visible if the "Allow Remember Me" setting is enabled. This is the period that the remember me cookie mentioned above is valid. For example: if set to one day, then users taking advantage of "remember me" have to log in at least once a day. To set a time value (minutes, hours, or days), uncheck the Unlimited checkbox.

- **Enable RADIUS Integration:** Allow for RADIUS server integration with your user login authentication. Other RADIUS settings appear upon enabling this option. These settings are discussed in [RADIUS Authentication](../../authentication/two-factor-authentication/radius-user-authentication/index.md#Radius-Authentication).
- **Maximum Concurrent Logins Per User:** This setting allows a user to log into SS from multiple locations at once without logging out their sessions at other locations.
- **Maximum Login Failures:** Set the number of login attempts allowed before a user is locked out of their account. Once locked out, they need a SS administrator to reset their password and enable their account. For details on how to reset a locked account, see [Creating Users](../creating-users/index.md).
- **Require Two Factor for these Login Types:** This setting specifies which types of login require two-factor authentication:

  - Website and Web service Log on
  - Website log on only
  - Web service log on only

- **Visual Encrypted Keyboard Enabled:** This setting enables a visual keyboard for logins.
- **Visual Encrypted Keyboard Required:** This setting requires a visual keyboard for logins.
