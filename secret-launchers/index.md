[title]: # (Secret Launchers and Protocol Handlers)
[tags]: # (Launcher, protocol handler)
[priority]: # (1000)

# Secret Launchers and Protocol Handlers

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

A secret _launcher_ launches applications on end-user machines and automatically logs on using credentials stored in SS.  In general, there are three types of launchers: RDP, SSH, and Custom. This provides a convenient method to open RDP and PuTTy connections, but it also circumvents users needing to know their passwords—a user can still gain access to a needed machine but it is not required to view or copy the password out of SS. A Web launcher automatically logs into websites using the client's browser.

A *protocol handler* is an application on an end-user's machine. It enables communication between SS and that client machine. It also provides the files needed by launchers. When a SS user starts a launcher:

1. The protocol handler bootstraps the client-side application.

1. The protocol handler communicates with Secret Server over HTTP(S) to ensure that it is the latest version. If not, it begins an upgrade process.

1. The protocol handler bootstraps the target launcher type and begin the process of securely logging in the user. Beyond HTTP(S) transport protection, credentials are retrieved securely from SS using signed AES-256-encrypted messages.

