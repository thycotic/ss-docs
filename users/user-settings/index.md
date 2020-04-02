[title]: # (User Settings)
[tags]: # (Users)
[priority]: #

# User Settings

Below is a brief explanation of each text-entry field or control:

- **Display Name:** Text that is used throughout the user interface, such as in audits.

- **Domain:** If a drop-down list is visible, selecting a domain from the list is one way to set the expected domain of the user. However, a more dynamic way to have this text-entry field (and all the other text-entry fields) set is through Active Directory synchronization.

- **Email Address:** Email address used for Request Access, email two-factor authentication, and the like.

- **Email Two-Factor Authentication:** On a login attempt, the user has an email sent to the email address entered above. This email contains a pin code that the user needs to log into the account. See [Email Two-Factor Authentication](../../application-authentication/two-factor-authentication/email-two-factor-authentication/index.md) for details.

- **Enabled:** Disabling this control removes the user from the system. Effectively, this is the way to delete a user. SS does not allow complete deletion of users due to auditing requirements. To re-enable a user, navigate to the **Administration > Users page**, check the **Show Inactive Users** checkbox just under the **Users** grid, and edit the user to mark them enabled (see [Configuring Users](../configuring-users/index.md)).

- **Locked Out:** If checked, then this user has been locked out of the system due to too many login failures. To remove the lock, uncheck the check box. For more details on locking out users, see Maximum Login Failures setting described in the Login Settings section.

- **Password:** Login password for the user. For the various login settings, see Login Settings section.

- **RADIUS Two-Factor Authentication:** This text-entry field only appears if RADIUS authentication is enabled in the configuration. On a login attempt, the user must enter the RADIUS token sent from the RADIUS server. See [RADIUS Authentication](../../application-authentication/two-factor-authentication/radius-user-authentication/index.md#Radius-Authentication).

- **RADIUS User Name:** This text-entry field only appears if the above RADIUS Two Factor Authentication setting is enabled. This is the username the RADIUS server is expecting. See [RADIUS Authentication](../../application-authentication/two-factor-authentication/radius-user-authentication/index.md#Radius-Authentication).

- **User Name:** Login name for the user.

> **Note:** A new user is assigned the User role by default. For more information on roles, see "Roles."
