[title]: # (Integrated Windows Authentication)
[tags]: # (Integrated Windows Authentication, IWA, Authentication, Credentials)
[priority]: #

# Integrated Windows Authentication

Windows integrated authentication allows Active Directory users that are synced with SS to log into workstations and be automatically authenticated to the application. A user's Active Directory credentials are automatically passed through to IIS, logging them into the site.

For further information, Microsoft has a [knowledge base article](http://support.microsoft.com/kb/258063) troubleshooting some common client-side issues with integrated authentication.

## Enabling Integrated Windows Authentication

Active Directory integration and synchronization must be enabled before configuring integrated Windows authentication:
$1
$2$1
$2$1
$2$1
$2
## Configuring IIS

Open IIS and highlight your SS website or application. In the right pane, double-click **Authentication**. Enable Windows Authentication and disable **Anonymous Authentication**.

> **Note:** For additional information on requirements and troubleshooting, see our [KB article on Integrated Windows Authentication](https://thycotic.force.com/support/s/article/Setting-Up-Integrated-Windows-Authentication-in-Secret-Server-10-0).

## Logging on As a Local Account

After you have set up integrated Windows authentication, you may sometimes want to log in as a local admin account to configure SS, perform an upgrade, or if AD is down.
$1
$2$1
$2$1
$2$1
$2