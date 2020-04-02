[title]: # (Using the Java Console API to Access Secret Values)
[tags]: # (none)
[priority]: # (20)

# Using the Java Console API to Access Secret Values

SS can set up a Java Console API to retrieve values from SS without embedding a password. This allows scripts to retrieve passwords from SS while keeping both the password and credentials to SS secure. The SS Java Console is setup using a user in SS, but the password is changed and hardware-specific, so copying the jar file to other machines does not allow it to access SS. As a user in SS, an admin can share only specific secrets with the account running the Java Console. As a Java implementation, this can be used on any OS including Windows, Mac, Linux and Unix. For installation instructions and examples see the [Application API Guide](https://updates.thycotic.net/secretserver/documents/SS_AppServerAPIGuide.pdf).
