[title]: # (Distributed Engine Hardening)
[tags]: # (Best Practice, Security Hardening, distributed engine)
[priority]: # (1000)

# Distributed Engine Hardening

## Introduction

This topic discusses best practices for hardening Secret Server distributed engine servers.

If attackers compromise one of the DE servers, they would have access to all critical DBs, applications, and network devices at the network level. DEs do not store any passwords, PII, or user data in any configuration files.

> **Note:** Due to their intrinsic nature, some PowerShell script run by DEs may expose API usernames or passwords in the PowerShell log.

## General Hardening Steps

### Restrict RDP Connections

- Limit RDP connections to all PAM Server,  except for PAM admins and some users from the hosting team.
- If there is no firewall segmentation in LAN network, you can accomplish this with the Windows OS firewall.

### Restrict Incoming Port Access to All DE Servers

- Allow only RDP port access from some internal IPs.
- Allow a SSH proxy port coming from the user's LAN.
- Block all other incoming ports.

### Remove Unnecessary User Groups

For administrator and Remote Desktop user groups:

- Remove default domain admins, administrator and some common groups.
-  Create one group that is going to have access these servers.
- Disable the built-in local administrator user.

### Rename Default Accounts

- Change the names of both the administrator and guest accounts to names that do not indicate their permissions.
- Create a new locked and unprivileged "administrator" user name as bait.

### Disable Services

Disable these services:

- Routing and remote access
- Smart card
- Smart card removal policy
- SNMP trap
- Special administration console helper
- Windows error reporting service
- WinHTTP Web proxy auto-discovery service

### Restrict Network Protocols

Keep these:

- Client for Microsoft network
- File and printer sharing for Microsoft network
- Internet protocol version 4 (TCP/IPv4)

Remove these:

- QoS packet scheduler
- Link-layer topology discovery mapper IO driver
- Link-layer topology discovery responder

### Validate Server Roles

Ensure only the minimum roles and features that are required are defined on the DE Servers. Remove all unnecessary roles and features

#### Roles

##### Application Server

- TCP port sharing
- Windows process activation service support
- Named pipe activation
- TCP activation

##### Remote Access

- Direct access and VPN (RAS)
- Routing
- Web application proxy (with dependent features)

##### Web Server (IIS)

- Web server
- Health and diagnostic
- Logging tools
- Tracing

##### Security

- Centralized SSL certificate support
- Client certificate mapping authentication
- Digest authentication
- IIS client certificate mapping authentication
- IP and domain restrictions
- URL authentication

##### Application Development

- Server side includes
- Web socket protocols
- Windows deployment services (with dependent features), including all child roles

#### Features

- Group policy management
- IIS hostable Web core
- Ink and handwriting services
- Media foundation
- RAS connection manager administration kit (CMAK)
- Remote server administration tools, including all child features.
- Windows internal database
- SMB 1.0/CIFS file sharing support

## SSL/TLS Settings

Keep your server SSL/TLS settings up to date. Among other settings, the different protocols and cipher suites can be vulnerable to different attacks on SSL/TLS.

- Disable SSL 2.0
- Disable SSL 3.0
- Disable TLS 1.0
- Disable TLS 1.1
- Enable TLS 1.2

## GPO Hardening

The following are recommended settings for Microsoft Group Policy Objects (GPO).

**User  Configuration \> Policies \> Administrative Templates \> Control Panel/Personalization**

Vulnerability:

There is no protection against a user with physical and remote desktop access to the server.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                             | Recommended Value     |
| ---------------------------------- | --------------------- |
| Enable screen saver                | Enabled               |
| Force specific  screen saver       | Enabled               |
| Password protect the  screen saver | Enabled               |
| Screen saver timeout               | Enabled  Seconds: 600 |

[]()

**Computer  Configuration \> Policies \> Windows Settings \> Security Settings  \> Local Policies /Security Options**

This setting enables advanced auditing in the operating system.

| Policy                                                       | Recommended Value |
| ------------------------------------------------------------ | ----------------- |
| Audit: Force audit  policy subcategory settings to override audit policy category settings | Enabled           |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> Logon Account**

Vulnerability:

Lack of information on unauthorized user login attempt. Lack of this type of information prevents identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                     | Recommended Value |
| -------------------------- | ----------------- |
| Credential  Validation     | Success, Fail     |
| Other Account Logon  Event | Success, Fail     |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> Account Management**

Vulnerability:

Lack of information on user management in the system (addition and removal of users). Lack of this type of information will prevent identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                           | Recommended Value |
| -------------------------------- | ----------------- |
| Application Group  Management    | Success, Fail     |
| Computer Account  Management     | Success, Fail     |
| Distribution Group  Management   | Success, Fail     |
| Other Account  Management Events | Success, Fail     |
| Security Group  Management       | Success, Fail     |
| User Account  Management         | Success, Fail     |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> Logon\Logoff**

