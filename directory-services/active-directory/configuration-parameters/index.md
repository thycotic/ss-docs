[title]: # (Configuration Parameters)
[tags]: # (Active Directory)
[priority]: # (1000)

# Configuration Parameters

Active Directory configuration can be enabled by a user with the Administer Active Directory role. To change these settings, select **Active Directory** from the **Administration** menu and then click **Edit**.

The configuration screen offers several options:

- **Enable Active Directory Integration:** Enable or disable the Active Directory Integration feature.
- **Enable Integrated Windows Authentication:** Enable or disable the Windows integrated authentication feature.
- **Enable Synchronization of Active Directory:** Enable or disable the automatic synchronization of the selected Synchronization Groups from Active Directory. If you have manually added users and will not use the Synchronization group, do not enable this setting or manual users can be locked out.
- **Enable Integrated Windows Authentication:** Enable or disable the Windows integrated authentication feature.
- User Account Options:

   - **Users are enabled by default (Manual):** SS users are automatically be enabled when they are synced as new users from Active Directory. If they were disabled explicitly in SS, they are not be automatically re-enabled. If creating a new user causes the user count to exceed your license limit, the user is created as disabled.

   - **Users are disabled by default (Manual):** SS users are automatically disabled when they are pulled in as new users from Active Directory. If they were enabled explicitly in SS, they are not automatically re-disabled.

   - **User status mirrors Active Directory (Automatic):** When a new user is pulled in from Active Directory, they are automatically enabled if active on the domain. The exception is when this causes you to exceed your license count. For existing users, they are automatically be disabled if they are removed from all synchronization groups, deleted in AD, or disabled in AD. They are automatically re-enabled when they are part of a synchronization group and are active in AD.
