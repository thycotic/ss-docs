

[title]: # (Setting up Clustering)
[tags]: # (Clustering, Networking)
[priority]: # (1000)

# Setting up Clustering

## Initial Setup

1. Install or upgrade SS on the primary server.

1. Ensure SS is running.

1. Click **Admin \> See All**.

1. Type **Server Nodes** in the search text box and select **Server Nodes** in the dropdown list. The Server Nodes page appears.

1. Click the **Enable Clustering** button.

1. Enable clustering by going to Administration, Server nodes.

1. Copy the entire SS application folder (typically `c:\inetpub\wwwroot\SecretServer`) from the original node to the new node.

1. Follow the steps in the [Installation Guide](../../../secret-server-setup/installation/index.md) for setting up the application pool and virtual directory in IIS.

   > **Note:** If you use DPAPI encryption for your `encryption.config` file on the original node, you need to transfer the un-encrypted version of the file to the new node. You can turn on DPAPI encryption from that server node locally after SS is running. This setting can be found at Admin \> Configuration \> Security.

1. If running SS 8.9.300000 or earlier, ensure the new server has the same date time as the original server.

1. Once the new server is running, navigate to SS on that node.

1. Perform a database connection reset. See [Changing SQL Server Connection Parameters](../../changing-sql-connection/index.md).

1. Activate licenses for the new node. You can do this on either server once the database connection is established on the new node.

1. Configure your load balancer for the two sites and to have *sticky sessions* to prevent a user from bouncing between servers on each request. See [Load Balancing Secret Server Clusters](../load-balancing-clusters/index.md).

## Upgrading in a Clustered Environment

> **Important:** Before performing this procedure, please see [Upgrading Secret Server with Web Clustering](../../../secret-server-setup/upgrading-with-web-clustering/index.md) to ensure your data is backed up.

Procedure:

1. Perform a backup of the original server.
1. Stop all but the original Web server.
1. Perform the upgrade as with a single instance.
1. Once the original server is upgraded and working, copy the web application folder (without the `database.config` or `encryption.config` files) to all other servers.
1. Start each of the other servers and confirm they still work.

## Clustering Errors

- Encryption configs don't match error: See [Encryption Key Does Not Match Error](https://thycotic.force.com/support/s/article/Encryption-key-doesnt-match-error) (KBA).
- Server dates don't match error (only for 8.9.300000 and earlier versions of SS): if the dates on the Web servers do not match, the audit records could be bad. The fix is to set the servers to the same time.
- Version does not match error: If a node is not properly updated from another node after an upgrade, that node will not run because the application version does not match the database. The fix is to copy the application folder (minus the `database.config`) to replace the files on the target server.

 