Vulnerability:

Lack of information on unauthorized user login attempt. Lack of this type of information will prevent identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                    | Recommended Value |
| ------------------------- | ----------------- |
| Account Lockout           | Success, Fail     |
| Logoff                    | Success, Fail     |
| Logon                     | Success, Fail     |
| Network Policy  Server    | Success, Fail     |
| Other Logon\Logoff  Event | Success, Fail     |
| Special Logon             | Success, Fail     |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> Object Access**

Vulnerability:

Lack of information on access to sensitive files and folders in the system. Lack of this type of information will prevent identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

Applying Auditing for Success can overload the system. In case an overload is created, it is recommended to apply the auditing for Failure only.

| Policy                  | Recommended Value |
| ----------------------- | ----------------- |
| Application  Generated  | Success, Fail     |
| Certification  Services | Success, Fail     |
| Detailed File Share     | Fail              |
| File Share              | Success, Fail     |
| File System             | Success, Fail     |
| Kernel Object           | Success, Fail     |
| Registry                | Success, Fail     |
| Removable Storage       | Success           |
| SAM                     | Success, Fail     |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> Policy Change**

Vulnerability:

Lack of information on changes in the policy. Lack of this type of information will prevent identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                            | Recommended Value |
| --------------------------------- | ----------------- |
| Audit Policy Change               | Success, Fail     |
| Authentication Policy  Change     | Success, Fail     |
| Authorization Policy  Change      | Success, Fail     |
| Filtering Platform  Policy Change | Success, Fail     |
| MPSSVC Rule –Level  Policy Change | Success, Fail     |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> Privilege Use**

Vulnerability:

Lack of information on the use of system authorizations. Lack of this type of information will prevent identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                       | Recommended Value |
| ---------------------------- | ----------------- |
| Non Sensitive  Privilege Use | Success, Fail     |
| Sensitive Privilege  Use     | Fail              |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Advance Audit Policy Configuration \> System**

Vulnerability:

Lack of information on system start-up, shutdown and system changes. Lack of this type of information will prevent identification of intruders to the system, as well as inability to check access to the server or its resources.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                     | Recommended Value |
| -------------------------- | ----------------- |
| Other System Events        | Success, Fail     |
| Security State  Change     | Success, Fail     |
| Security System  Extension | Success, Fail     |
| System Integrity           | Success, Fail     |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Event Log**

Vulnerability:

There is a risk that many log records will not be saved due to the file's size.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                                                     | Recommended Value |
| ---------------------------------------------------------- | ----------------- |
| Maximum application  log size                              | 100032 KB         |
| Maximum security log  size                                 | 100032 KB         |
| Maximum system log  size                                   | 100032 KB         |
| Prevent local guests  group from accessing application log | Enabled           |
| Prevent local guests  group from accessing security log    | Enabled           |
| Prevent local guests  group from accessing system log      | Enabled           |
| Retention method for  application log                      | As needed         |
| Retention method for  security log                         | As needed         |
| Retention method for  system log                           | As needed         |

[]()

**Computer  Configuration \> Policies \> Windows Settings \> Security Settings  \> Registry**

Auditing should be applied according to the following parameters:

Audit - Success only: Set Value

Audit - All:

Create Subkey, Create Link, Delete, Read Permissions, Change Permissions

Audit the following registry keys:

- `HKLM\SYSTEM`
- `HKLM\SOFTWARE`

**Computer  Configuration \> Policies \> Windows Settings \> Security Settings  \> File System**

Vulnerability:

Lack of information on delete, change of authorizations, gain ownership of sensitive files, or any attempt to do so, will prevent the ability to identify unauthorized access and therefore will make it difficult to prevent such attempts.

Severity of the damage:

Medium

Operational aspects:

None

Set permissions and audit to the following folders:

- `%SystemRoot%\System32\Config`
- `%SystemRoot%\System32\Config \RegBack`

Permissions and auditing should be applied according to the following parameters:

Audit – Failure only:

Traverse Folder\ Execute File, List Folder\ Read Data, Read Attributes, Read Extended Attribute.

Audit - All:

Create Files\ Write Data, Create Folders\ Append Data, Write Attributes, Write Extended Attributes, Delete Subfolders And Files, Delete, Change Permissions, Take Ownership.

Permissions:

Administrator, System - Full

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> Local Policies/Security Options**

