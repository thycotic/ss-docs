[title]: # (Using Two-Factor Authentication with Thycotic One)
[tags]: # (Authentication,2fa,two factor,thycotic one)
[priority]: # (1000)

# Using Two-Factor Authentication with Thycotic One

Thycotic One supports two-factor authentication (2FA) via TOTP (Google Authenticator) or SMS. When two-factor authentication is enabled, Thycotic One presents the user with a two-factor challenge after the user logs in. This authentication adds to and does not replace any other two-factor authentication methods a client app (such as Secret Server) may be configured to use. We recommend using TOTP over SMS if possible for improved security.
 	
Step 1: To use SMS, you’ll need to add and verify a mobile phone number before enabling two-factor authentication. A phone number is not required for the TOTP method. To add a phone number, log in to Thycotic One, and then click Profile in the User Home - Apps dialog on the account homepage. To use TOTP app, start from Step 4:

Step 2: Click Add Phone and enter the country code and phone number you would like to use and able to accept text messages. Once a valid phone number has been entered, click +Add and Verify. This will send a text message to the entered phone number, and ask you to enter a code:

Step 3: Once you have received the text message, enter the code and click Submit in the Verification Code dialog:

This will complete the addition of the phone number, and it will now appear as Verified on your profile page.

Step 4: To enable two-factor authentication in Thycotic One, log in and then click the Two-Factor Authentication link on the account homepage:

Step 5: Choose the method you want to use (TOTP or SMS) and click Enroll for that method. You can only have one two-factor authentication method active at the same time.

Step 6: To use TOTP two-factor authentication, you’ll need a mobile device with a TOTP app (such as Google Authenticator, Authy, or Microsoft Authenticator) installed. If using SMS, go to Step 9.

Step 7: Click Enroll for the TOTP two-factor method:

Step 8: This will display a barcode (it has been redacted in the example below). Using the TOTP app on your mobile device, scan the barcode and enter one of the generated six-digit codes in the Verification Code field:

A new code will be generated every 30 seconds. Once you have entered in the correct code, TOTP two-factor authentication will be fully set up, and you’ll be prompted to enter in a new code from your mobile device each time you log in.

Step 9: To use SMS two-factor authentication, you’ll need to have a verified primary phone number on your account (Step 2 shows how to add a phone number). Click Enroll for the SMS two-factor method.

Step 10: Click the button to send a text message to your phone. When you receive the message, enter the six-digit code into the box provided:

Once you have entered in the correct code, SMS two-factor authentication will be fully set up. Each time you log in, you’ll receive a text message, and you’ll need to enter the provided code in order to complete the login process.


