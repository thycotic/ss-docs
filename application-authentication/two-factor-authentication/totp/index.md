[title]: # (TOTP)
[tags]: # (2FA)
[priority]: # (50)

# TOTP

SS supports using any type of soft token or mobile app authentication using the *Time-Based One-Time Password* (TOTP) RFC6238 algorithm. TOTPs are usually generated  by a mobile app using an algorithm that incorporates the current time to ensure that each one-time password (OTP) is unique. This includes Google Authenticator and Microsoft Authenticator. In addition, SS can be an OTP generator, allowing for TOTP authentication for RPC and launchers.
