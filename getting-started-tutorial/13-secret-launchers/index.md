[title]: # (13. Secret Launchers)
[tags]: # (Launchers)
[priority]: # (1013)

# Step 13: Secret Launchers

A secret _launcher_ opens a connection to the remote computer or device or logs into a website using the secret's credentials directly from the Web page. While this provides a convenient method of opening RDP and PuTTY connections, it also circumvents users being required to know their passwords. A user can still gain access to a needed machine, but it is not required to view or copy the password out of SS. A Web launcher automatically logs into websites using the client's browser.

SS launchers, also called protocol handlers, come in three primary types:

- **Remote Desktop:** Launches a Windows Remote Desktop session and automatically authenticates the user to the machine.
- **PuTTY:** Opens a PuTTY session and authenticates the user to a Unix system.
- **Web Password Filler:** Uses a bookmarklet or a Chrome extension to automatically log the user into a website with secret credentials. See our separate documentation for Web Password Filler.
- **Web Launcher:** An alternative method to automatically log on websites. See [Web Launcher](../../secret-launchers/web-launchers/index.md).

See [Secret Launchers](../../secret-launchers/index.md) for more information.
