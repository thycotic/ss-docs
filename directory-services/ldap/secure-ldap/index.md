[title]: # (Secure LDAP)
[tags]: # (LDAP, LDAPS,directory service)
[priority]: # (1000)
[redirect]: # "SecretServerLDAPS"

# Secure LDAP

## Overview

By default, Secret Server (SS) uses normal LDAP on port 389 to communicate with Active Directory. Although passwords are still transmitted using Kerberos or NTLM, user and group names are transmitted in clear text. In contrast, secure LDAP (LDAPS) requires that both port 389 and 636 are open.

If you want all information to be encrypted, then you can enable Secure LDAP (LDAPS) in SS via the Advanced link on the Edit Domain page.

When LDAPS is used, SS transmits and receives Active Directory data through port 636 (with port 389 open). A certificate on the domain controller is used to negotiate encryption, and no information is transmitted in clear text.

> **Note:** If you want to use Integrated Windows Authentication and Secure LDAP, that is only supported in Windows Server 2008 R2 or greater.

## Troubleshooting LDAPS Connection Issues

Common problems with LDAPS and SS:

- When you turn on LDAPS you will get a "domain name is invalid" error.
- Users are suddenly unable to log on SS.

Both issues are caused by LDAPS to SS communication issues, usually one of the following:

- The certificate is expired (this is the client certificate, not the SSL on the SS website).
- LDAPS is not enabled in your environment.
- A port is blocked that is denying successful communication between the server and AD.

To troubleshoot, use the [free LDP tool](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771022(v=ws.10)) to test LDAPS connections from the SS Windows server to your AD server. If you are unable to establish a connection on port 636 (with 389 open too), then we recommend consulting with your AD or security team. 

> **Note:** Sometimes the SS event viewer has information regarding invalid certificates.

 