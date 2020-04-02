[title]: # (Secret DoubleLocks)
[tags]: # (DoubleLock)
[priority]: # (1000)

# Secret DoubleLocks

SS's _doublelock_ is a feature that provides an additional security layer by encrypting secret data with a supplemental custom encryption key that is only accessible with an additional password, regardless of regular permissions, SS login access, or physical access to the machine running SS. Doublelock uses private and public key encryption technology to securely share access to doublelock.

A shortcut way of thinking about doublelocks is as a special extra password for secrets that is held by a set group of users. In addition, both the password and the group of users are reusable for other secrets.