| Policy                                                       | Recommended Value                                            | Comment or Vulnerablity                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Accounts:  Administrator account status                      | Enabled                                                      |                                                              |
| Accounts: Guest  account status                              | Disabled                                                     |                                                              |
| Accounts: Limit  local account use of blank passwords to console logon only | Enabled                                                      |                                                              |
| Accounts: Rename  administrator account                      | It is recommended to  change both the Administrator and the guest names to a name that will not  testify about their permissions, and also to create a new locked and  unprivileged user name Administrator as bate | Comment: Apply this parameter  according to the organization security policy.  Vulnerability:  The administrators  default name is known as a high privilege user. This user is a target for  hacking attempts.  Severity of the  damage:  Medium  Operational aspects:  None |
| Audit: Audit the use  of Backup and Restore privilege.       | Enabled                                                      | Vulnerability:  The system does not  monitor backup and restore activities of files, therefore it does not allow  exposing unusual activities in this area.  Severity of the  damage:  Low  Operational aspects:  None |
| Devices: Allowed to  format and eject removable media        | Administrator                                                | Vulnerability:  Users may be able to  move data on removable disks to a different computer where they have  administrative privileges. The user could then take ownership of any file,  grant themselves full control, and view or modify any file. The fact that  most removable storage devices will eject media by pressing a mechanical  button diminishes the advantage of this policy setting.  Severity of the  damage:  Low  Operational aspects:  None |
| Devices: Prevent  users from installing printer drivers      | Enabled                                                      | Vulnerability:  A malicious user  could install inappropriate printer drivers in a deliberate attempt to damage  the computer, or a user might accidentally install malicious software that  masquerades as a printer driver.  Severity of the  damage:  Low  Operational aspects:  None |
| Domain member:  Disable machine account password changes     | Disabled                                                     | Vulnerability:  Computers that  cannot automatically change their account password are at risk from an  attacker who could determine the password for the computer's domain account.  Severity of the  damage:  Low  Operational aspects:  None |
| Domain member:  Maximum machine account password age         | 30 days                                                      | Vulnerability:  Setting this  parameter to 0 will allow an attacker to execute Brute Force attacks to find  the computer account password.  Severity of the  damage:  Low  Operational aspects:  None |
| Domain member:  Require strong (Windows 2000 or later) session key | Enabled                                                      | Vulnerability:  Session keys that  are used to establish secure channel communications between domain  controllers and member computers are much stronger in Windows 2000 than they  were in previous Windows operating systems.  Severity of the  damage:  Low  Operational aspects:  None |
| Interactive logon:  Do not display last user name            | Enabled                                                      | Vulnerability:  An attacker with  access to the console (for example, someone with physical access or someone  who is able to connect to the server through Remote Desktop Services, also  known as Terminal Services) could view the name of the last user who logged  on to the server. The attacker could then try to guess the password, use a  dictionary, or use a brute force attack to try to log on.  Severity of the  damage:  Low  Operational aspects:  None |
| Interactive logon:  Do not require CTRL+ALT+DEL              | Disabled                                                     | Vulnerability:  If users are not  required to press CTRL+ALT+DEL, they are susceptible to attacks that attempt  to intercept their passwords, If this setting is enabled, an attacker could  install a Trojan horse program that looks like the standard logon dialog box  in the Windows operating system, and capture the user's password.  Severity of the  damage:  Low  Operational aspects:  None |
| Interactive logon:  Number of previous logons to cache (in case domain controller is not  available). | 0                                                            | Vulnerability:  Users who access the  server console will have their logon credentials cached on that server. An  attacker who is able to access the file system of the server could locate  this cached information and use a brute force attack to attempt to determine  user passwords.  Severity of the  damage:  Medium  Operational  aspects: The local  Administrator password should be known in case of DC unavailability. |
| Interactive logon:  Require Domain Controller authentication to unlock workstation | Enabled                                                      | Vulnerability:  By default, the  computer caches in memory the credentials of any users who are authenticated  locally. The computer uses these cached credentials to authenticate anyone  who attempts to unlock the console. When cached credentials are used, any  changes that have recently been made to the account—such as user rights  assignments, account lockout, or the account being disabled—are not considered  or applied after the account is authenticated. User privileges are not  updated, and (more important) disabled accounts are still able to unlock the  console of the computer.  Severity of the  damage:  Medium  Operational aspects:  The local  Administrator password should be known in case of DC unavailability |
| Microsoft network  client: Send unencrypted password to third-party SMB servers. | Disabled                                                     | Vulnerability:  The server can transmit  passwords in plaintext across the network to other computers that offer SMB  services. These other computers might not use any of the SMB security  mechanisms that are included with Windows Server 2003 and above.  Severity of the  damage:  Medium  Operational aspects:  None |
| Microsoft network  server: Amount of idle time required before suspending session | 15 minutes                                                   | Vulnerability:  Each SMB session  consumes server resources, and numerous null sessions will slow the server or  possibly cause it to fail. An attacker could repeatedly establish SMB  sessions until the server's SMB services become slow or unresponsive.  Severity of the  damage:  Medium  Operational aspects:  None |
| Microsoft network  server: Attempt S4U2Self to obtain claim information | Disabled                                                     | Vulnerability:  Enabling this policy  setting allows you take advantage of features in Windows Server 2012 and  Windows 8 for specific scenarios to use claims-enabled tokens to access files  or folders that have claim-based access control policy applied on Windows  operating systems prior to Windows Server 2012 and Windows 8.  Severity of the  damage:  Medium  Operational aspects:  None |
| Microsoft network  server: Server SPN target name validation level | Off                                                          | Vulnerability:  This policy setting  controls the level of validation that a server with shared folders or  printers performs on the service principal name (SPN) that is provided by the  client computer when the client computer establishes a session by using the  SMB protocol. The level of validation can help prevent a class of attacks  against SMB servers (referred to as SMB relay attacks). This setting will  affect both SMB1 and SMB2.  Severity of the  damage:  Low  Operational aspects:  None |
| Network access: Do  not allow anonymous enumeration of SAM accounts | Enabled                                                      | Vulnerability:  An unauthorized user  could anonymously list account names and shared resources and use the  information to attempt to guess passwords or perform social engineering  attacks.  Severity of the  damage:  Medium  Operational aspects:  None |
| Network access: Do  not allow anonymous enumeration of SAM accounts and shares | Enabled                                                      | Vulnerability:  An unauthorized user  could anonymously list account names and shared resources and use the  information to attempt to guess passwords or perform social-engineering  attacks.  Severity of the damage:  Medium  Operational aspects:  None |
| Network access: Do  not allow storage of passwords and credentials for network authentication. | Enabled                                                      | Vulnerability:  Passwords that are  cached can be accessed by the user when logged on to the computer. Although  this information may sound obvious, a problem can arise if the user  unknowingly runs malicious software that reads the passwords and forwards  them to another, unauthorized user.  Severity of the  damage:  Medium  Operational aspects:  This parameter could  affect windows schedule task services |
| Network access: Let  Everyone permissions apply to anonymous users | Disabled                                                     | Vulnerability:  The system will  allow all users, including users who have not identified themselves in the  Domain, perform operations of reading information related to user accounts  and the names of the shares.  Severity of the  damage:  Medium  Operational aspects:  None |
| Network access:  Named Pipes that can be accessed anonymously | List has been  deleted                                       | Vulnerability:  Ability to remotely  access data on the system by an unauthorized user.  Severity of the  damage:  Low  Operational aspects:  None |
| Network access:  Remotely accessible registry paths          | List has been  deleted                                       | Vulnerability:  An attacker could  use information in the registry to facilitate unauthorized activities. To  reduce the risk of such an attack, suitable ACLs are assigned throughout the  registry to help protect it from access by unauthorized users.  Severity of the  damage:  Low  Operational aspects:  None |
| Network access:  Remotely accessible registry paths and subpaths | List has been deleted                                        | Vulnerability:  An attacker could  use information in the registry to facilitate unauthorized activities. To  reduce the risk of such an attack, suitable ACLs are assigned throughout the  registry to help protect it from access by unauthorized users.  Severity of the  damage:  Low  Operational aspects:  None |
| Network access:  Restrict anonymous access to Named Pipes and Shares. | Enabled                                                      | Vulnerability:  Null sessions are a  weakness that can be exploited through shared folders on computers  environment.  Severity of the  damage:  Low  Operational aspects:  None |
| Network access:  Shares that can be accessed anonymously     | List has been  deleted                                       | Vulnerability:  Any shared folders  that are listed can be accessed by any network user, which could lead to the  exposure or corruption of sensitive data.  Severity of the  damage:  Medium  Operational aspects:  None |
| Network access:  Sharing and security model for local accounts | Classic - Local  users authenticate as themselves            | Vulnerability:  With the Guest only  model, any user who can authenticate to the server over the network does so  with guest privileges, which means that they will not have write access to  shared resources on that server. Although this restriction does increase  security, it makes it more difficult for authorized users to access shared  resources on the server because ACLs on those resources must include access  control entries (ACEs) for the Guest account. With the Classic model, local  accounts should be password protected. Otherwise, if Guest access is enabled,  anyone can use those user accounts to access shared system resources.  Severity of the  damage:  Low  Operational aspects:  None |
| Network security: Do  not store LAN Manager hash value on next password change | Enabled                                                      | Vulnerability:  The SAM file can be targeted  by attackers who seek access to user name and password hashes. Such attacks  use special tools to discover passwords, which can then be used to  impersonate users and gain access to resources on your network.  Severity of the  damage:  Medium  Operational aspects:  None |
| Network security:  Force logoff when logon hours expire      | Enabled                                                      | Vulnerability:  Users can remain  connected to the computer outside of their allotted logon hours.  Severity of the  damage:  Low  Operational aspects:  None |
| Network security: LAN  Manager authentication level          | Send NTLMv2  Responses Only/Refuse LM & NTLM                 | Vulnerability:  The system allows  identification of users in the old LM and NTLM protocols. The old  identification protocols are vulnerable to attacks.  Severity of the damage:  Medium  Operational aspects:  These parameters  could effect on legacy system if the system don’t support NTLMv2 |
| Network security:  Minimum session security for NTLM SSP based (including secure RPC) clients | Require NTLMv2  session security  Require 128-bit  encryption | Vulnerability:  Network traffic that  uses the NTLM Security Support Provider (NTLM SSP) might be exposed such that  an attacker who has gained access to the network can create man-in-the-middle  attacks.  Severity of the  damage:  Medium  Operational aspects:  None |
| Network security:  Minimum session security for NTLM SSP based (including secure RPC) servers | Require NTLMv2  session security  Require 128-bit  encryption | Vulnerability:  Network traffic that  uses the NTLM Security Support Provider (NTLM SSP) might be exposed such that  an attacker who has gained access to the network can create man-in-the-middle  attacks.  Severity of the  damage:  Medium  Operational aspects:  None |
| Recovery console:  Allow automatic administrative logon      | Disabled                                                     | Vulnerability:  The Recovery Console  can be very useful when you need to troubleshoot and repair computers that do  not start. However, it is dangerous to allow automatic logon to the console.  Anyone could walk up to the server, disconnect the power to shut it down,  restart it, select Recover Console from the Restart menu, and then assume  full control of the server.  Severity of the  damage:  Medium  Operational aspects:  None |
| Recovery console:  Allow floppy copy and access to all drives and all folders | Disabled                                                     | Vulnerability:  An attacker who can  cause the system to restart into the Recovery Console could steal sensitive  data and leave no audit or access trail.  Severity of the  damage:  Low  Operational aspects:  None |
| Shutdown: Allow  system to be shut down without having to log on | Disabled                                                     | Vulnerability:  Users who can access  the console locally could shut down the computer.  Severity of the  damage:  Low  Operational aspects:  None |
| Shutdown: Clear  virtual memory pagefile                     | Enabled                                                      | Vulnerability:  Important information  that is kept in real memory may be written periodically to the paging file to  help the operating system handle multitasking functions. An attacker who has  physical access to a server that has been shut down could view the contents  of the paging file. The attacker could move the system volume into a  different computer and then analyze the contents of the paging file. Although  this process is time consuming, it could expose data that is cached from  random access memory (RAM) to the paging file.  Severity of the  damage:  Low  Operational aspects:  It takes longer to  shut down and restart the computer, especially on computers with large paging  files. |
| System Settings:  Optional subsystems                        | No one                                                       | Vulnerability:  The POSIX subsystem  introduces a security risk that relates to processes that can potentially persist  across logons. If a user starts a process and then logs out, there is a  potential that the next user who logs on to the computer could access the  previous user's process. This would allow the second user to take actions on  the process by using the privileges of the first user.  Severity of the  damage:  Low  Operational aspects:  None |
| System settings: Use  Certificate Rules on Windows Executables for Software Restriction Policies | Enable                                                       | Vulnerability:  Without the use of  software restriction policies, users and computers might be exposed to the  running of unauthorized software, such as viruses and Trojans horses.  Severity of the  damage:  Medium  Operational aspects:  None |
| User Account Control:  Use Admin Approval Mode for the built-in Administrator account | Enable                                                       | Vulnerability:  Malicious software  running under elevated credentials without the user or administrator being  aware of its activity.  Severity of the  damage:  Medium  Operational aspects:  None |
| User Account  Control: Allow UIAccess applications to prompt for elevation without using  the secure desktop | Disable                                                      | Vulnerability:  Without the use of  software restriction policies, users and computers might be exposed to the  running of unauthorized software, such as viruses and Trojans horses.  Severity of the  damage:  Medium  Operational aspects:  None |
| User Account  Control: Behavior of the elevation prompt for administrators in Admin  Approval Mode | Prompt for consent  for non-Windows binaries                 | Vulnerability:  Malicious programs  running under elevated credentials without the user or administrator being  aware of their activity. This setting raises awareness to the user that a  program requires the use of elevated privilege operations and requires that  the user be able to supply administrative credentials in order for the  program to run.  Severity of the  damage:  Medium  Operational aspects:  None |
| User Account  Control: Behavior of the elevation prompt for standard users | Prompt for credentials  on the secure desktop                | Vulnerability:  Malicious programs  running under elevated credentials without the user or administrator being  aware of their activity. This setting raises awareness to the user that a  program requires the use of elevated privilege operations and requires that  the user be able to supply administrative credentials in order for the  program to run.  Severity of the  damage:  Low  Operational aspects:  None |
| User Account  Control: Run all administrator in admin approval mode | Enable                                                       | Vulnerability:  This is the setting  that turns on or off UAC. If this setting is disabled, UAC will not be used  and any security benefits and risk mitigations that are dependent on UAC will  not be present on the system.  Severity of the  damage:  Medium  Operational aspects:  None |
| User Account  Control: Switch to the secure desktop when prompting for elevation | Enable                                                       | Vulnerability:  Elevation prompt  dialog boxes can be spoofed, causing users to disclose their passwords to  malicious software.  Severity of the  damage:  Medium  Operational aspects:  None |
| User Account  Control: Virtualize file and registry write failures to per-user locations | Enable                                                       | Severity of the  damage:  Low  Operational aspects:  None    |
| Microsoft network  server: Server SPN target name validation level | Disabled                                                     | Vulnerability:  Without the use of  software restriction policies, users and computers might be exposed to the  running of unauthorized software, such as viruses and Trojans horses.  Severity of the  damage:  Low  Operational aspects:  None |

