[title]: # (Configure RDP Launcher domain for Windows Account template)
[tags]: # (configure,RDP,launcher,domain,windows,account,template)
[priority]: # (1000)

# Configure RDP Launcher Domain for Windows Account Template

## Problem

When a Remote Desktop Launcher fails to log into a machine, it is sometimes because the machine is configured to have a default domain name (other than the local machine name). To determine whether the machine is configured to have such a default domain name, check one of the following:

**Registry Setting:** HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultDomainName

**Group Policy** (Windows 2008 and higher): "Assign a default domain for logon" under Computer Configuration\Administrative Templates\System\Logon

## Solution

Add a key to `web-appSettings.config` that will cause the RDP launcher to use the machine name as the domain name when authenticating using a local Windows account.

 1. Run a text editor as an administrator on the server running Secret Server.

 1. Open the `web-appSettings.config` file located in the Secret Server application directory (typically `C:\inetpub\wwwroot\secretserver`).

 1. Add the following key within `<AppSettings>`

     `<add key="RDPUseComputerForDomain" value="true" />`

 1. Perform an IIS reset

 1. Test the launcher.