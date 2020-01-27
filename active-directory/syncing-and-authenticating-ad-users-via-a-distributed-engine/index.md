[title]: # (Syncing and Authenticating AD Users via a Distributed Engine)
[tags]: # (XXX)
[priority]: # (60)

# Syncing and Authenticating AD Users via a Distributed Engine

In addition to syncing AD with SS via your local site, SS can also synchronize and authenticate users from distributed engine (DE). You can install a DE in a remote site, allowing all users to use the same SS with their AD credentials. This feature allows organizations with users in different locations to easily get access to SS, and now organizations with Secret Server Cloud can use local AD credentials for authentication. To setup AD to sync from a DE:

1. Create a synced secret. Before synchronizing or creating users, create a secret for use as the sync secret. This secret should contain Domain Admin credentials (or an account with appropriate permissions for read access to all your organization’s AD objects).

1. Specify the domain to authenticate against:

   1. Before synchronizing or creating users, you must first specify which domains SS can authenticate against. SS can synchronize with any number of domains. 

   1. Go to **Admin \> Active Directory**. The Active Directory Configuration page appears.

   1. Click the **Edit Domains** button. 

   1. Click the **Create New** button. The Active Directory Domain page appears.

   1. Type the domain information that you want to authenticate to.

   1. Click the **Link a Secret** selection button.

   1. Click the **Sync Secret** list to select the AD secret you created earlier.  

      > **Note:** If you do not have a secret setup yet, click the **Create New Secret** link to create your AD secret.
      > **Note:** The AD sync secret is used to synchronize users and groups. It requires permission to search and view the attributes of the users and groups.  If you plan on using SS discovery, the account will also need permissions to scan computers on the network for accounts.

   1. Click the **Save and Validate** button.  

1. Set up the synchronization groups:

   1. Once the domain has been added, go to **Admin \> Active Directory**. The Active Directory Configuration page appears.
   1. Click the **Edit Synchronization** button.  The Synchronization Edit page appears.
      The Available Groups represent all accessible groups on the specified AD domain. You can preview the user membership with the Group Preview control.

1. Select the desired group from the Available Groups that contains the AD accounts for users you would like to create in SS.

1. Configure AD:

   > **Note:** See [Active Directory Configuration Parameters](#Active-Directory-Configuration-Parameters) for more information.

   1. Go to **Admin \> Active Directory**. The Active Directory Configuration page appears.

   1. Click on the **Edit** button. The Edit Active Directory Configuration page appears.

   1. Click to select the **Enable Active Directory Integration** check box.

   1. Click to select the **Enable Synchronization of Active Directory** check box.

   1. Click the **Save** button.

   1. Turn on AD sync.
