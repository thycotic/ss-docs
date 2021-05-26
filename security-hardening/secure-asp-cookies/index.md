[title]: # (Securing ASP Cookies)
[tags]: # (Best Practice, Security Hardening, asp, cookies)
[priority]: # (1000)
[redirect]: # "SecureCookieSessions"

# Securing ASP Cookies

To secure your ASP session and forms authentication cookies, perform the following steps:

1. Ensure that there is an SSL certificate installed for the instance.

1. Log in to Secret Server using HTTPS.

1. Navigate to the **Admin > Configuration** page

1. Click on the **Security** tab.

1. Click the **Edit** button

1. Check the **Force HTTPS/SSL** check box

1. Click the **Save** button.

1. Open the `web-cookie.config` file in the application installation folder.

1. Set `requireSSL` to `true`.

   Save and Close the file.

1. Open the `web-auth.config`file in the application installation folder.

1. Set `requireSSL` to `true` . If the attribute does not exist, add it to the `forms` tag.

   Save and Close the file.

1. Recycle the Secret Server's application pool.

> **Important:** If you later migrate Secret Server to a new server, SSL must be configured on the new server before you can log in due to these settings. If you want to log in prior to configuring SSL, reverse steps 8 through 13 and recycle the application pool.