[title]: # (Secure Syslog/CEF Logging)
[tags]: # (Events, Alerts, syslog, CEF)
[priority]: # (1000)

# Secure Syslog/CEF Logging

## Overview

Secret Server can send a copy of important log messages to an external syslog server for added security using the following protocols:

> **Note:** Common Event Format (CEF) is an industry-standard format on top of syslog messages that ensures event  interoperability between different platforms.

**Table:** Syslog Transportation Protocols


| **Protocol** | **Encrypted** | **Notes** |
| ------------ | ------------- | ------------------------------------------------------------ |
| UDP | No | Least reliable. User Datagram Protocol (UDP) traffic is fire-and-forget with no assurance messages are delivered and no error checking. |
| TCP | No | More reliable. Transmission Control Protocol (TCP) ensures messages arrive in order, missing messages are resent, and has built in error checking. |
| Secure TCP | Yes | Establishes a secure connection — Transport Layer Security (TLS) 1.1 or 1.2 only. Syslog Server’s certificate is validated by Windows to ensure it is trusted and not revoked. Can be used with or without client certificates (configured in **Configuration \> Security tab \> TLS Auditing \> Advanced**). |

[]()

Due to the sensitive nature of SS logs, we strongly recommend using Secure TCP.

## Configuring a Secure TCP Syslog/CEF External Audit Server in Secret Server

### Compatible Audit Servers

- syslog-ng

- Any Audit server that accepts TLS encrypted messages using the BSD syslog protocol

### Configuring an External Audit Server

1. Navigate to **Admin** > **Configuration**.

1. Click the **General** tab.

1. Click the **Edit** button at the bottom of the page.

1. Go to the **Application Settings** section.

1. Click to select the **Enable Syslog/CEF Logging** check box. A syslog/CEF section appears:

   ![image-20200602120849610](images/image-20200602120849610.png)

   > **Note**: syslog/CEF may require an additional license key. To install licenses, navigate to **Admin** > **Licenses** > **Install New License**. Once installed, the license requires activation. Contact your Thycotic Sales Representative with any questions.

1. Type IP address or name for the IIS server hosting the syslog/CEF server in  the **Syslog/CEF Server** text box.

1. Type the port number where the logging information will be passed (6514 is the default port for secure TCP syslog) in the **Syslog/CEF Port** text box.

   > **Note**: SS requires outbound access to this server and port so communication can pass freely.

1. Click the **Syslog/CEF Protocol** dropdown list and select **Secure TCP**. Secure TCP means either TLS v1.2 or v1.1  because other versions of SSL, such as SSL v3 and TLS v1.0, have known weaknesses.

1. Click to select **Syslog/CEF Time Zone** list box to **UTC Time** or **Server Time**, depending on your preference.

1. Click the **Save** button.

## Caching Syslog Audits

If the connection between the external syslog server and SS breaks once secure syslog logging is enabled in SS, syslog failure notification messages is cached in the SS database and re-sent at regular intervals until the connection between the syslog server and SS is reestablished.

## Configure Auditing for TLS Connections

To track problems with TLS connections (including whenever the connection fails), enable the TLS certificate chain policy and error auditing in S:

1. Navigate to **Admin** > **Configuration**.

1. Click the **Security** tab.

1. Click the **Edit** button at the bottom of the page.

1. Scroll to the **TLS Auditing** section.

1. Ensure the **Apply TLS Certificate Chain Policy and Error Auditing** check box is enabled. If not, you cannot use client certificates.

> **Note:** If secure TCP is used for the syslog/CEF protocol and there are one or more client certificate thumbprints entered, SS checks the local computer’s Web hosting and personal certificate store and uses the first one it finds.

## Adding Client Certificate Thumbprints

1. Navigate to **Admin** > **Configuration**.

1. Click the **Security** tab.

1. Click the **Edit** button at the bottom of the page.

1. Scroll to the **TLS Auditing** section.

1. Click the **Advances (not required)** link. A client certificate thumbprint section appears:

   ![image-20200602122748037](images/image-20200602122748037.png)

1. Copy and paste a list of SHA1 SSL certificate thumbprints into the **Client Certificate Thumbprints(s)** text box. Separate each thumbprint (40 characters each) with a semicolon. Up to ten are allowed.

> **Note:** SS's IIS application pool must be granted permission to use the client certificates, using the Windows HTTP Services Certificate Configuration Tool (WinHttpCertCfg.exe). See [Compatibility Notes for Client Certificates](#compatibility-notes-for-client-certificates).

## Determining the Status of a Remote Audit Server

 To view the logs for any TLS-Connection related errors, perform the following:

1. Open the **Microsoft SQL Server Management Studio**.

