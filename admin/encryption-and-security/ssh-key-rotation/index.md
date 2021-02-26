[title]: # (SSH Key Rotation)
[tags]: # (ssh,key rotation)
[priority]: # (1000)
[display]: # (all)

# SSH Key Rotation

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

SSH Key Rotation allows you to manage your Unix account private keys and passphrases as well as their passwords. With key rotation, whenever the password is changed on the secret (manually, during a scheduled auto-change, or when checking in a secret that changes the password on check-in), the public/private key pair will be regenerated and the private key encrypted using a new passphrase. The public key will then be updated on the Unix machine referenced on the secret.

There are two topics addressed here:

- [Basic SSH Key Rotation](./ssh-key-rotation-basic/index.md): A step-by-step tutorial on quickly getting started with the default SSH key rotation secret types and password changers.
- [Custom SSH Key Rotation](./ssh-key-rotation-custom/index.md): Provides additional information for users who need to customize the default commands for their environment.



