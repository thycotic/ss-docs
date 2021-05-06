[title]: # (TOTP)
[tags]: # (Authentication, Credentials, 2FA)
[priority]: #

# TOTP

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

Secret Server supports using any type of soft token or mobile application authentication using the *Time-Based One-Time Password* (TOTP) RFC6238 algorithm. TOTPs are typically generated and authenticated by a mobile application using an algorithm that incorporates the current time to ensure that each one-time password (OTP) is unique. TOTP applications include Authy, Google Authenticator, and Microsoft Authenticator. 

Secret Server can also serve as an OTP generator, providing TOTP authentication for RPC and launchers. The soft token two-factor function in Secret Server is the “TOTP Authenticator” and you can use any application that uses the TOTP RFC6238 standard (details on the standard can be found at the [IETF Tools website](https://tools.ietf.org/html/rfc6238). An example of a TOTP application that works with Secret Server soft token two-factor authentication is Microsoft Authenticator.
