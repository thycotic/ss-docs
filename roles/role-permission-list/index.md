[title]: # (Secret Server Role Permission List)
[tags]: # (Roles,Permissions)
[priority]: #

# Secret Server Role Permissions List

## Overview  

Secret Server uses role-based access control (RBAC) to regulate permissions. The roles are assigned to users or groups. A complete list of the permissions available to roles appears below:

## Complete List

**Access Offline Secrets on Mobile**

Allows a user to cache their Secrets in the Secret Server mobile application for offline use.

**Add Secret**

Allows a user to create new Secrets. The Add permission no longer include the role permission View Secret.

**Add Secret Custom Audit**

Allows a user to make a custom audit entry when accessing a Secret using the web services API.

**Administer Active Directory**

Allows a user to view domains, edit existing domains, delete domains, and add  new domains. Also allows a user to force synchronization or set the  synchronization interval.

**Administer Backups**

Allows a  user to view and configure automated backups for Secret Server. Users  with this role permission can change the backup path, disable backups,  and set the backup schedule.

**Administer Configuration**

Allows a user to view and edit general configuration options. For example, a  user with this role permission can turn on "Force HTTPS/SSL" and disable "Allow Remember Me".

**Administer Configuration Proxying**

Allows a user to view and edit SSH Proxy settings.

**Administer Configuration SAML**

Allows a user to view and edit SAML integration settings on the Login tab of Configuration settings.

