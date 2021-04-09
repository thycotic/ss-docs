[title]: # (Configuring WinRM for PowerShell)
[tags]: # (API,Scripting,WinRM)
[priority]: # (1000)

# Configuring WinRM for PowerShell

## Overview

Secret Server relies on [Windows Remote Management](http://msdn.microsoft.com/en-us/library/windows/desktop/aa384426(v=vs.85).aspx) (WinRM) components to run PowerShell scripts. This requires configuration on the SS Web server and any distributed engines. By default, SS uses `http://localhost:5985/wsman` as the WinRM endpoint. The endpoint URI can be seen under **Admin \> Configuration** or **Admin \> Distributed Engine \> Manage Sites \> Local** if using distributed engines. At the moment, we only support running PowerShell scripts on localhost. If you are new to PowerShell Remoting please review [PowerShell Remoting Security Considerations](https://docs.microsoft.com/en-us/powershell/scripting/setup/winrmsecurity?view=powershell-6).

## Configuration (Domain Joined)

Run PowerShell as an Administrator and execute:

`Enable-PSRemoting`

See [Enable-PSRemoting](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-5.1) for more information.

This command performs the following steps:

- Runs the [Set-WSManQuickConfig](http://go.microsoft.com/fwlink/?LinkID=141463) cmdlet, which performs the following tasks:

   - Starts the WinRM service
   - Sets the startup type on the WinRM service to Automatic
   - Creates a listener to accept requests on any IP address
   - Enables a firewall exception for WS-Management communications
   - Registers the Microsoft.PowerShell and Microsoft.PowerShell.Workflow session configurations, if it they are not already registered
   - Registers the Microsoft.PowerShell32 session configuration on 64-bit computers, if it is not already registered
   - Enables all session configurations
   - Changes the security descriptor of all session configurations to allow remote access.
- Restarts the WinRM service to make the preceding changes effective.


## Verifying Listeners

Confirm the listener:

```powershell
Get-WSManInstance -ResourceURI winrm/config/listener -SelectorSet @{Address="*";Transport="http"}
```

The output should reflect the newly configured listener with **Enabled : true**

## Additional Considerations

- By default two BUILTIN groups are allowed to use PowerShell Remoting as of v4.0: Administrators and Remote Management Users.
  `(Get-PSSessionConfiguration -Name Microsoft.PowerShell).Permission`
- Sessions are launched by SS under the user's context, which means all the same security controls and policies apply within the session.
- See [Investigating PowerShell Attacks](https://www.fireeye.com/content/dam/fireeye-www/global/en/solutions/pdfs/wp-lazanciyan-investigating-powershell-attacks.pdf) by FireEye for additional security considerations.
- Your environment may already be configured for WinRM. If your server is already configured for WinRM but it is not using the default configuration, you can change the URI to use a custom port or URLPrefix.

## Configuration (Standalone)

By default WinRM uses Kerberos for authentication. Since Kerberos is not available on machines that are not joined to the domain, HTTPS is required for secured transport of the password. Only use this method if you are going to run scripts from a SS Web server or distributed engine that is **not** joined to the domain.

> **Note:** WinRM HTTPS requires a local computer "Server Authentication" certificate with a CN matching the hostname that is not expired, revoked, or self-signed. A certificate would need to be installed on each endpoint SS or the engine manages.

Create the new listener:

```powershell
New-WSManInstance - ResourceURI winrm/config/Listener -SelectorSet @{Transport=HTTPS} -ValueSet @{Hostname="HOST";CertificateThumbprint="XXXXXXXXXX"}
```
