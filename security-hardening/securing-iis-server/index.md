[title]: # (Securing IIS Server)
[tags]: # (Best Practice, Security Hardening, iis server)
[priority]: # (1000)

# Securing IIS Server

This is a list of items that IIS admin can implement to secure the IIS Web server for additional Secret Server hardening.

## Accounts

- Remove unused accounts from the server.
- Disable the Windows Guest account.
- Rename the Administrator account.
- Ensure the Administrator account has a strong password.
- Ensure the IUSR_MACHINE account is disabled if it is not used by the application.
- If your applications require anonymous access, create a custom least-privileged anonymous account. Ensure the anonymous account does not have write access to Web content directories and cannot execute command-line tools.
- Ensure the ASP.NET process account is configured for least privilege. This only applies if you are not using the default ASPNET account, which is a least-privileged account.
- Ensure strong account and password policies are enforced for the server.
- Restrict remote logons—the "Access this computer from the network" user-right is removed from the Everyone group.
- Disable null sessions (anonymous logons).
- Ensure no more than two accounts are in the Administrators group.

## Auditing and Logging

- Audit failed logon attempts.
- Relocate and secure IIS log files.
- Configure log files with an appropriate size, depending on the application security requirement.
- Regularly archive and analyze log files.
- Audit access to the `Metabase.bin` file.
- Configure IIS to us the W3C extended log file format for auditing.

## Code Access Security

- Enable code access security on the server.
- Remove all permissions from the local intranet zone.
- Remove all permissions from the Internet zone.

## Files and Directories

- Ensure files and directories are contained on NTFS volumes.
- Ensure Web site content is located on a non-system NTFS volume.
- Ensure log files are located on a non-system NTFS volume and not on the same volume where the Web site content resides.
- Ensure the Everyone group is restricted (no access to `\Windows\system32` or Web directories).
- Ensure the website root directory has deny write ACE for anonymous Internet accounts.
- Ensure content directories have deny write ACE for anonymous Internet accounts.
- Remove the Remote IIS administration application.
- Remove the Resource Kit tools, utilities, and SDKs.

## IIS Metabase

- Use NTFS permissions to restrict access to the metabase  (`%systemroot%\system32\inetsrv\metabase.bin`).
- Ensure IIS banner information is restricted (IP address in content location is disabled).

## ISAPI Filters

Ensure unnecessary or unused ISAPI filters are removed from the server.

## Machine.config

- Ensure protected resources are mapped to HttpForbiddenHandler.
- Remove unused HttpModules.
- Ensure tracing is disabled: `<trace enable="false"/>`.
- Ensure debug compiles are turned off: `<compilation debug="false" explicit="true" defaultLanguage="vb">`

## Patches and Updates

- Run Microsoft Baseline Security Analyzer on a regular interval to check for latest operating system and components updates, including
  Windows, IIS server, and the .NET Framework. 
- Test updates on development servers prior to deployment on production servers.
- Check the Microsoft Security Notification Service at [docs.microsoft.com](http://www.microsoft.com/technet/security/bulletin/notify.asp) on a regular interval for up-to-date Microsoft technical security notifications.

## Ports

- Ensure Internet-facing interfaces are restricted to port 80 (and 443 if SSL is used).
- Ensure Intranet traffic is encrypted (for example, with SSL) or restricted.

## Protocols

- Disable WebDAV if not used by the application or secure it if it is required.
- Harden the TCP/IP stack.
- Ensure NetBIOS and SMB are disabled if not used (closes ports 137, 138, 139, and 445).

## Registry

- Restrict remote registry access.
- Secure SAM (`HKLM\System\CurrentControlSet\Control\LSA\NoLMHash`).

## Script Mappings

- Ensure extensions not used by the application are mapped to `404.dll`, including .idq, .htw, .ida, .shtml, .shtm, .stm, idc, .htr, and .printer.
- Ensure unnecessary ASP.NET file type extensions are mapped to HttpForbiddenHandler in `Machine.config`.

## Server Certificates

- Ensure certificate date ranges are valid.
- Ensure certificates are used for their intended purpose (for example, the server certificate is not used for e-mail).
- Ensure the certificate's public key is valid, all the way to a trusted root authority.
- Ensure the certificate is SHA 256 or better.

## Services

- Disable unnecessary Windows services.
- Ensure services are running with least-privileged accounts.
- You can disable FTP, SMTP, and NNTP services if they are not required.
- Ensure the Telnet service is disabled.
- Ensure the ASP.NET state service is disabled and is not used by your applications.

## Shares

- Ensure all unnecessary shares are removed (including default administration shares).
- Restrict access to required shares (the Everyone group does not have access).
- Remove administrative shares (C$ and Admin$) if they are not required.

## Sites and Virtual Directories

- Ensure Web sites are located on a non-system partition.
- Ensure the "Parent paths" setting is disabled.
- Remove potentially dangerous virtual directories, including IISSamples, IISAdmin, IISHelp, and Scripts.
- Remove or secure MSADC virtual directory (RDS).
- Ensure include directories do not have the "Read Web" permission.
- Restrict Write and Execute Web permissions for the anonymous account on virtual directories that allow anonymous access.
- Ensure there is script source access only on folders that support content authoring.
- Ensure there is write access only on folders that support content authoring and these folder are configured for authentication (and SSL encryption, if required).
- Remove FrontPage Server Extensions (FPSE) if not used. If they are used, ensure they are updated and access to FPSE is restricted.

## Other Considerations

- Ensure server remote administration is secured and configured for encryption, low session time-outs, and account lockouts.Ensure HTTP requests are filtered.
- Use a dedicated machine as a Web server.
- Physically protect the Web server machine in a secure machine room.
- Configure a separate anonymous user account for each application, if you host multiple Web applications.
- Do not install the IIS server on a domain controller.
- Do not connect an IIS Server to the Internet until it is fully hardened.
- Do not allow anyone except the administrator to locally log on to the machine.