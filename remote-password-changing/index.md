[title]: # (Remote Password Changing)
[tags]: # (Remote Password Changing)
[priority]: # (1000)

# Remote Password Changing

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

*Remote Password Changing* (RPC) allows secrets to automatically update a corresponding remote account. You can set secrets for automatic expiration, followed by automatic strong password generation and a remote password update to keep the subject accounts synchronized with Secret Server.

RPC allows SS to rotate passwords to meet domain password policy requirements. In most cases, RPC is configured with the secret "auto change" setting set to true. This causes the secret to rotate the password as soon as it expires. The "auto change schedule" setting changes the password on a set schedule, rather than when it expires. This provides the ability to change passwords when network activity is lower. You have a choice of changing the password as soon as the schedule interval arrives or only after the secret expires *and* the interval arrives. It is important to choose a large enough interval to complete all your password changes, otherwise any excess changes will have to wait for the next interval. Because the smallest interval is one day, this is only relevant if you have thousands of changes. If SS fails to change a remote password, an alert states there are secrets out of sync.

You can pair secrets with SS checkout, which is Thycotic's one-time password functionality (not the same as [TOTP](../authentication/two-factor-authentication/totp/index.md)). This allows you to rotate the password on a particular expiration schedule and limit the password to a single user for a set time period, after which it is changed. This is for situations where you need the password to change after every use, such as vendors who need temporary access to a server or system. For additional security on sensitive systems, approval workflow or session recording can be paired with checkout to add layers of authentication to gain access to the secret and track how that secret is used.

Regardless of the timing of password change, you may want to rotate dependent resources (dependencies) right after you rotate the password on a secret. For example, a Windows domain account could be a service account that starts many windows services. In the event that you rotate that password, you would need to also rotate the password for this account on the services which start using that account. If you do not, starting those services will fail the next time they are restarted, which could cause other components to fail too. You can create dependencies on a secret for scheduled tasks, application pools, or services (with or without using PowerShell to undertake tasks at rotation time).

We have a large number of out-of-the-box RPC changers, which are expandable by writing your own SSH, SQL or PowerShell scripts to do RPC, which can get information from the secret. See [Configuring Secret Dependencies for RPC](./configuring-secret-dependencies-for-rpc/index.md) and the [Password Changer List](./password-changer-list/index.md).

> **Note:** You can configure [event pipelines](../events-and-alerts/event-pipelines/index.md) and [notifications](../events-and-alerts/event-subscription-page/index.md) to track whether an RPC has failed. Heartbeats allow you to check whether a password is incorrect and the machine is online.