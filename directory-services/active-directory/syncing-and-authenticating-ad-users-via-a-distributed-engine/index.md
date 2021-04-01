[title]: # (Syncing and Authenticating AD Users via a Distributed Engine)
[tags]: # (Syncing AD Users)
[priority]: # (1000)

# Syncing and Authenticating AD Users via a Distributed Engine

## Local Versus Distributed Engine Sites

SS connects to the domain: from the Web server _or_ routed through a distributed engine. If your Web server can reach your domain without issue, then using the local site option is recommended. When a user authenticates or AD synchronization is run, the connection to the domain is from the Web server. If your Web server cannot connect to the target domain, if it is a VM in a cloud environment for example, you can setup an engine on-premises and assign it to the domain. When a user authenticates, SS routes the domain calls through the on-premises engine, eliminating the need for site to site connections or persistent VPNs. Review the Distributed Engine guide for steps on setting up sites and engines.

> **Note:** The Active Directory secret is used to synchronize users and groups, it requires permission to search and view the attributes of the users and groups. If you plan on using discovery, the account also needs permissions to scan computers on the network for accounts.

To setup AD to sync from a DE:

1. Create a synced secret. Before synchronizing or creating users, create a secret for use as the sync secret. This secret should contain Domain Admin credentials (or an account with appropriate permissions for read access to all your organization's AD objects).

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

   > **Note:** See [Active Directory Configuration Parameters](../configuration-parameters/index.md) for more information.

   1. Go to **Admin \> Active Directory**. The Active Directory Configuration page appears.

   1. Click on the **Edit** button. The Edit Active Directory Configuration page appears.

   1. Click to select the **Enable Active Directory Integration** check box.

   1. Click to select the **Enable Synchronization of Active Directory** check box.

   1. Click the **Save** button.

   1. Turn on AD sync.