[]()

**Computer Configuration \> Policies \> Windows Settings \> Security Settings \> System Services**

Vulnerability:

An unlimited number of open connections can cause denial of Service attack on the Remote Desktop services, also known as Terminal Services.

If a disconnected session kept alive that can lead a session hijacking by an attacker.

Clipboard mapping enables the client to transfer a virus or a malicious application to the server as well as copy configuration or sensitive data from the server back to the client machine. There is a risk of infecting to the whole network or damaging the system.

Severity of the damage:

Medium

Operational aspects:

None

| Policy                                                       | Recommended Value                                |
| ------------------------------------------------------------ | ------------------------------------------------ |
| Automatic  reconnection                                      | Disabled                                         |
| Configure keep-alive  connection interval                    | Enabled  Keep-Alive  interval:1                  |
| Deny logoff of an  administrator logged in to the console session | Enabled                                          |
| Do not allow  Clipboard redirection                          | Disabled                                         |
| Do not allow  supported Plug and Play device redirection     | Enabled                                          |
| Do not allow COM  port redirection                           | Enabled                                          |
| Do not allow LPT  port redirection                           | Enabled                                          |
| Do not allow drive  redirection                              | Enabled                                          |
| Do not allow local  administrators to customize permissions  | Enabled                                          |
| Do not delete temp  folders upon exit                        | Disabled                                         |
| Do not use temporary  folders per session                    | Disabled                                         |
| End session when  time limits are reached                    | Enabled                                          |
| Remove  "Disconnect" option from Shut Down dialog            | Enabled                                          |
| Remove Windows  Security item from Start menu                | Enabled                                          |
| Require secure RPC  communication                            | Enabled                                          |
| Set client  connection encryption level                      | Enabled  Encryption Level:  High Level           |
| Set rules for remote  control of Remote Desktop Services user sessions | Enabled  View Session without  user's permission |
| Set time limit for  active but idle Remote Desktop Services sessions | Enabled                                          |
| Set time limit for  disconnected sessions                    | Enabled  15 minutes                              |