**Administer Configuration Security**""""

Formerly "Administer Security Configuration," allows a user to view and edit  security configuration options in Secret Server. Currently, these  include enabling FIPS compliance mode and protecting the encryption key.

**Administer Configuration Session Recording**

Allows a user to view and edit session recording settings on the Session Recording tab of Configuration settings.

**Administer Configuration Two Factor**

Allows a user to change the configuration settings of the two factor  authentication that are available for users logging into Secret Server.

**Administer Configuration Unlimited Admin**

Formerly "Administer Unlimited Admin Configuration," allows a user to turn on  Unlimited Admin Mode. When this mode is enabled, users with the  "Unlimited Administrator" role permission can view and edit all Secrets  in the system, regardless of permissions. Note that you can assign  "Administer Unlimited Admin Configuration" to one user and "Unlimited  Administrator" to another user. This would require one user to turn on  the mode and another user to view and edit secrets.

**Administer ConnectWise Integration**

Allows a user to view and edit configuration options for synchronizing with  ConnectWise. This can be accessed through the "Folder Synchronization"  link on the Administration page. Note that you need at least view access on the sync folder in order to set up or edit the ConnectWise integration.

**Administer Create Application Users**

Formerly "Create Application Account", allows a user to create application user  accounts to be used exclusively for accessing Secret Server via the API.

**Administer Create Users**

Allows a user to create new local users in Secret Server, but not edit them once created.

**Administer Custom Password Requirements**

Allows a user to view and edit custom password requirements that can be  configured under the Security tab for individual Secrets.

**Administer Discovery**

Allows a user to view and import computers and accounts that are found by Discovery.

**Administer Distributed Engine Configuration**

Allows a user to update the Distributed Engine configuration.

**Administer DoubleLock Keys**

Allows a user to view, edit, create, and disable DoubleLock keys. A DoubleLock key acts as a separate encryption key to protect your most sensitive  secrets. This option allows users to access and use the "DoubleLocks"  link on the Administration page.

**Administer Dual Control**

Allows a user to view, edit, create, and disable Dual Control settings for reports and recorded sessions.

**Administer Event Subscriptions**

Allows a user to view, edit and create event subscriptions.

**Administer Export**

Allows a user to view the export log. Also allows users to export Secrets to which they have access to a clear text, CSV file.

**Administer Folders**

Allows a user to view, edit, create, move, and delete folders. Users still  need the relevant view, edit, and owner permissions on the folders to  perform these tasks.

**Administer Groups**

Allows a user  to view, edit, create, and disable groups. Also allows users to assign  users to groups and remove users from groups.

**Administer HSM**

Allows a user to change configuration or disable the use of a Hardware Security Module (HSM).

**Administer IP Addresses**

Allows a user to create, edit, and delete IP Address Ranges. These ranges are  used to restrict certain users to specific IP Addresses.

**Administer Key Management**

Allows a user to enable, change, or disable the Key Management (Secret Server Cloud only). 

**Administer Languages**

Allows a user to change the default language of Secret Server.

**Administer Licenses**

Allows a user to view, edit, install, and delete licenses.

**Administer Nodes**

Allows a user to view and edit server nodes and clustering settings.

**Administer Password Requirements**

Allows a user to view and edit character sets and password requirements.

**Administer Remote Password Changing**

Allows a user to turn Heartbeat and Remote Password Changing on and off  globally. Also allows users to create new password changers and install  password changing agents on remote machines.

**Administer Reports**

Allows a user to view, edit, delete, and create reports. Also allows users to customize report categories.

**Administer Role Assignment**

Allows a user to view which users and groups are assigned to which roles. Also allows users to assign users and groups to different roles.

**Administer Role Permissions**

Allows a user to view, edit, create and delete roles. Also allows users to assign different permissions to each role.

**Administer Scripts**

Allows a user to view, edit, and add PowerShell, SQL, and SSH scripts on the Scripts Administration page.

**Administer Search Indexer**

Allows a user to view and edit search indexer options. These options control  how searching in Secret Server works. For example, a user with this role permission could enable search indexing, which allows users to search  on fields within a secret.

**Administer Secret Policy**

Allows a user to create and edit Secret Policies.''

**Administer Secret Templates**

Allows a user to view, edit, disable, and create Secret Templates.

**Administer Security Analytics**''

Allows a user to view and edit the settings for Privilege Behavior Analytics.

**Administer Session Monitoring**''

Allows a user to view and terminate active launcher sessions.

**Administer Ssh Menus**

Allows a user to edit and create SSH Menus, used in whitelisting commands that can be used on a SSH session.

**Administer System Log**

Allows users to view and clear the System Log, which shows general diagnostics information for Secret Server.

**Administer Template Custom Columns**

Allows a user to enable the "Expose for Display" setting of a Secret template  field to make it available for use in Dashboard custom columns.

**Administer Teams**

Users can create, "dit, an" view all teams.

**Administer Thycotic One**

Allows a user to administer Thycotic One login settings on the Configuration window's Login tab.

**Administer Users**

Allows a user to create, disable, and edit users in the system.

**Advanced Import**

Allows a user to import Secrets from an XML file. Users with the this  permission can import groups, folders, site connectors, sites, and  secret templates, without having to create a secret. Users must have the Secret Server permissions needed for the objects listed in the XML. 

**Allow Access Challenge**

Allows a user be challenged by Privileged Behavior Analytics if their behavior deviates from their normal behavior and meets certain requirements set  by Privileged Behavior Analytics.

**Assign Secret Policy**

Allows a user to assign Secret Policies to folders and Secrets.

**Bypass SAML Login**

Allows a user to login with local account without using SAML.
''
**Copy Secret**

Allows a user to copy secrets when that user also has Own Secret role permission.

**Create Root Folders**

Allows a user to create new folders at the root level of the folder structure.

**Delete Secret**

Allows a user to mark secrets as deleted.

**Delete Secrets from Reports**

Allows a user to run the delete Secrets action from a report.

**Edit Secret**

Allows a user to edit secrets. Note that they still require the "Edit" or  "Owner" permissions on the individual secrets they are editing.

**Expire Secrets from Reports**

Allows a user to expire Secrets listed in a report.''

**Force Check In**

Allows a user to force a Secret that is checked out by another user to be checked in.

**No Teams-related Permissions**''

Users can only view other users within their team.

**Own Group**

Allows a user to be an owner of a group. This permission is in the default  Group Owner role, which is automatically assigned when that user is set  as owner of a group.

**Own Secret**

Formerly "Share  Secret", allows a user to share secrets with other users. Also allows  users to perform more advanced tasks on secrets of which they are  "Owners", such as configuring expiration schedules, configuring the web  launcher, converting secret template, and copying secrets (when a user  also have the Copy Secret role permission.)

**Own User**

Allows the user to become a user owner, used to configure specific users without the Administer Users permission.

**Personal Folders**

Allows a user to have personal fol'er when the global personal folders configuration options is enabled.

**Privilege Manager Administrator**

Allows the user to have the "Administrator" role for Privilege Manager, giving full access to the system.

**Privilege Manager Helpdesk User**

Allows the user to have the "Help Desk" role for Privilege Manager, giving full access to approve or deny escalation requests.

**Privilege Manager User**

Allows the user to have the "User" role for Privilege Manager, giving read and write permissions to most items, but not rights to modify security  permissions.

**Rotate Encryption Keys**

Allows a user to start a process that rotates the Secret encryption keys.

**Session Recording Auditor**

Grants access to the session recording of a secret to a user with at least "List Access" permission on the secret.

**Unlimited Administrator**

Allows a user to view and edit all secrets in the system, regardless of  permissions, when Unlimited Admin Mode is on. Note that another user  with the "Administer Unlimited Admin Configuration" role permission  would still need to turn this mode on.

**Unrestricted by Teams**

Users can view all users, groups, and sites, regardless of team affiliation.  Essentially, teams do not exist for the users with this permission, and  the Teams page is not available to them. The default user role has this  permission.

**User Audit Expire Secrets**

Allows a user to  view the "User Audit" report, which shows all secrets that have been  accessed by a particular user in a specified date range. Also allows the user to force expiration on all these secrets, which would make Secret  Server automatically change the password.

**View About**

Allows a user to view the "About" page from the Help menu, which links to  external resources such as Technical Support and the Thycotic blog.

**View Active Directory**

Allows a user to view, but not edit, the Active Directory settings in the system.

**View Advanced Dashboard**''

Allows a user to view advanced dashboard. Without this permission, users will only be able to view basic dashboard.

**View Advanced Secret Options**

Allows a user to view the Remote Password Changing, Security, and Dependency tabs on a Secret they have access to.

**View Backup**

Allows a user to view, but not edit, the automated backup settings.

**View Configuration**

Allows a user to view, but not edit, general configuration settings.

**View Configuration Proxying**

Allows a user to view, but not edit,  SSH Proxy settings.

**View Configuration SAML**

Allows a user to view SAML integration settings on the Login tab of Configuration settings.

**View Configuration Security**

Formerly "View Security Configuration," allows a user to view the security configuration of Secret Server.

**View Configuration Session Recording**

Allows a user to view session recording settings on the Session Recording tab of Configuration settings.

**View Configuration Two Factor**

Allows a user to view the configuration settings of the two factor  authentication that are available for users logging into Secret Server.

**View Configuration Unlimited Admin**

Formerly "View Unlimited Admin Configuration," allows a user to view the  Unlimited Admin Mode configuration. Also allows a user to view the  Unlimited Admin Mode audit log.

**View ConnectWise Integration**

Allows a user to view, but not edit, the ConnectWise integration settings.

**View Deleted Secrets**

Allows a user to view Secrets that have been deleted in the system.

**View Discovery**

Allows a user to view, but not edit, computers and accounts that are found by Discovery.

**View Distributed Engine Configuration**

Allows a user to view the Distributed Engine configuration.

**View DoubleLock Keys**

Allows a user to view which DoubleLock keys exist in the system.

**View Dual Control**

Allows a user to view configured Dual Control settings for reports and Secret sessions.

**View Event Subscriptions**

Allows a user to view event subscriptions.

**View Export**

Allows a user to view the export log of the system to see when users exported secrets. Does not allow a user to export.

**View Folders**

Allows a user to view, but not edit, folders in the system.

**View Group Roles**

Allows a user to see which groups and users are assigned to which roles. Does not allow a user to change these assignments.

**View Groups**

Allows a user to see which groups exist in the system. Also allows a user to see which users belong to each group.

**View HSM**

Allows a user to view the Hardware Security Module (HSM) configuration settings.

**View IP Addresses**

Allows a user to view IP Address Ranges that have been created to restrict access. Does not allow a user to edit these ranges.

**View Key Management**

Allows a user to view the Key Management settings (Secret Server Cloud only).

**View Launcher Password**

Allows a user to unmask the password on the view screen of secrets with a  launcher. Typically, this includes Web Passwords, Active Directory  accounts, Local Windows accounts, and Linux accounts.

**View Licenses**

Allows a user to view, but not edit, the licenses in the system.

**View Nodes**

Allows a user to view, but not edit, the Secret Server web server nodes.

**View Password Requirements**

Allows a user to view character sets and password requirements.

**View Remote Password Changing**

Allows a user to view, but not edit, Heartbeat and Remote Password Changing settings.

**View Reports**

Allows a user to view, but not edit, reports.

**View Roles**

Allows a user to view roles in the system. Also allows a user to see which groups are assigned to which roles.

**View Scripts**

Allows a user to view PowerShell, SQL, and SSH scripts on the Scripts Administration page.

**View Search Indexer**

Allows a user to view, but not edit, search indexer settings.

**View Secret**

Allows a user to only view which Secrets exist in the system.

**View Secret Audit**

Allows a user to view Secret Audit.

**View Secret Policy**

Allows a user to view, but not edit, Secret Policies.

**View Secret Templates**

Allows a user to view, but not edit, Secret Templates.

**View Security Analytics**

Allows a user to view, but not edit, settings for Privilege Behavior Analytics.

**View Security Hardening Report**

Allows a user to view the Security Hardening Report.

**View Session Monitoring**

Allows a user to view active launcher sessions.

**View Session Recording**

Allows a user to view recorded sessions within Secret Server.

**View SSH Menus**

Allows a user to view existing SSH Menus, used in whitelisting commands that can be used on a SSH session.

**View System Log**

Allows a user to only view the System Log, which shows general diagnostics information for Secret Server.

**View Teams**

Users can view all teams. This is essentially a read-only Administer Teams.

**View Thycotic One**

Allows a user to view Thycotic One settings on the Configuration window's Login tab.

**View User Audit Report**

Allows a user to view, but not edit, the User Audit Report.

**View Users**

Allows a user to view which users exist in the system.

**Web Services Impersonate**

Allows a user to send an approval request to act as another user within their  organization when accessing Secret Server programmatically.