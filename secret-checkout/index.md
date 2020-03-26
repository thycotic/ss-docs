[title]: # "Secret Check Out"
[tags]: # "Check Out"
[priority]: # "1000"

# Secret Check Out

The SS _check-out_ feature forces accountability on secrets by granting exclusive access to a single user. If a secret is configured for check out, a user can then access it. If **Change Password on Check In** is turned on, after check in, SS automatically forces a password change on the remote machine. No other user can access a secret while it is checked out, except unlimited administrators. This guarantees that if the remote machine is accessed using the secret, the user who had it checked out was the only one with proper credentials at that time.

> **Note:** The exception to the exclusive access rule is unlimited administrators. If Unlimited Administration is enabled, users with Unlimited Administrator role permission can access checked out secrets.
>
> **Note:** Secrets with a doublelock cannot be configured for check out.
