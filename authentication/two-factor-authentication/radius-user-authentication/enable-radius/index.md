[title]: # (Enabling RADIUS Two-Factor Authentication)
[tags]: # (Authentication, Credentials, RADIUS, 2FA)
[priority]: # (1000)
[redirect]: # "SecretServerRadiusIntegration"

# Enabling RADIUS Two-Factor Authentication

Secret Server allows the use of RADIUS two-factor authentication on top of the normal authentication process for additional security.

 See the full [RADIUS Integration Guide](https://updates.thycotic.net/secretserver/documents/SS_INT_RADIUS.pdf) for additional information.

To configure RADIUS for the SS instance:

1. Log on SS with an account with "Administer Configuration" and "Administer RADIUS" permissions.

1. Navigate to **Administration menu** > **Configuration** > **Login**.

1. Click the **Edit** button.

1. Type the following:

   - **RADIUS Server IP** (IP address to your RADIUS Server)
   - **RADIUS Client Port** (default 1812)

   > **Note:** If your RADIUS server runs on the same machine as SS, the client and server ports must be different.

   - **RADIUS Server Port** (default 1812 for RSA and 1812 for AuthAnvil).
   - **RADIUS Shared Secret**, which must match chosen RADIUS shared secret on your RADIUS Server. (Shared Secret is a RADIUS term and not related to any Secret Server secret.)
   - **RADIUS Login Explanation** (custom message or instruction). Defaults to "Please enter your RADIUS passcode."

1. Click the **Save** button.

To test RADIUS settings:

1. Click the **Test RADIUS Login** button. A popup appears.

2. Type the RADIUS username and password.

2. Click the **OK** button.

2. After enabling RADIUS on SS, you must enable RADIUS two-factor authentication for each user:

   1. Sign into an account with "Administer Configuration" and "Administer RADIUS" permissions.

   1. Navigate to **Administration** > **Users**. The Users page appears.

   1. Select the desire user.

   1. Click the **Edit** button.

   1. Click to select the **RADIUS Two Factor Authentication** check box.

   1. Type the username in the **RADIUS Username** text box.

      > **NOTE**: Secret Server defaults this value to its username. If you wish to use this default name, it must match the username on the RADIUS server.

   1. Review the settings and click **Save**.

   1. Repeat these steps for each user that needs to use RADIUS.
