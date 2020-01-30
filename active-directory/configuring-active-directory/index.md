[title]: # (Configuring Active Directory)
[tags]: # (XXX)
[priority]: # (20)

# Configuring Active Directory

To allow users to log in with their Active Directory (AD) credentials, you can configure your AD domain settings in SS and then add users either individually or by group.

### 1) Adding a Domain

1. Select **Admin \> Active Directory**. The Active Directory Integration page appears.
1. Click the **Edit Domains** button. The Active Directory Domains page appears.
1. Click the **Create New** button. The Credentials tab appears.
1. Fill in the domain information and the username and password that will be used for connecting to the domain and synchronizing users and groups.
1. Click the **Save and Validate** button.

### 2) Enabling Active Directory Integration

1. Select **Admin \> Active Directory**. The Active Directory Integration page appears.
1. Click the **Edit** button. The Edit Active Directory Configuration page appears.
1. Click to select the **Enable Active Directory Integration** check box.
1. Click the **Save** button. 

Now you are ready to add individual users or groups of users for access to SS with AD credentials. See the relevant section below for instructions.

### 3) Adding Users and Groups

#### Adding Users

To add an individual AD user:

1. Click **Admin \> Users**. The Users page appears.

1. Click the **Create New** button. The Edit User Page appears.

1. Select the desired domain from the **Domain** dropdown list.

1. Type the user’s Active Directory username in the **User Name** text box.

1. Type the user's display name in the **Display Name** text box.

   > **Note:** The user’s email address is synced from AD, if available, so it is not necessary to type that in.

1. Click the **Save** button.

#### Adding Groups

SS can sync with security groups from AD to automatically add, enable, and disable users. This can streamline the process of managing which users are enabled.

> **Note:** Enabled users count towards your SS user licensing.

### 4) Enabling Active Directory Synchronization

1. From the **Active Directory** page, click the **Edit** button. The Edit Active Directory Configuration page appears.
1. Click to select the **Enable Synchronization of Active Directory** check box. Additional settings appear.
1. Choose how often you want Secret Server to sync with AD by configuring the **Synchronization Interval**. The default value is one day.
1. Click the **User Account Options** Dropdown list to select a default status for users. See below for a description of each option. We recommend selecting **Users are disabled by default (Manual)** for initial testing. The options are:
   - **Users are enabled by default (Manual)**: SS users are automatically enabled when they are synced as new users from AD. If they were disabled explicitly in SS, they are not automatically re-enabled. If creating a new user will cause the user count to exceed your license limit, the user created disabled.
   - **Users are disabled by default (Manual)**: SS users are automatically disabled when they are pulled in as new users from AD. If they were enabled explicitly in SS, they are not automatically re-disabled.
   - **User status mirrors Active Directory (Automatic)**: When new users are pulled in from AD, they are automatically enabled if active on the domain. The exception is when this will cause you to exceed your license count. For existing users, they are automatically be disabled if they are removed from all synchronization groups, deleted in AD, or disabled in AD. They are automatically re-enabled when they are part of a synchronization group and are active in AD. See [Understanding Active Directory Automatic User Management](#understanding-active-directory-automatic-user-management).
1. Change the **Days to Keep Operational Logs** text box to set the period to keep AD-related logs that might contain PII. SS automatically deletes logs older than that (in days).
1. Click the **Save** button.

### 5) Choosing Synchronization Groups

Choose the security groups from AD you want to sync with SS:

1. Go to **Admin \> Active Directory**.

   <img src="images/image-20191203150447650.png" alt="image-20191203150447650" style="zoom:67%;" />

1. Click the **Edit Synchronization** button. The Synchronization Edit page appears:

   <img src="images/image-20191115111837932.png" alt="image-20191115111837932" style="zoom:67%;" />

1. Click the Select Domain dropdown list to choose your domain. More options appear:

   ![image-20191115111929782](images/image-20191115111929782.png)

1. Click the **Search** button.

   ![image-20191115112109905](images/image-20191115112109905.png)

1. Select the group(s) you would like to sync from the **Available Groups** list, then click the single left arrow **<** to add them to **Synchronized Groups**.

1. Click the **Save** button.

### 6\) Running Active Directory Synchronization

From the **Active Directory** page, click the **Synchronize Now** button to run a sync. As the sync progresses, you can click the **Refresh** button to monitor the logs until you see the message **Completed Domain synchronization for all domains**.