1. Navigate to your SecretServer database at **\<DB Machine Name\>** \> **Databases** \> **SecretServer**).

1. Set up a new query.

1. Type and enter `select from tbSecurityAuditLog` to view the events from the TLS audit.

> **Note:** For more detailed troubleshooting reporting, reference the logs on the SS Web server at `C:\inetpub\wwwroot\SecretServer\log`). View the `SS.log`, `SS-BSSR.log` (background scheduler), and `SS-BSWR.log` (background worker) for any errors.

## Compatibility Notes for Client Certificates

### IIS Application Pool Certificate Permissions

SS's IIS application pool must be granted permission to use the client certificates, using the
 Windows HTTP Services Certificate Configuration Tool (WinHttpCertCfg.exe).

For example:
`winhttpcertcfg.exe -g -c LOCAL_MACHINE\MY -s "Certificate Subject" -a "HOSTNAME\IIS APPPOOL\SecretServer"`

You can download the tool at:


 [Windows HTTP Services Certificate Configuration Tool (WinHttpCertCfg.exe)](https://www.microsoft.com/en-us/download/details.aspx?id=19801)

You can view the documentation at:

[WinHttpCertCfg.exe, a Certificate Configuration Tool](https://msdn.microsoft.com/en-us/library/windows/desktop/aa384088(v=vs.85).aspx)

Otherwise, if SS is configured to use a client certificate, and IIS does not have permission, errors like this may appear in the logs:

**TLS Error Detected (Authentication Error connecting to IP:PORT) - The credentials supplied to the package were not recognized.**

If you are using a client certificate, and a syslog-ng logging server, the following message may occasionally appear in the main syslog-NG log file:

**SSL error while reading stream; tls_error='SSL routines:ssl_get_prev_session:session id context uninitialized'**

 On the SS side, this appears:

**TLS Error Detected (Authentication Error connecting to IP:PORT) - Authentication failed because the remote party has closed the transport stream.**

This is caused by Windows trying to cache secure connections when client certificates are used, but because syslog-ng has not configured the OpenSSL “session id context”, OpenSSL displays this error when it tries to resume a previous session.

SS automatically reconnects and resends any missed messages, so the errors should not have an impact. However, you can disable Window’s secure connection caching by adding the [ClientCacheTime](https://docs.microsoft.com/en-us/windows-server/security/tls/tls-registry-settings) setting set to 0 in the Registry and then rebooting. This did not cause any significant performance impact in internal testing.

> **Note**: If changing back to a previous syslog IP address and port, you will receive a closed connection TLS error on the first attempted syslog connection after making the change. A subsequent call will succeed as the first failure will clear the cached connection on Windows. This is due to the issue with syslog-ng.

> **Note**: If syslog-ng configures their OpenSSL session id context, this error message correction is no longer needed.

### AlienVault

It is common for people to incorrectly use the client certificate thumbprints feature when setting up secure AlienVault for syslog. This can cause SS to try to connect to LDAPS with the AlienVault certificate, which can break LDAPS. Users should not use the SS client certificates thumbprint for specifying one certificate for syslog and another for LDAP. The certificate list is intended for each SS or DE to have its own, unique certificate.

## Outputting Syslog Events to a File

If you prefer to write Syslog events to a file instead, you can enable CEF file logging with an AppSetting:

1. Create a folder and file to save the SysLog on the server that is running Secret Server.

1. Set the permissions on the folder to allow the account running the application pool of SS to have modify permission.

1. In the Web application UI, make sure CEF logging is enabled in Admin \> Configuration (the values for port and server need to be entered even though these will not be used when setup for file output).

1. Add this key to the `web-appSettings.config` file, replacing the file path with that folder you created:

   `<add key="UseCefLogFile" value="True" />`
   `<add key="CefLogFilePath" value="C:\logs\SecretServerSysLog.log" />`

1. Perform an IISReset or application pool recycle.

1. Test that events are saved to the file.

> **Note:** Logging to the file will override the CEF settings on the Configuration page and you are not able to log to both the file and the logging server as the same time.

## Syslog Events

Secret Server’s detailed Syslog currently contains 44 different events tracking more than 20 unique data fields.

### Secret Server’s Reported Events

This table is a complete list of events in Secret Server’s Syslog. Both the Event Name and Event ID are contained in the log, as well as the data fields that apply to the event.

 **Table 1:** Syslog Events

| **Event Name**                                    | **Event ID** |
| ------------------------------------------------- | ------------ |
| CONFIGURATION  - EDIT                             | 15           |
| ENCRYPTION  - HSM DISABLE                         | 10067        |
| ENCRYPTION  - HSM ENABLE                          | 10066        |
| ENCRYPTION  - ROTATE SECRET KEYS                  | 10069        |
| ENCRYPTION  - ROTATE SECRET KEYS CANCEL REQUESTED | 10070        |
| ENCRYPTION  - ROTATE SECRET KEYS FAILURE          | 10072        |
| ENCRYPTION  - ROTATE SECRET KEYS SUCCESS          | 10071        |
| ENGINE  - ACTIVATE                                | 10083        |
| ENGINE  - CREATE                                  | 10082        |
| ENGINE  - DEACTIVATE                              | 10084        |
| ENGINE  - DELETE                                  | 10085        |
| EXPORTSECRETS  - EXPORTED                         | 10016        |
| FOLDER  - CREATE                                  | 7            |
| FOLDER  - DELETE                                  | 8            |
| FOLDER  - EDITPERMISSIONS                         | 14           |
| FOLDER  - SECRETPOLICYCHANGE                      | 10053        |
| GROUP -  OWNERS_MODIFIED                          | 10050        |
| IMPORTSECRETS  - IMPORTED                         | 10017        |
| LICENSES  - EXPIRES30DAYS                         | 10024        |
| POWERSHELLSCRIPT  - CREATE                        | 10027        |
| POWERSHELLSCRIPT  - DEACTIVATE                    | 10028        |
| POWERSHELLSCRIPT  - EDIT                          | 10029        |
| POWERSHELLSCRIPT  - REACTIVATE                    | 10030        |
| POWERSHELLSCRIPT  - VIEW                          | 10031        |
| ROLE -  ASSIGNUSERORGROUP                         | 10           |
| ROLE -  CREATE                                    | 9            |
| ROLE -  UNASSIGNUSERORGROUP                       | 11           |
| ROLEPERMISSION  - ADDEDTOROLE                     | 12           |
| ROLEPERMISSION  - REMOVEDFROMROLE                 | 13           |
| SCRIPTSQL  - CREATE                               | 10061        |
| SCRIPTSQL  - EDIT                                 | 10063        |
| SCRIPTSQL  - REACTIVATE                           | 10064        |
| SCRIPTSQL  - VIEW                                 | 10065        |
| SCRIPTSSH  - CREATE                               | 10056        |
| SCRIPTSSH  - DEACTIVATE                           | 10057        |
| SCRIPTSSH  - EDIT                                 | 10058        |
| SCRIPTSSH  - REACTIVATE                           | 10059        |
| SCRIPTSSH  - VIEW                                 | 10060        |
| SECRET  - ACCESS_APPROVED                         | 10044        |
| SECRET  - ACCESS_DENIED                           | 10045        |
| SECRET  - CHECKIN                                 | 10025        |
| SECRET  - CHECKOUT                                | 10026        |
| SECRET  - COPY                                    | 10020        |
| SECRET  - CREATE                                  | 10001        |
| SECRET  - CUSTOM_PASSWORD_REQUIREMENT_ADDED       | 10046        |
| SECRET  - CUSTOM_PASSWORD_REQUIREMENT_REMOVED     | 10047        |
| SECRET  - CUSTOMAUDIT                             | 10038        |
| SECRET  - DELETE                                  | 10002        |
| SECRET  - DEPENDENCY_ADDED                        | 10049        |
| SECRET  - DEPENDENCY_DELETED                      | 10048        |
| SECRET  - DEPENDENCYFAILURE                       | 10008        |
| SECRET  - EDIT                                    | 10005        |
| SECRET  - EDIT_VIEW                               | 10041        |
| SECRET  - EXPIREDTODAY                            | 10009        |
| SECRET  - EXPIRES15DAYS                           | 10012        |
| SECRET  - EXPIRES1DAY                             | 10010        |
| SECRET  - EXPIRES3DAYS                            | 10013        |
| SECRET  - EXPIRES7DAYS                            | 10011        |
| SECRET  - HEARTBEATFAILURE                        | 10007        |
| SECRET  - HEARTBEATSUCCESS                        | 10032        |
| SECRET  - HOOKCREATE                              | 10035        |
| SECRET  - HOOKDELETE                              | 10037        |
| SECRET  - HOOKEDIT                                | 10036        |
| SECRET  - HOOKFAILURE                             | 10033        |
| SECRET  - HOOKSUCCESS                             | 10034        |
| SECRET  - LAUNCH                                  | 10006        |
| SECRET  - PASSWORD_COPIED_TO_CLIPBOARD            | 10040        |
| SECRET  - PASSWORD_DISPLAYED                      | 10039        |
| SECRET  - SECRETPASSWORDCHANGE                    | 10055        |
| SECRET  - SECRETPOLICYCHANGE                      | 10054        |
| SECRET  - SESSION RECORDING VIEW                  | 10019        |
| SECRET  - UNDELETE                                | 10003        |
| SECRET  - VIEW                                    | 10004        |
| SECRETPOLICY  - CREATE                            | 10051        |
| SECRETPOLICY  - EDIT                              | 10052        |
| SECRETTEMPLATE  - CREATE                          | 10021        |
| SECRETTEMPLATE  - EDIT                            | 10022        |
| SECRETTEMPLATE  - FIELD ENCRYPTED                 | 10042        |
| SECRETTEMPLATE  - FIELD EXPOSED                   | 10043        |
| SECRETTEMPLATE  - TEMPLATE COPIED FROM            | 10023        |
| SITE -  ADDENGINE                                 | 10077        |
| SITE -  ASSIGNEDOMAIN                             | 10091        |
| SITE -  CREATE                                    | 10073        |
| SITE -  DISABLE                                   | 10076        |
| SITE -  EDIT                                      | 10074,       |
| SITE -  ENABLE                                    | 10075        |
| SITE -  ENGINEDOWNLOAD                            | 10081        |
| SITE -  ENGINEOFFLINE                             | 10080        |
| SITE -  ENGINEONLINE                              | 10079        |
| SITE -  REMOVEDOMAIN                              | 10092        |
| SITE -  REMOVEENGINE                              | 10078        |
| SITECONNECTOR  - CREATE                           | 10086        |
| SITECONNECTOR  - CREDENTIALVIEW                   | 10090        |
| SITECONNECTOR  - DISABLE                          | 10089        |
| SITECONNECTOR  - EDIT                             | 10087        |
| SITECONNECTOR  - ENABLE                           | 10088        |
| System  Log                                       | 500          |
| UNLIMITEDADMIN  - DISABLE                         | 10015        |
| UNLIMITEDADMIN  - ENABLE                          | 10014        |
| USER -  ADDEDTOGROUP                              | 5            |
| USER -  CREATE                                    | 1            |
| USER -  DISABLE                                   | 2            |
| USER -  ENABLE                                    | 3            |
| USER –  LOCKOUT                                   | 4            |
| USER -  LOGIN                                     | 16           |
| USER -  LOGINFAILURE                              | 18           |
| USER -  LOGOUT                                    | 17           |
| USER -  PASSWORDCHANGE                            | 19           |
| USER -  REMOVEDFROMGROUP                          | 6            |
| USERAUDIT  - EXPIRENOW                            | 10018        |

### Secret Server Data Fields

This table  is a complete list of data fields in Secret Server’s syslog. Only data fields relevant to the event ID are included in the log. Some log entries may differ in terms of their field content. See examples below.

**Table 2:** Syslog Data Fields

| **Data Field** | **Event Definition**                   |
| -------------- | -------------------------------------- |
| cs1            | Name of role modified                  |
| cs1label       | Role                                   |
| cs2            | Name of user or group added to role    |
| cs2label       | Group  or user                         |
| cs3            | Name of folder containing secret       |
| cs3label       | Folder                                 |
| cs4            | Display name of user performing action |
| cs4label       | suser  display name                    |
| duid           | User ID being viewed or changed        |
| duser          | Username  being viewed or updated      |
| fileId         | ID of  item action was taken on        |
| fileType       | Type of item action was taken on       |
| fname          | Name of  item action was taken on      |
| Message        | Description of audit action            |
| msg            | Description of audit action            |
| Name           | Human readable name of event           |
| Priority       | Priority of event                      |
| Product        | Name of  product                       |
| rt             | Time of  event                         |
| src            | IP Address of client machine           |
| suid           | User ID of user performing action      |
| suser          | Username  of user performing action    |
| Vendor         | Name of company                        |
| Version        | Current  version of Secret Server      |

### Examples

#### Example Event One

In this event, the local administrator account in Secret Server has edited the secret for a Brother printer:

`Jan 08 17:15:04 THY221 CEF:0|Thycotic Software|Secret Server|8.4.000000|10005|SECRET - EDIT|2|msg=[SecretServer] Event: [Secret] Action: [Edit] By User: Local Administrator Item Name: Brother HL-5370DW Container Name: Printers suid=2 suser=Local Administrator src=192.168.0.10 rt=Sep 06 2012 17:15:02 fname=Brother HL-5370DW fileType=Secret fileId=2 cs3Label=Folder cs3=Printers`

#### Example Event Two

In this event, the local administrator account in Secret Server has enabled unlimited administrator mode:

`Jan 08 15:43:10 THY221 CEF:0|Thycotic Software|Secret Server|8.4.000000|10014|UNLIMITEDADMIN - ENABLE|4|msg=[SecretServer] Event: [Unlimited Administrator] Action: [Enable] By User: Local Administrator suid=2 suser=Local Administrator src=192.168.0.10 rt=Sep 05 2012 15:43:05`



