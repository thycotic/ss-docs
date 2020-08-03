[title]: # (Limiting Launcher Domains)
[tags]: # (Launcher, protocol handler, domain)
[priority]: # (1000)

# Limiting Launcher Domains

>**Note:** This capability applies to Secret Server 10.9 or later. That is Secret Server Protocol Handler 6.0.0.28 or later.

You can limit the domains that a launcher connects to. If this is not set, then nothing changes—the launcher can connect to any domain. If it is set, however, Secret Server refuses to connect to any domains that are not explicitly allowed.

This setting is done via a Windows Group Policy Object (GPO) administrative template XML file (.admx). The file specifies the registry key that are changed when the GPO is edited. Download that file here: [LimitLauncherDomainPolicyDefinitions.zip](https://updates.thycotic.net/secretserver/documents/LimitLauncherDomainPolicyDefinitions.zip).

For details on using these files, see [How to create and manage the Central Store for Group Policy Administrative Templates in Windows](https://support.microsoft.com/en-us/help/3087759/how-to-create-and-manage-the-central-store-for-group-policy-administra) on the Microsoft site. The settings are present in both user and machine configurations in the group policy editor. If both are specified, then only the machine configuration is used (the user configuration is completely ignored). This is because the user configuration is stored in part of the registry that does not require administrator access to edit, so the machine configuration should be used in most cases.

The Group Policy valid values are just domain names, like `example.com`, or IP addresses, like `192.168.1.2`. No port should be specified, and no scheme. A value like `https://example.com` is not valid, because it has `https://` in the front. Ports are also invalid, so `example.com:885` will not match. The correct value would simply be `example.com`. Wildcards are not supported, but subdomains matter, so a value of `example.com` will not match `something.example.com`.