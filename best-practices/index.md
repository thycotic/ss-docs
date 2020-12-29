[title]: # (Best Practices)
[tags]: # (best practices)
[priority]: # (1000)

# Best Practices

## Getting Started

This document was written after helping many customers successfully deploy Secret Server (SS) in their organizations. It covers the issues that most customers tackle as they consider which data to store, who needs access, what permissions to apply, and how to organize all their sensitive data. This document is not meant to cover everything

Think of SS as a platform for your organization to store all of its passwords and sensitive data. This means that it can be configured to work in many different ways depending on your industry, compliance requirements, and ultimate end goals. The trick is to know your objectives and then match the capabilities and best practices to your situation.

## Installation

Before installing SS, be sure to take a look at the [system requirements](../secret-server-setup/system-requirements/index.md). The process for installing SS is outlined in the [installation guides](../secret-server-setup/installation/index.md) matching the version of Windows Server you are using. If you have an active trial or have purchased SS licenses, you can find your licenses by logging into your account at [thycotic.com](http://www.thycotic.com/).

## Basic Configuration

Once SS is installed, see the  [End User Guide](../secret-server-end-user-guide/index.md) to begin setting up SS right away. This covers:

- Adding your licenses

- Basic security settings

- Configuring automatic backups

- Creating a secret

- Heartbeat

- Remote Password Changing

- Setting up access for local and AD users


## Security Hardening

Security is a process—not a product. Take a look at the [Security Hardening Guide](../security-hardening/security-hardening-guide/index.md) to ensure your implementation of SS has optimal security. The guide contains more in-depth recommendations for not only configuring the application in a secure manner, but also hardening the server or servers SS is hosted on.

## Terminology

Throughout this topic, certain terms are used to refer to specific features or concepts within SS.

#### Administrator

Access to all the features within SS can be granted to users by creating and assigning different roles. Administrator is one of the default roles that comes installed with SS. By default, this role contains all role permissions, but it can be customized as well. In this guide, when "administrator" is used in the context of a SS user, it will be referring to the users who generally have most permissions and manage the system. Administrators have control over the global security and configuration settings.

> **Note:** Administrators in SS do **not** automatically have access to all data stored in the system—access to data  is still controlled by explicit permissions on that data.
=======

#### Secret

A secret is any sensitive piece of information (typically a password) that you would like to manage within SS. Typical secrets include (but are not limited to) privileged passwords on routers, servers, applications, and devices. Files can also be stored in secrets allowing for storage of private key files, SSL certificates, license keys, network documentation info, or even a Microsoft Word or Excel document.

## Know Your Edition

As you read through this guide, some features may be referenced that are only available in certain editions of SS. To get an idea of what’s available, you can reference the [main sales page](#https://thycotic.com/products/secret-server/) page online.

## Privileged Account Management (PAM) Strategy

It is important to have a privileged account management strategy that helps you determine which types of features to leverage for your various accounts and sensitive data you will be storing. Below are some suggested guidelines for creating a strategic plan. We recommend reading all sections of the guide for a comprehensive look at ways you can secure your SS. However, these guidelines will also link to other parts of the guide so you can choose to jump to a specific section for more detail about a particular topic.

### Identify Data at Risk

Consider all the types of sensitive data your team needs to be securely stored and managed. Where are the biggest risks and pain points in your current password management strategy? Data at risk also often includes more than just passwords.

To get started, think through these key accounts and principles:

- All shared privileged accounts: these are accounts that don’t identify an individual (for example: administrator, root, enable, service accounts). All of these should have randomized passwords that are changed frequently.

- Do your users have individual privileged accounts? Maybe each user has—separate AD account for domain admin rights?

- Every password in your organization should be different.

- What passwords could an employee walk off with, should they ever quit or be fired?

- What passwords could be needed in an emergency, outside of regular business hours, or when someone is on vacation?

Typical account passwords and sensitive data being stored in SS:

- Windows local administrator accounts

- UNIX, Linux, Mac root, and local user accounts

- AD domain administrator accounts


- AD service accounts

- Database accounts (such as MS SQL, Oracle, and MySQL)

- Network equipment passwords (such as router, switches, firewalls, phones, and appliances)

- Application passwords (such as SAP and custom apps)

- Website passwords (cloud services, DNS, Amazon AWS, vendors)

- Sensitive files (such as private key files, SSL certificates, and network documentation information)

- Software license keys, serial numbers, personnel data, Wi-Fi passwords

### Who Accesses Secret Server?

After determining the data you will store in SS, the next step is to decide [who](#_Users) will use SS to access and manage that data. A common approach is to begin by focusing on one group of users and the passwords they use on a regular basis, later expanding to other teams once a good strategy has been put in place. However, you may find it more beneficial to organize SS for use by all of your users/teams at once so you can design an effective overall folder and policy structure that will work well across all teams.

### What Privilege Levels Are Necessary?

Giving a user access to an account in SS can entail different levels of privilege. Do you want a user to be able to edit the username, machine, or password of a secret, or only view the secret? Should they be able to share the secret with other users? Once you incorporate use of the Launcher into your users’ workflow for authenticating to an application, do they really need to know a password, or can you mask it? The [Workflow Security](#workflow-security) section can help you determine and implement key measures to ensure users have least privilege necessary.

### What are your Password Requirements?

It’s unlikely that all your accounts will have the same [password complexity requirements](#Password-Requirements) and [rotation schedule](#Secret-Expiration). In fact, for best security, you should have some variation. You can create sets of password requirements to control password length, characters, and complexity, then apply those to various account types using [secret templates](#Secret-Templates). Secret templates also allow you to set a default expiration period, which can translate to how often an account password will be changed automatically.

### Evaluate your Existing Setup

While transitioning to using a new tool for managing your passwords, it is important to take into account how accounts are currently used in your environment. The following questions can help evaluate this:

- Do some of your users have their own, individual AD domain admin accounts, or are there only a few shared domain accounts?

- Do users use local administrator accounts or privileged domain accounts for admin access to systems?

- Are permissions to resources (such as servers and applications) controlled using AD group policy?

### Define Your Core PAM Strategy

There are a few different strategies that typically work best in SS. Other methods of password management may work but require a more significant amount of time and effort to configure and maintain. The most commonly-used strategies are defined below.

### Individual Privileged Domain Accounts

In this scenario, IT team members have their own domain admin accounts that are tied to their identity. They use these accounts to gain elevated privileges to resources such as production servers. Permissions to the various resources they’re permitted to access are controlled by AD.

To implement this in SS, each account is stored as its own AD account secret. Only the user tied to that account is granted permissions to the secret. A security setting such as check out (one-time password) or hide launcher password is enabled so the user depends upon SS to use the account. Therefore, all access to that account will be audited. When the IT admin needs elevated privilege to a box, they check out or view the secret and then use the launcher to access the machine.

A benefit of this strategy is that there isn’t conflict with multiple users trying to use the same account for access to one machine. This strategy provides great accountability – the security team knows the exact user accessing an account and the machine being accessed. The password is not shared among multiple users, and all privileged access is audited by SS.

A pitfall of this strategy can be that there is more management of permissions required in AD. While machines could be access or deny listed to force users to use the SS launcher, thus controlling machine access through SS, this can be tedious.

It is more secure, less work, and simpler to organize permissions for access to domain resources in AD. This strategy works best for organizations that already use AD heavily to control permissions of individual privileged users to domain resources. Ongoing maintenance will rely on updating permissions to resources in AD and ensuring that all new individuals’ privileged accounts are being added for management under SS.

### Shared Privileged Domain Accounts

You may choose to have your users use shared privileged accounts to access resources. This strategy involves creating a few service accounts that have permissions to OUs or groups of computers. In SS, these accounts can be limited with the Launcher so they can only be used to Launch to certain computers. This means you can limit the number of domain accounts created and set permissions more broadly (such as at OU level). These passwords could be changed on a schedule or, where possible, used with Check Out to change the password after each use. Using this setup, accounts can be designated for team or function and can have varying Check Out intervals set to ensure that only one person at a time is using each account.

A benefit of this strategy is if individuals do not already have their own privileged domain accounts in AD, then giving them access to shared accounts means less setup in AD while still maintaining accountability for who uses which account, and which machine they access.

A pitfall of this strategy can be that if the team (or function-specific accounts) cover a broad number of machines that can be accessed, it may be a lot of work to set up launcher allow/deny lists to control access through SS. However, if these permissions are set only through AD, it will be difficult to have the visibility into these limitations for an auditor.

### Hybrid of Individual and Shared Accounts

Sometimes, your employees' roles may require longer, more specialized access. For those accounts, you can have individual privileged domain accounts, and for the other regular users you can use a few shared privileged domain accounts. All of these can be stored in SS, but with different settings governing their usage. For example, the shared accounts would still have check out enabled, while the individual privileged accounts will simply have permissions limited to an individual user, possibly with the password hidden using hide launcher password.

### What Is the Highest Risk?

Implementing a comprehensive PAM policy should eventually cover all of your privileged/shared accounts, but this can take some time. When looking at where to start, it is important to consider the areas of risk that your team has to deal with. Where are the areas that need more immediate attention? Is it local Windows admin accounts all sharing the same password? Pass-the-hash vulnerability? Protecting your network equipment passwords? Avoiding fines for not meeting compliance mandates? Maybe it is password misuse and auditing employee access to accounts is most important to you. Choose a starting point that will that will give your organization the most value, and then branch out from there.

## Users

At minimum, the administrators who manage and use your organization’s privileged passwords and data on a regular basis will need to access your SS. SS users can be defined in two ways: as local SS accounts or as AD user accounts. SS also has the concept of groups, which can be local (you create them in SS) or AD-synced (security groups from AD). Groups are a powerful tool for assigning and maintaining permissions to secrets, and therefore should be given careful thought and planning.

### Local Secret Server Accounts

Local users and groups have to be created and managed manually in SS, as they are not integrated with AD. The first account you create in SS is an example of a local account. Local groups can include local users and AD accounts, and can have a user established as the group owner that is permitted to add or remove users to or from the group.

### Active Directory Accounts

AD accounts can be added for access to SS either manually (one by one) or by AD security group. When adding users by security group, you choose which groups SS will synchronize with AD to update which users’ access to SS is enabled or disabled. AD group synchronization happens on a regular, customizable interval to keep group membership changes that happen in AD up-to-date in SS as well.

### Local or Active Directory Accounts?

We recommend using one of these options:

- Only local users and groups (best security)

- Only AD users and groups (most convenient)

- A hybrid of AD users and local groups (balance of security and convenience)

You  need to choose an option that provides the levels of security and convenience that are acceptable for your organization. Using the AD accounts option is easy for user maintenance, but it limits the security of SS to the level of security of your AD. This may be fine—just be sure to consider the question of domain admin access to AD in combination with SS permissions.

#### Only Local Users and Groups

Creating local users and groups within SS provides a lot of flexibility because you can tailor permission assignment by group to your exact needs. The major benefit of local users and groups is security: users and group membership can be controlled entirely by role-based access control (RBAC) within SS. However, this approach requires more maintenance because creating or deleting users and managing group membership has to be controlled in SS.

#### Only AD Users and Groups

If you are considering using AD users and groups for SS access and permissions assignment, review your teams that need access to SS. Compare them to the corresponding groups in your AD. If your AD groups map to ways you want to assign access to secrets, you can synchronize your AD groups with SS and start assigning permissions to secrets (and levels of those permissions—View/Edit/Owner) by group. You can then effectively manage SS access and secret permissions completely from AD by changing AD group membership.

Many customers choose this option because they can maintain control in AD and do not have to worry about any user or group maintenance within SS. If you want to use this option but your AD groups don’t match the way you want to assign secret permissions, you will need to create new AD groups to match this, or may want to consider the hybrid approach (below), using local groups instead.

#### Hybrid of AD Users and Local Groups

A third option is to create local groups in SS and add AD users to those groups for the purpose of organizing how permissions are assigned to secrets. Many customers who use this setup will create a single AD security group (for example, SecretServerUsers) to use to synchronize their AD users with SS. This approach is more secure than using only AD groups and users, but it is important to keep in mind that an adversary could still reset an AD account password to gain access to your SS.

### Strong Authentication

Protect the tool you’re using to secure your privileged accounts by adding a second factor of authentication for users logging into SS. Two-factor authentication can be added whether users are logging in with local or AD accounts. For more information about using two-factor authentication with SS, see the [Security Hardening Guide](../security-hardening/security-hardening-guide/index.md).

## Roles

Roles control which features of SS a user is able to use, view, or administer. Existing roles can be customized, and new roles can be created as needed. SS comes with several roles by default, including administrator, user, and read only. You should review the default roles and decide whether your organization needs further roles for various purposes such as third-party consultants or auditors.

> **Note:** Users with the default administrator role  (which contains all role permissions available) do **not** automatically have  access to all data stored in your SS. secrets are only visible to  a user based on the explicit secret permissions assigned to them.

We strongly recommend pulling one or both role permissions pertaining to unlimited administration mode out of the default administrator role. Unlimited administrator mode is a “break-the-glass” feature that allows a user to view all secrets in SS. By splitting the unlimited administration permissions into separate roles, it ensures no one user can both turn on the feature and operate as the unlimited administrator. For more information about how unlimited administration mode works and how to effectively control the relevant role permissions, see the [Security Hardening Guide](../security-hardening/security-hardening-guide/index.md).

### Role Definition and Assignment

Once you have defined your roles, they will seldom need to be changed. Access to modify and assign roles should be tightly controlled.

### Group Assignment

If roles are assigned to groups, then assignment of the groups will also need to be controlled. Often very sensitive role permissions, such as unlimited administrator, are assigned at the user level to limit the risk of granting group assignment permissions.

## Permissions

You have different sets of passwords that should only be viewed by particular administrators. You may also have certain passwords that should be read-only to some administrators, editable by others and not even visible to other administrators. All of these options are possible to configure using the permissions within SS.

Permissions can be allocated at the individual user level but it tends to be easier to manage over time if you allocate your permissions at the group level. You will need to decide if your existing AD groups could work for these permissions or if you need to create new AD groups or if you want to create and manage local groups in SS.

For more information about what each level of permissions entails, see the [Secret Server Role Permissions List](../roles/role-permission-list/index.md).

## Folder Structure

### Using Folders to Control Access (Inherit Permission)

You can apply permissions (View/Edit/Owner) at the secret level. This allows you to apply very granular permissions on a single secret if needed. Managing permissions on each secret is powerful for situations where you need that flexibility, but it tends to be harder to manage over hundreds or thousands of secrets. Instead, you should consider using folders to control permissions for most secrets. This can be done by creating a folder structure that best represents your organization, teams or data being stored and then applying permissions on the folders, using inheritance across folders where appropriate. Secrets placed in a folder can then inherit the permissions of the folder.

### Deciding on your Folder Structure

The folder structure creates a hierarchy for organization and permissions. This means that folders near the root level need to break out access in high level terms and then get more specific permissions (typically breaking inheritance) as you move down to the “leaf level” sub-folders.

For example:

Information Technology

​	Technical Services

​		Systems

​			Windows

​			UNIX

​			Network Infrastructure

​		Database

​			Oracle

​			SQL Server

​	Development Services

​		Programmers

​		Vendors

​		Human Resources

​		Customers

The most typical configuration is to break out the folders based on the teams that need to use those folders with the most restrictive permissions at the outer most “leaf” folders of the tree.

An Oracle DBA might have the following permissions on the above folders:

Information Technology (view)

​	Technical Services (view)

​	Database (view)

​		Oracle (view/edit/owner)

​		SQL Server (view/edit)

> **Note:**  A user cannot see the full  folder structure unless they have view permissions on all the parent folders  of a particular folder. For example, a user with view on the Oracle folder,  would also need view on Database, Technical Services, and Information  Technology to  see the full folder path.

There are settings under **Admin** \> **Configuration** \> **Folders** to control whether inheritance on folders and secrets should be turned on and also whether users should always see all folders. There are many ways to configure this for your organization.

The most common approach is:

- Use inheritance
- Do not allow users to see folders unless they explicitly have view permissions
- Require all secrets to have a folder

This allows different teams or even different departments within your organization to use the same SS instance independently.

## Secret Policy

A *secret policy* is a set of security and remote password changing settings that are normally applied to a secret on the Security or Remote Password Changing tabs. The benefit of using a secret policy is not only that settings can be applied in bulk to secrets (that is, by folder), but that these settings can also be enforced, preventing users from changing them.

Secret policies should be established to apply settings to secrets that are key to the workflow your organization is working toward. For example, if your primary concern is more detailed auditing around service account usage and you also have a requirement that all service account passwords change every 60 days at 2 A.M. on the next Tuesday, you can create a policy that includes these settings and apply it to the folders that will contain all of your service accounts. Whenever new accounts are added to the folder, such as when they are imported via discovery, the settings will automatically be applied and enforced.

Secret policies can also be updated after they have been assigned to folders. Therefore, if your password policy changes and you need your service account passwords to change every 30 days, you can update the policy and it will immediately apply to all secrets the policy is assigned to.

## Discovery

This section of the document discusses some key best practices around using SS’s Discovery feature to find and manage accounts in your environment. See [Further Resources](#_Further_Resources) for a link to the comprehensive guide to configuring and using Discovery.

### Discovery Workflow

While it may be tempting to immediately get started using discovery to get your accounts under control, there are a few things you can do ahead of time to make the enforcement of your organization’s password policies more streamlined:

- Know which secret template you want to import accounts to. This can effect password changing and Launcher settings that are applied to your imported accounts.

- Have a folder structure established so you have folders appropriated for each type or category of discovered accounts.

- Apply a secret policy to the folders you import to.

Having these settings in place can save you the considerable amount of time it could take to have to re-organize all of your accounts and policies post-import.

### Local Windows Accounts

How many local Windows accounts in your environment use the same password? Are they local admin accounts? Use discovery to quickly mitigate the risk of pass-the-hash attacks by finding all of your local Windows accounts and setting their passwords to unique, strong passwords managed by SS. Where your admins previously had to remember one password to access all machines with local admin rights, they now have to remember zero passwords because they can use SS to find the machine and launch an RDP session using the local admin account without ever knowing, copying, or typing the password.

### Find Backdoor Accounts

Ensuring that users are not creating backdoor administrative accounts on Windows machines is very important as these can compromise general security as well as open the potential for a user to access a machine directly without being audited. By running discovery on a regular interval and having discovery rules alerting you when new accounts are found, you can ensure that users any new local Windows account being created are identified in addition to being either removed or brought into SS.

### Service Accounts

Many organizations do not know where their AD service accounts are being used across the network. By using discovery to scan your network, you can find all of the Windows services, application pools and scheduled tasks that are run by AD service accounts. Once these accounts are found and brought into SS, having discovery run on a regular basis will find any new locations where the account is being used since they were added to SS. With discovery rules, those additional dependencies can be automatically added to the existing secrets. We recommend making sure that the service account discovery has run before using SS to change the service account password.

### Unix Accounts

When scanning for UNIX accounts, we recommend using SSH key validation, as discussed in the [Security Hardening Guide](../security-hardening/security-hardening-guide/index.md). This ensures that you are only connecting and trying to authenticate to UNIX servers that have a valid and trusted SSH key.

### ESX/ESXI accounts

Local accounts on ESX/ESXi systems should not change once the server is set up and configured. We recommend creating discovery rules that monitor your ESX/ESXi servers and email the proper teams to inform them of any new account found. These accounts really should not be created, so it is important to monitor them and ensure that no one is creating them maliciously.

## Workflow Security

Often you will have situations in which you want users to have access to accounts, but only under certain circumstances, such as on a specific day or after the approval of a manager. Maybe your compliance requires that you have the ability to monitor an active RDP, or that you use a one-time password for certain accounts. This section examines best practices around workflow security settings in SS as well as scenarios when these settings are commonly used.

### Hide Launcher Password

Many times, giving an employee access to a resource through SS does not require that he or she have access to the actual password for the account used. As long as the application a user needs can be started by the launcher, there is no reason the user needs to copy/paste or type the password. The hide launcher password setting implements the following:

- Users with access to the secret will see only asterisks (\*\*\*\*) in the password field

- There will be no copy-to-clipboard, field history, or unmask icons next to the field

Note: Users with edit permissions to a secret with "hide launcher password" enabled can still view the password when editing the secret. To prevent all possible access  to the password, limit users to view permission only.

This can be a key way to reduce exposure of your privileged account passwords. Hiding launcher passwords can be enabled for secrets under the Security tab of a secret or by applying a secret policy. You can also remove the ability for a user to see the password for any secret with a launcher by removing the "view launcher password" permission from their role.

### Require Approval

The "requires approval for access" setting is typically employed in the following cases:

- When a user should be required to request access to a secret for a certain time period

- When an administrator would like to approve a user’s access to a secret in advance for a time in the future (such as a maintenance period outside normal business hours)

- When a group of administrators would not like anyone to access a secret without the approval of another administrator


This setting can be turned on under the Security tab for an individual secret, but can also be applied via a secret policy. When enabling "requires approval for access," remember that users will still need to have at least view permission to the secret to request access to it. Once access has been granted to the secret, they have whichever level of permission was assigned to them for the secret (view, edit or owner). The approvers of the secret are specified when enabling the setting, and these individuals will be able to modify the time that the requestor originally submitted their access request for or deny the request altogether.

To require all approvers of a secret to also request access from another approver, be sure to enable the "owners and approvers also require approval" setting.

### Check Out

There are times when users need to be able to access a password directly, but you still want to have control over how long they are able to use the account without the need to approve access each time. In this case, hiding the launcher password is not a possibility, but there is also concern about having the user know what the password is after they are done using it. Another concern if often the risk of the hash of the password being stored locally on remote devices after each use and potentially being vulnerable to a pass-the-hash attack.

"Check out" is a security setting that means:

- Only one user at a time has access to a secret

- A user can only access the secret for a predetermined check out interval, such as 30 minutes

- At the end of a check out interval (check in), or when a user manually checks in the account before the time is up, the secret is available for check out by another user

- When enabled, the password can also be changed automatically upon check in


Domain administrator accounts are a great example of a case in which using check out to change the password every time it is used can be extremely beneficial. This ensures that users are not copying the password to Notepad or writing it down for later use and also invalidates the hash that was stored on the remote machine after a remote desktop session.

Check out can be turned on under the Security tab for an individual secret, but can also be applied via a secret policy.

### Session Monitoring

For critical systems and highly privileged accounts, sometimes simply having an audit trail showing when someone viewed the account in SS is not enough. Maybe the auditor also wants to be able to review what was done with the account on a remote session. For these critical secrets, it is recommended to enable session recording for the secret. When session recording is enabled, all launcher sessions can be recorded for later viewing by the auditor or manager in the event they need to investigate the actions performed during a remote session.

Before you enable session recording, you may want to evaluate your users’ roles to know exactly who will have the ability to monitor real-time sessions and view recordings. The permissions to look for are "administer session monitoring," "view session monitoring," and "view session recording."

Session monitoring can be turned on under the Security tab for an individual secret, but can also be applied via a secret policy.

## Secret Templates

Secret templates in SS define the types of data (secrets) that can be stored, and the settings for that data. You can store just about any type of sensitive data in SS.

It is important to review the available templates and decide which ones should be available to your users as well as where you would like to make changes to the default templates included.

### Configuring Templates

You can customize existing templates or create new templates if necessary. Many templates are included by default that cover common account types. For example, the AD Account template contains the following settings:

Domain, username, password, and notes fields

30-day expiration period, applying to the password field

RDP launcher, requiring user input for computer to connect to

Password changing and heartbeat enabled

AD password changer, with default password requirements

These settings are typically sufficient for most organizations to use out-of-box. However, you may wish to enable other settings or change settings such as enforcement of a naming convention or more complex password requirements. In this case, you have the flexibility to either modify the existing template, copy the existing template to use as a base for a new template, or create a new template from scratch. The following sections cover some fundamental template settings available for you to customize.

### Naming Patterns

SS supports enforcement of naming patterns for secret names. Naming patterns allow you to maintain consistency for secret names and can help ease both browsing and grouping secrets by name. Naming patterns use regular expressions and allow you to enter a descriptive error message to describe your naming standard to users. The most common naming standard used is RESOURCE\ACCOUNT (for example, server0001\administrator). You can find this setting by clicking Edit from the template designer page.

### Password Requirements

Password Requirements determine the password compliance rules (for example, 16 characters, one uppercase, one lowercase, one symbol and one number). These can be customized and applied to passwords at the secret template level or per individual secret (under the Security tab). This controls the complexity of passwords generated by SS. Password requirements can also be enforced when users try to edit or create new passwords, and can be viewed for password compliance in reports. This allows you to have different complexity rules for different types of passwords if needed (such as Oracle, SQL, Windows, and UNIX). You can choose to have SS enforce the password requirements on add/edit by turning on validation on the secret template (click Edit from the template designer page).

Talk to your security management, auditors and industry experts to find out the best password complexity settings for your environment. Do not hesitate to stipulate complex passwords, such as 100-character random-generated passwords with symbols, alphanumeric uppercase and lowercase)—using a platform like SS makes it easy to work with passwords so length complexity and length do not matter (for launchers, copy-to-clipboard, and auto change). In fact, very large passwords can add to security since administrators will be far less likely to remember them or write them down or want to type them.

Another thing to consider when creating password requirements is which character sets should be used. Some systems may not work well with certain characters. For example, underscores can be problematic in certain mainframe environments. You can create your own character sets (Admin \> Secret Templates \> Character Sets) for use in password requirements. These can then be used when passwords are generated by SS.

### Secret Expiration

SS uses expiration to ensure that passwords are changed on a regular basis. Secrets can be set to expire on an interval such as 30 days (or other intervals as needed). Expiration is often combined with automatic password changing to control how often a password is changed (whenever it expires, SS will queue the secret up for a password change).

You can also control which field is used for expiration. This does not have to be the password field—you could use expiration on a license key and set expiration to when the license is going to expire. When a secret expires, you can then update the expiration field (say license key) and it will no longer be expired. This is a generic way to ensure that a specific field on a secret is changed on a regular basis.

### Password History

SS will automatically keep all history on all fields on a secret template. This means that all previous values for machine, username, password and any other fields will be kept. This is helps ensure that previous passwords can be found if needed.

### File Attachments

Do not forget files. You can have fields on your secret template that are for file attachments. This can be used for storing license key files, private keys, SSL certificates, even Microsoft Word or Excel documents that contain sensitive data.

### Session Launcher

The Launcher can be configured on the secret template to allow any tool to be launched using the secret such as Remote Desktop, PuTTY, Web launcher or a custom launcher you configure for a particular executable file, for example, MS SQL Management Studio, SSH clients, FTP tools and more. This can also be used with the "hide launcher password" setting to allow administrators to launch tools without revealing the password.

## Template Management

It is worth spending time in the beginning to get your secret templates the way you want them before users start adding data. Therefore, when a user goes to create a new secret it will be clear which secret template to use instead of selecting the wrong one and attempting to fit account information into an unsuitable template. You can use an option on the secret called "convert template" to later convert a secret to another template, but it is much simpler to plan ahead before your organization begins adding data.

### Basic Configuration

When creating new secret templates, make sure you configure Remote Password Changing, password requirements, secret expiration and the launcher. Ensure your secret template names are descriptive and use terms your users understand. For instance, if you have one template that expires and one that does not, make sure it is clear from the name. If your organization does not use the term AD account, change it to match the organization’s language.

### Limit Secret Template Administrators

Changing secret templates should be limited to only a small subset of your SS admins. Create a separate role that has the "administer secret templates" role permission and remove it from administrator if you have a lot of administrators. Once you have secret templates configured, it is unlikely they will need to be changed frequently so very few people should need access.

### Deactivate Unused or Retired Templates

SS comes with many secret templates preconfigured. You should decide which you want to use and then deactivate the others. You can also retire secret templates if your requirements change over time—secrets remain when a secret template is deactivated but no one will be able to create new secrets for that secret template.

SS uses soft deletes rather than hard deletes (data is marked as inactive rather than actually deleted), which is essential for auditing. Secrets and secret templates can be inactivated but not deleted.

### Override Settings at the Secret

Many of the settings at the secret template can also be overridden at a secret based on that template. For example, if you create a secret for your AD service accounts with a 30-day expiration but need 90 days for one particular AD service account, you can set it to 90 days for that one secret. This gives some flexibility for secrets that need to behave differently than other secrets using the same secret template.

