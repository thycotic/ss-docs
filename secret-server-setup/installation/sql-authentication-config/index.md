[title]: # (SQL Server Authentication Configuration)
[tags]: # (Setup,Install,sql,authentication)
[priority]: # (1000)

# SQL Server Authentication Configuration

SQL Authentication requires:

- Creating a new SQL account

- Enabling mixed mode

- Enabling named pipes and SQL Browser a non-local SQL Server

> **Note:** For instructions on Creating the SQL account or Installing SQL Server see [Installing and Configuring SQL Server](../installing-sql-server/index.md) article.

## Enabling Mixed Mode

1. Connect to SQL Server in SQL Management Studio.

1. Right click on the instance node and select **Properties**.

1. Go to the **Security** tab.

1. In the **Server Authentication** section, select **SQL Server and Windows Authentication Mode**.

1. Click the **Ok** button.

1. Restart the SQL Server, by right clicking on the instance node and selecting **Restart**.

> **Note:** If your SQL server is running on a separate machine, you need to turn on named pipes and SQL browser to ensure the SQL server can be accessed from an external machine.

## Enabling Named Pipes and SQL Browser

1. Open SQL Server Configuration Manager.

1. Click the **SQL Server Network Configuration** node.

1. Select **Protocols for MSSQLSERVER**.

1. Enable the following:

   - Shared memory

   - Named pipes

   - TCP/IP

1. Enable **SQL Browser**.

1. Click to select the **SQL Server Services** node.

1. Right click **SQL Server Browser** and select **Start**.
