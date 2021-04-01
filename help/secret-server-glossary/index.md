[title]: # (Secret Server Glossary)
[tags]: # (Glossary)
[priority]: # (1000)

# Secret Server Glossary

**Table:** Terms and Definitions

| Term                          | Definition                                                   |
| ----------------------------- | ------------------------------------------------------------ |
| 2FA                           | _Two-Factor Authentication_                                  |
| AD                            | _Active Directory_                                           |
| Administrator                 | *Administrator* is a default role that comes preconfigured with SS. Roles control access to features within SS. This role can be customized to have different permissions. In this guide, administrator (lowercase) is used when referring to users who manage the system and have control over global security and configuration settings. Note that administrators in SS do not automatically have access to all data stored in the system—access to data is still controlled by explicit permissions on that data. |
| AES                           | _Advanced Encryption Standard_                               |
| All Secrets                   | *All Secrets* is a master table of the secrets stored on Secret Server. It is a one-stop, searchable location for examining the status and properties of secrets. It is a supplement to, not a replacement for, the secret folder tree. It lists and you can sort by secret template, heartbeat status, sync status, machine, access date, username, and much more. You can customize which characteristics are displayed. |
| API                           | _Application Programming Interface_                          |
| ASCII                         | _American Standard Code for Information Interchange_         |
| ASP                           | _Advanced Server Pages_                                      |
| AWS                           | _Amazon Web Services_                                        |
| CAC                           | _Common Access Card_                                         |
| CEF                           | _Common Event Format_                                        |
| CHG                           | _Change_                                                     |
| CIDR                          | _Classless Inter-Domain Routing_                             |
| CRM                           | _Customer Relationship Management_                           |
| CSV                           | _Comma-Separated Values_                                     |
| DBA                           | _Database Administrator_                                     |
| DE                            | _Distributed Engine_ (Secret Server)                         |
| DES                           | _Data Encryption Standard_                                   |
| Directory Services            | *Directory services* are components of network operating systems that map the names of network resources to their network addresses. Their shared information infrastructure locates, manages, and organizes network resources, which can include volumes, folders, files, users, groups, devices, and much more. Active Directory is Secret Server's native directory service. |
| Discovery                     | *Discovery* is the process where Secret Server scans an environment to find accounts and associated resources called dependencies. Once accounts are found, you can use them to create associated new secrets in Secret Server. Users with the "administer discovery" role permission can either manually import accounts or can create an automated process, called a discovery rule, to do so. Using discovery does not stop users from manually creating their own secrets. |
| Distributed Engine            | For smaller enterprises, Secret Server performs all functions on the Web server it is installed on. Secret Server is also scalable for large enterprises and scenarios demanding higher performance. We use remote *distributed engines* to accomplish this. You route high-demand processing and traffic operations through one or more of these to enhance Secret Server's capacity. For example, distributed engines can synchronize and authenticate for Active Directory. They can also perform remote password changing, heartbeat, discovery and more, all controlled by a single Secret Server installation. |
| DPAPI                         | _Data Protection Application Programming Interface_          |
| DSS                           | _Data Security Standard_                                     |
| EC2                           | _Elastic Compute Cloud_                                      |
| ESX                           | _Elastic Sky X_                                              |
| FIPS                          | _Federal Information Processing Standard_                    |
| FQDN                          | _Fully Qualified Domain Name_                                |
| GDPR                          | *General Data Protection Regulation*                         |
| Group                         | You can manage users with user *groups*. Users belonging to a group receive roles (and by extension permissions) attributed to that group. This simplifies the management of the permissions and roles assigned to users. Additionally, groups can be synchronized with Active Directory to further simplify management. A user can belong to multiple groups. |
| HSM                           | _Hardware Security Module_                                   |
| HSTS                          | _HTTP Strict Transport Security_                             |
| IAM                           | *Identity and Access Management*                             |
| IIS                           | _Internet Information Services_                              |
| IP                            | _Internet Protocol_                                          |
| ITSM                          | _Information Technology Service Management_                  |
| KB                            | _Kilobyte_ or _Knowledge Base_                               |
| KBA                           | *Knowledge Base Article*                                     |
| LDAP                          | _Lightweight Directory Access Protocol_                      |
| NAT                           | _Network Address Translation_                                |
| NATO                          | _North Atlantic Treaty Organization_                         |
| NIST                          | _National Institute of Standards and Technology_             |
| NSA                           | _National Security Agency_                                   |
| NTLM                          | _NT LAN Manager_                                             |
| OATH                          | _Open Authentication_                                        |
| OS                            | _Operating System_                                           |
| OTP                           | _One-Time Password_                                          |
| OU                            | _Organizational Unit_                                        |
| PBA                           | *Privileged Behavior Analytics*                              |
| PCI                           | _Payment Card Industry_                                      |
| PDF                           | _Portable Document Format_                                   |
| PII                           | *Personally Identifiable Information*                        |
| PIV                           | _Personal Identity Verification_                             |
| PuTTY                         | _Popular SSH and Telnet Client_                              |
| QR                            | _Quick Response_ (code)                                      |
| RADIUS                        | _Remote Authentication Dial-In User Service_                 |
| RBAC                          | _Role-Based Access Control_                                  |
| RBS                           | _Role-Based-Security_                                        |
| RD                            | _Remote Desktop_                                             |
| RDP                           | _Remote Desktop Protocol_                                    |
| Remote Password Changing      | Secret Server can automatically change passwords on remote devices and various platforms, including the following: Windows accounts, database logins, Active Directory accounts, Unix and Unix-like accounts (including root passwords), network appliances or devices and more. |
| REST                          | _Representational State Transfer_                            |
| Role                          | Every user and group must be assigned to a *role*. Secret Server uses role-based access control to provide very granular system access. Secret Server ships with three roles: Administrator, User, and Read-Only User. Each role contains a set of permissions to match the job function of users with that role. See the [Secret Server Role Permissions List](../../roles/role-permission-list/index.md) for details. |
| Role-based Security           | SS uses role-based access control, which provides the ability to set strict, granular permissions for each user. All features in SS are available to users based on permissions, which collectively make up roles. |
| RPC                           | See _Remote Password Changing_                               |
| SAML                          | _Security Assertions Markup Language_                        |
| SEC                           | _Security and Exchange Commission_                           |
| Secret                        | A piece of information that is stored and managed within Secret Server is referred to as a secret. Secrets are derived from secret templates. Typical secrets include, but are not limited to, privileged passwords on routers, servers, applications, and devices. Files can also be stored in secrets, allowing for storage of private key files, SSL certificates, license keys, network documentation, Microsoft Word or Excel documents and more. |
| Secret Template               | Secret templates are used to create secrets and allow customization of the format and content of secrets to meet company needs and standards. Examples include: local administrator account, SQL Server account, Oracle account, credit card and Web password. Templates can contain passwords, usernames, notes, uploaded files, and drop-down list values. New secret templates can be created, and all existing templates can be modified. |
| SHA1                          | _Secure Hashing Algorithm 1_                                 |
| SIEM                          | _Security Information Event Management_                      |
| SMS                           | _Short Message Service_                                      |
| SMTP                          | _Simple Mail Transfer Protocol_                              |
| SOAP                          | _Simple Object Access Protocol_                              |
| SP                            | _Service Pack_                                               |
| SQL                           | _Structured Query Language_                                  |
| SS                            | _Secret Server_                                              |
| SSH                           | _Secure SHell_                                               |
| SSL                           | _Secure Socket Layer_                                        |
| TCP                           | _Transmission Control Protocol_                              |
| TOTP                          | _Time-Based One-Time Password_                               |
| UDP                           | _User Datagram Protocol_                                     |
| UI                            | _User Interface_                                             |
| UNC                           | _Universal Naming Convention_                                |
| Unlimited Administration Mode | An emergency, break-the-glass mode that gives administrators access to all content within the system, regardless of explicit permissions. Access to unlimited administration mode is controlled using role permissions. |
| URL                           | _Uniform Resource Locator_                                   |
| User                          | *Users* are Secret Server's representation of people—one person per user. Each user has a unique username, as well as other attributes. Users are assigned to groups, and roles are assigned to them, either directly or via groups. |
| VM                            | _Virtual Machine_                                            |
| VPN                           | _Virtual Private Network_                                    |
| WS                            | _Web Services_                                               |
| XML                           | _eXtensible Markup Language_                                 |
