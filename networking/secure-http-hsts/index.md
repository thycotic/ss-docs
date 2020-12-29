[title]: # (Securing Traffic with HTTP Strict Transport Security)
[tags]: # (Networking,HSTS,HTTP,man-in-the-middle attack)
[priority]: # (1000)

# Securing Traffic with HTTP Strict Transport Security


HTTP Strict Transport Security (HSTS) is an additional security layer for HTTPS that ensures anybody accessing a given Web site or entity is forced to use HTTPS and not HTTP *prior* to making any HTTP requests, eliminating man-in-the-middle attacks. HSTS is an IETF Internet Standards Track protocol as specified in RFC 6797.

When the Force HTTPS/SSL option in enabled in SS, the **Enable HSTS** check box is displayed. After the option is turned on, you can click the **Advanced** link to specify the **Maximum Age** in seconds, which is how long the policy is in affect before re-evaluating. The default value is 25200 seconds or seven hours. We recommend that you set the value as high as possible, up to a year if the site should never be accessed without SSL. Even after HSTS is disabled, your browser automatically redirects to over SSL for the duration of the configured maximum age.

> **Note:** We recommend using the IISReset command-line utility or restarting IIS in IIS manager after enabling the setting for the setting to take effect. 

This feature is available in Secret Server version 8.6.000009 and higher and Password Reset Server version 4.0.000000 and higher.

> **Note:** To see which browsers support HSTS, please refer to the [Strict Transport Security](http://caniuse.com/#feat=stricttransportsecurity) page on the Can I Use website.