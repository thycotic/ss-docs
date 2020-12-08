[title]: # (Protocol Handler Administrative Settings)
[tags]: # (launcher, protocol handler, settings)
[priority]: # (1000)

# Protocol Handler Administrative Settings

The Secret Server (SS) protocol handler has several administrative settings that you can configure through Microsoft's Group Policy Objects (GPOs) or through SS itself.

> **Important:** We **strongly** recommend using GPOs instead of Secret Server.

## Available Settings

### Allowed Secret Server Domains

This setting controls which domains or IP addresses the protocol handler installation may connect to. If the setting is unset or disabled, then the protocol handler is allowed to connect to any domain. If one or more comma-separated values are provided, then the protocol handler is blocked from accessing any domains or IP addresses not included in the list.

The protocol handler performs a string match against the URL it receives. It does not attempt to resolve domain names to IP addresses. Values in this list should match only the domain or IP address portion of the actual URL used to access SS. For example, if users access your installation via `https://example.com/SecretServer`, then `example.com` should be added to the list. If `example.com` resolves to the IP address `192.168.1.5`, then adding that IP address *will not* allow access to the domain if users actually access it via `example.com`.

Wildcards are not supported, but subdomains do matter. The above entry for `example.com` would not allow `www.example.com`; the two may need to be added separately depending on your configuration. Ports and protocols are also unnecessary—only the domain portion is checked. For example, do not include an entry in the list like `https://example.com` or `example.com:885` as both are invalid. Simply using `example.com` covers these scenarios.

### Disable Auto-Update

This setting ensures protocol handler will never auto-update itself, even if told to by the SS installation that it connects to. When the setting is enabled, protocol handler installations need to be updated either manually or as part of your organization's regular program-update process.

## Configuration Methods

### Choosing the Configuration Method

> **Important:** If your domain is configured to use GPOs, we **strongly recommend** using that to configure the protocol handler.

Why use GPOs instead of SS?

- GPOs are more resilient, as Windows reapplies settings if they are deleted from the registry. Settings applied through SS have no such resilience.
- GPOs are centrally managed along with other settings for machines in your domain.
- For security reasons, SS's configuration can only be applied during the initial installation of SS. If you change these settings within SS, users must reinstall the program before they will be applied. GPOs not have this restriction.

### Configuring GPOs

You can download GPO definitions for your version of SS from the Launcher Tools page of the Admin section of SS. For details about using these policy definition files, see [How to create and manage the Central Store for Group Policy Administrative Templates in Windows](https://docs.microsoft.com/en-us/troubleshoot/windows-client/group-policy/create-and-manage-central-store). Both machine and user configurations are available as needed, but machine configurations will always override user configurations—if a machine configuration is configured, the user configuration is completely ignored.

Settings are available in the group policy editor under **(Computer/User) Configuration \> Administrative Templates \> Secret Server Protocol Handler**.

### Configuring Settings During Secret Server Installation

If you do determine that using SS's settings are necessary, you can configure them via the Configuration page in the Admin section of SS, in the "Protocol Handler Settings (Install-Time)" section. Enabling these settings causes downloads to generate a zip rather than an MSI file. The zip file contains a batch file that configures the install-time settings. These settings only update when the protocol handler is manually reinstalled or updated—changing them later on through SS has no effect on protocol handlers that are already installed on user machines.