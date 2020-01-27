[title]: # (Email Two-Factor Authentication)
[tags]: # (XXX)
[priority]: # (20)

# Email Two-Factor Authentication

SS requires that a connection to a SMTP server be properly configured to send out confirmation code emails. Enter the SMTP server information and an email address that is used to send notifications:

   1. Click **Admin > Configuration**.

   1. Click the **Email** tab.

   1. Verify SMTP server availability with telnet using the command `telnet <your server name> 25`.

   > **Note:** If virus protection is running, you may need to add a firewall rule to allow aspnet_wp.exe to send e-mails.
