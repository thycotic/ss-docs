[title]: # (SSH Authentication Templates)
[tags]: # (Template)
[priority]: # (20)

# SSH Authentication Templates

With this SS feature, admins can use private SSH keys for PuTTY launcher sessions as well as for RPC tasks (configurable through password changer settings) and Unix and Linux discovery. Passphrases can additionally be stored, if necessary, to decrypt the private keys for additional security. The Unix Account (SSH) secret template includes text-entry fields for the private key and passphrase by default:

The SSH Key template is included by default and can be used to store SSH keys that can later be selected for use in RPC, discovery or launcher authentication for other secrets:

> **Note:** Starting with version 10.1.000000, SS also supports SSH key rotation on secrets.

The **Unix Account (SSH Key Rotation)** and **Unix Privileged Account (SSH Key Rotation)** secret templates use password changers that change the public key in the account's `authorized_keys` file as well as change the password on the account. SS ships with a password changer and custom command sets that allow an account to change its own public key and password, and a password changer and custom command sets that changes a user's public key and password using a privileged account. These scripts can be customized for different Unix environments.

For more information about SSH Key Rotation, see the [SSH Key Rotation](https://thycotic.force.com/support/s/article/SSH-Key-Rotation) (KBA) and [SSH Key Rotation Quick Start](https://thycotic.force.com/support/s/article/SSH-Key-Rotation-Quick-Start) (KBA).