[]()

**Computer Configuration  \> Policies \> Windows Settings \> Security Settings \> User  Rights Assignment**

| Policy                                                       | Recommended Value                                            | Comment                                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Access Credential  Manager as a trusted caller               |                                                              | Vulnerability:  If an account is  given this right, the user of the account can create an application that  calls into Credential Manager and is then provided the credentials for  another user.  Severity of the  damage:  Medium  Operational aspects:  None |
| Access this computer  from the network                       | BUILTIN\Administrators                                       | Vulnerability:  This right allows the users to use the SMB communications protocol in front of the server. This  protocol allows access to the operating resources, such as: sharing and  remote system administration using the operating system's built-in tools.  Severity of the  damage:  Medium  Operational aspects:  None |
| Act as part of the  operating system                         |                                                              | Vulnerability:  Users with the Act  as part of the operating system user right can take complete control of the  computer and erase evidence of their activities.  Severity of the  damage:  Medium  Operational aspects:  None |
| Adjust memory quotas  for a process                          | NT AUTHORITY\NETWORK  SERVICE, NT AUTHORITY\LOCAL SERVICE, BUILTIN\Administrators | Vulnerability:  A user with the  Adjust memory quotas for a process user right can reduce the amount of memory  that is available to any process, which could cause business-critical network  applications to become slow or to fail. This privilege could be used to start  a denial-of-service (DoS) attack.  Severity of the  damage:  Medium  Operational aspects:  None |
| Allow log on locally                                         | BUILTIN\Administrators                                       | Vulnerability:  Any account with the  Allow log on locally user right can log on at the console of the computer. If  you do not restrict this user right to legitimate users who must log on to  the console of the computer, unauthorized users could download and run  malicious software to elevate their privileges.  Severity of the  damage:  Medium  Operational aspects:  None |
| Allow log on through  Remote Desktop Services                | BUILTIN\Administrators                                       | Vulnerability:  Any account with the  Allow log on through Remote Desktop Services user right can log on to the  remote console of the computer. If you do not restrict this user right to  legitimate users who must log on to the console of the computer, unauthorized  users could download and run malicious software to elevate their privileges.  Severity of the  damage:  Medium  Operational aspects:  None |
| Back up files and  directories                               | BUILTIN\Administrators                                       | Vulnerability:  Users who can back  up data from a computer could take the backup media to a non-domain computer  on which they have administrative privileges and restore the data. They could  take ownership of the files and view any unencrypted data that is contained  within the backup set.  Severity of the  damage:  Medium  Operational aspects:  None |
| Bypass traverse  checking                                    | NT AUTHORITY\  NETWORK SERVICE, NT AUTHORITY\LOCAL SERVICE, NT AUTHORITY\Authenticated  Users, BUILTIN\Administrators | Vulnerability:  This right allows  the user to access files and partitions although he is not authorized to view  files and change them.  Severity of the  damage:  Medium  Operational aspects:  None |
| Change the system  time                                      | BUILTIN\Administrators,  NT AUTHORITY\LOCAL SERVICE          | Vulnerability:  Users who can change  the time on a computer could cause several problems. For example, time stamps  on event log entries could be made inaccurate, an attacker who changes a  computer's time may cause that computer to be unable to obtain or grant  Kerberos protocol tickets.  Severity of the  damage:  Medium  Operational aspects:  None |
| Change the time zone                                         | BUILTIN\Administrator                                        | Vulnerability:  Changing the time  zone represents little vulnerability because the system time is not affected.  This setting merely enables users to display their preferred time zone while  being synchronized with domain controllers in different time zones.  Severity of the  damage:  Low  Operational aspects:  None |
| Create a token  object                                       |                                                              | Vulnerability:  A user account that  is given this user right has complete control over the system, and it can  lead to the system being compromised.  Severity of the  damage:  High operational aspects:  None |
| Create global  objects                                       | NT  AUTHORITY\SERVICE, NT AUTHORITY\NETWORK SERVICE, NT AUTHORITY\LOCAL SERVICE,  BUILTIN\Administrators | Vulnerability:  Users who can create  global objects could affect processes that run under other users' sessions.  This capability could lead to a variety of problems, such as application  failure or data corruption.  Severity of the  damage:  Medium  Operational aspects:  None |
| Create permanent  shared objects                             |                                                              | Vulnerability:  Users who have the  Create permanent shared objects user right could create new shared objects  and expose sensitive data to the network.  Severity of the  damage:  Medium  Operational aspects:  None |
| Create symbolic  links                                       | Administrators                                               | Vulnerability:  Users who have the  Create symbolic links user right could inadvertently or maliciously expose  your system to symbolic link attacks. Symbolic link attacks can be used to  change the permissions on a file, to corrupt data, to destroy data, or as a  DoS attack.  Severity of the  damage:  Low  Operational aspects:  None |
| Debug programs                                               | BUILTIN\Administrator                                        | Vulnerability:  The Debug programs  user right can be exploited to capture sensitive computer information from  system memory or to access and modify kernel or application structures. Some  attack tools exploit this user right to extract hashed passwords and other  private security information or to insert rootkit code.  Severity of the  damage:  Low  Operational aspects:  None |
| Deny access to this  computer from the network               | BUILTIN\Guests                                               | Vulnerability:  Users who can log on  to the computer over the network can enumerate lists of account names, group  names, and shared resources. Users with permission to access shared folders  and files can connect over the network and possibly view or modify data.  Severity of the  damage:  Medium  Operational aspects:  None |
| Deny log on as a  batch job                                  | BUILTIN\Guests                                               | Vulnerability:  Accounts that have  the Deny log on as a batch job user right could be used to schedule jobs that  could consume excessive computer resources and cause a DoS condition.  Severity of the  damage:  Medium  Operational aspects:  None |
| Deny log on as a  service                                    | BUILTIN\Guests                                               | Vulnerability:  Accounts that can  log on as a service could be used to configure and start new unauthorized  services, such as a keylogger or other malicious software.  Severity of the  damage:  Medium  Operational aspects:  None |
| Deny log on locally                                          | BUILTIN\Guests                                               | Vulnerability:  Any account with the  ability to log on locally could be used to log on at the console of the computer.  If this user right is not restricted to legitimate users who must log on to  the console of the computer, unauthorized users might download and run  malicious software that elevates their privileges.  Severity of the  damage:  Medium  Operational aspects:  None |
| Deny log on through  Remote Desktop Services                 | BUILTIN\Guests                                               | Vulnerability:  Any account with the  right to log on through Remote Desktop Services could be used to log on to  the remote console of the computer. If this user right is not restricted to  legitimate users who need to log on to the console of the computer, malicious  users might download and run software that elevates their privileges.  Severity of the  damage:  Medium  Operational aspects:  None |
| Enable computer and  user accounts to be trusted for delegation | BUILTIN\Administrators                                       | Vulnerability:  Misuse of  the Enable computer and user accounts to be trusted for  delegation user right could allow unauthorized users to impersonate  other users on the network. An attacker could exploit this privilege to gain  access to network resources and make it difficult to determine what has  happened after a security incident.  Severity of the  damage:  Medium  Operational aspects:  None |
| Force shutdown from  a remote system                         | BUILTIN\Administrators                                       | Vulnerability:  Any user who can  shut down a computer could cause a DoS condition to occur. Therefore, this  user right should be tightly restricted.  Severity of the  damage:  Low  Operational aspects:  None |
| Generate security  audits                                    | NT AUTHORITY\NETWORK  SERVICE, NT AUTHORITY\LOCAL SERVICE    | Vulnerability:  Accounts that can  write to the Security log could be used by an attacker to fill that log with  meaningless events. If the computer is configured to overwrite events as  needed, attackers could use this method to remove evidence of their unauthorized  activities. If the computer is configured to shut down when it is unable to  write to the Security log and it is not configured to automatically back up  the log files, this method could be used to create a DoS condition.  Severity of the  damage:  Low  Operational aspects:  None |
| Increase scheduling  priority                                | BUILTIN\Administrators                                       | Vulnerability:  Increasing the  working set size for a process decreases the amount of physical memory that  is available to the rest of the system.  Severity of the  damage:  Low  Operational aspects:  None |
| Load and unload  device drivers                              | BUILTIN\Administrators                                       | Vulnerability:  Device drivers run  as highly privileged code. A user who has the Load and unload device drivers  user right could unintentionally install malicious software that masquerades  as a device driver.  Severity of the  damage:  Low  Operational aspects:  None |
| Lock pages in memory                                         | BUILTIN\Administrators                                       | Vulnerability:  Users with the Lock  pages in memory user right could assign physical memory to several processes,  which could leave little or no RAM for other processes and result in a DoS  condition.  Severity of the  damage:  Low  Operational aspects:  None |
| Manage auditing and  security log                            | BUILTIN\Administrators                                       | Vulnerability:  Anyone with the  Manage auditing and security log user right can clear the Security log to  erase important evidence of unauthorized activity.  Severity of the  damage:  Medium  Operational aspects:  None |
| Modify an object  label                                      |                                                              | Vulnerability:  Anyone with the  Modify an object label user right can change the integrity level of a file or  process so that it becomes elevated or decreased to a point where it can be  deleted by lower-level processes. Either of these states effectively  circumvents the protection offered by Windows Integrity Controls and makes  your system vulnerable to attacks by malicious software.  Severity of the  damage:  Low  Operational aspects:  None |
| Modify firmware  environment values                          | BUILTIN\Administrators                                       | Vulnerability:  Anyone who is  assigned the Modify firmware environment values user right could configure  the settings of a hardware component to cause it to fail, which could lead to  data corruption or a DoS condition.  Severity of the  damage:  Medium  Operational aspects:  None |
| Perform volume  maintenance tasks                            | BUILTIN\Administrators                                       | Vulnerability:  A user who is assigned  the Perform volume maintenance tasks user right could delete a volume, which  could result in the loss of data or a DoS condition. Also, disk maintenance  tasks can be used to modify data on the disk such as user rights assignments  that might lead to escalation of privileges.  Severity of the  damage:  Low  Operational aspects:  None |
| Profile single  process                                      | BUILTIN\Administrators                                       | Vulnerability:  The Profile single  process user right presents a moderate vulnerability. Attackers with this  user right could monitor a computer's performance to help identify critical  processes that they might want to attack directly. Attackers may be able to  determine what processes run on the computer so that they could identify  countermeasures that they may need to avoid, such as antivirus software or an  intrusion-detection system. They could also identify other users who are  logged on to a computer.  Severity of the damage:  Low  Operational aspects:  None |
| Restore files and  directories                               | BUILTIN\Administrators                                       | Vulnerability:  An attacker with the  Restore files and directories user right could restore sensitive data to a  computer and overwrite data that is more recent, which could lead to loss of  important data, data corruption, or a denial-of-service condition. Attackers  could overwrite executable files that are used by legitimate administrators  or system services with versions that include malicious software to grant  themselves elevated privileges, compromise data, or install programs that  provide continued access to the computer.  Severity of the  damage:  Medium  Operational aspects:  None |
| Shut down the system                                         | BUILTIN\Administrators                                       | Vulnerability:  The ability to shut  down the server should be limited to a very small number of trusted  administrators.  Severity of the  damage:  Low  Operational aspects:  None |
| Take ownership of  files or other objects                    | BUILTIN\Administrators                                       | Vulnerability:  Any users with the  Take ownership of files or other objects user right can take control of any  object, regardless of the permissions on that object, and then make any  changes that they want to make that object. Such changes could result in  exposure of data, corruption of data, or a DoS condition.  Severity of the  damage:  High  Operational aspects:  None |