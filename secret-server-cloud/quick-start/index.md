[title]: # (Secret Server Cloud Quick Start)
[tags]: # (secret server cloud, quick start)
[priority]: # (1000)

# Secret Server Cloud Quick Start

## Overview

Secret Server Cloud (SSC) is a scalable, multi-tenant cloud platform that provides the same features as the on-premise Secret Server Professional edition. With the SSC platform, all backend services, databases, and redundancy are securely managed by Thycotic and hosted on the Microsoft Azure platform. Customers do not have direct access to the databases or application file system.

## Cloud Versus On-Premise Secret Server

For documentation purposes, SSC is the same as the corresponding on-premise edition. However, there are some feature differences:

- **Site Connectors:** On-premise versions can use multiple site connectors to manage engine connections, such as RabbitMQ or MemoryMQ. The cloud version manages this for you as an Azure service and is not configurable.

- **CRM Integration:** On-premise versions can integrate with CRMs via direct database connections or the ConnectWise API. This is not currently available in SSC.

## Getting Started


This section walks you through an initial configuration of your cloud instance. To see additional documentation for SS features, please refer to the support resources section at the end of this document.

### System Requirements

A distributed Engine server is required to communicate with SSC. Distributed engine server recommended specifications:

- Windows Server 2012 or Above
- CPU: Dual-core 2 GHz (minimum)
- Memory: 4 GB of RAM (minimum)

### Engine Connectivity

[SSC's Architecture Diagram](https://thycotic.force.com/support/s/article/Secret-Server-Cloud-Architecture) (KB) shows the network topology of your cloud instance.  Your on-premises distributed  engines do not need any inbound TCP/IP ports open (unless using RADIUS authentication). If you do not have outbound firewall policies in place, no firewall configuration is necessary. If you do, the distributed engines need outbound access to:

- SSC’s multi-tenant front-end Web server
- A shared service bus
- A customer-specific service bus
- A Content Delivery Network (CDN)

The protocols and endpoint details are in the architecture diagram mentioned above.

### Initial Setup

After you sign up for a trial, you can choose your URL name and provision your instance:

> **Note:** To see additional documentation for SS features, please refer to the support resources section at the end of this document.

1. After you sign signed up for a SSC trial, you received an email from Thycotic Sales titled “Secret Server Cloud Trial.”  Click the **Cloud Portal** link in that email to begin your setup. The Setup Page appears in your browser.

1. Choose your location in the **Cloud Environment** dropdown list.

1. Click the **Continue** button. The Thycotic One Portal appears.

1. Create the password for your first user account with administrator credentials. This account will be assigned to the email address you entered to request the trial.

1. After confirming the password, click the **Set Password and Login** button. The Thycotic log on page appears.

   > **Note:** This is the backup admin account that you may need in a “break the glass” or unlimited admin situation. Thycotic recommends you store the password in a secured physical location such as a safe or locked file cabinet. You can reset the password using an email reset, but **if this password is forgotten or you no longer have access to the email account, Thycotic will cannot reset this password**.

1. Click the blue button that matches the location you just chose. A setup page appears.

1. Type a name for your subdomain. Do not use special characters or spaces.

1. Read the End User License Agreement.

1. Click to select the check box to signify agreement.

1. From the dropdown, select **Yes** or **No** to signify your organization’s oversight of EU information.

1. Click the **Accept** button. It may take several minutes for your new SSC to spin up.

1. When initialization is complete, click go to your SSC URL and click the **Login with Thycotic One** button. You are automatically redirected to your new SSC dashboard.

### Distributed Engine

All interaction between the SSC tenant and your on premises network uses our distributed engine service to communicate. The work tasks that distributed engine completes includes Active Directory authentication, password changing, and heartbeat. The machine where the engine is installed must be able to communicate outbound on ports 443 and 9354.

>  **Note:** For more information, see the [Distributed Engine Overview](https://updates.thycotic.net/links.ashx?EngineWhitePaper) (KBA).

To install the Distributed Engine:

1. Navigate to **Admin \> Distributed Engine**

1. Click the **Download Engine Installer** button for either 64-bit or 32-bit.

   >  **Note:** You can install distributed engine on your workstation or laptop for testing purposes, but for production installs, the distributed engine server should be installed on a server. SS uses the distributed engine to communicate with your domain, so if your machine is turned off, users cannot log on with their domain accounts, and heartbeat and remote password changing will fail.

1. Run setup.exe as an administrator to install the engine service. This will install into `Thycotic Software Ltd\Distributed Engine`.

1. Go to **Admin \> Distributed Engine**.

1. Click **Manage Sites**.

1. Click **Manage New Engines**.  There should be a new engine available.

1. Click the **Assigned Site** dropdown list and select **Default**.

1. Approve it by clicking the check box to the right.

1. Validate the engine’s connectivity:

   1. Go to **Admin \> Distributed Engine \> Manage Sites**.

   1. Click the Default site.

   1. Click the **Validate Connectivity** button to test the communication between the engine and SS. It may take several minutes for the engine to register. If it does not immediately validate wait a few minutes and try again.

### Configure Active Directory Integration

Active Directory integration allows users to log in with their domain credentials. Connections to your domain are routed through the distributed engine service running in your network.

1. On the dashboard, create a new Active Directory secret from the create secret widget in the upper right hand corner.

   > **Note:** The domain account should be able to read users and groups from the domain you want to sync. For detailed information on the rights required, please see [Active Directory Rights for Synchronization Account](https://thycotic.force.com/support/s/article/Active-Directory-Rights-for-Synchronization-Account) (KB).

1. Type the domain, username, and password in the **Create Secret** form.

1. Save the secret.

1. Navigate to **Admin \> Active Directory**.

1. Click **Edit** and check the boxes for **Enable Active Directory Integration** and **Enable Synchronization of Active Directory**.

1. Click the **Save** button.

1. Click the **Edit Domains** button.

1. Click the **Create New** button.

1. Type your FQDN and a friendly domain name that users will see on the login page.

1. Click **Sync Secret** to select the secret you just created.

   > **Note**: The domain site is set to default. This means that the Active Directory authentication and synchronization will run through the distributed engine service installed on your network.
   >
   > **Note:** Do **not** select "Enable Login from AD." If you do, you cannot set the domain groups later in this instruction.

1.   Click the **Save and Validate** button.

1.   Click the **Back** button.

1.   Click the **Edit Synchronization** button. The Synchronization Edit page appears.

1.   In the **Available Groups** list, click each domain group that you want to log on in the SSC instance and click the the **\<** button to move the group to the **Synchronized Groups** list.

1.   Click the **Save** button.

1.   Click the **Synchronize Now** button to start the user and group synchronization immediately. The synchronization process runs automatically, but to get immediate results, you can start it manually.

### Test Heartbeat and Remote Password Changing

Heartbeat ensures the secrets you have stored have the correct password, and Remote Password Changing (RPC ) changes passwords on demand or a schedule.

1. Navigate to **Admin \> Remote Password Changing**.

1. Click the **Edit** button.

1. Click to select the **Enable Remote Password Changing** and **Enable Heartbeat** check boxes.

1. Click the **Save** button.

1. Click the **Run Now** button in the **Remote Password Changing and Heartbeat Log** sections. This runs the heartbeat and RPC processes immediately.

1. Go to the secret you created for domain synchronization in the previous section or create a new test secret to use.

1. A brand new secret’s **Last Heartbeat** status should be pending or processing. Once heartbeat completes you should one of these statuses:

   - **Unable to Connect:** SS could not reach the target machine. This could be a firewall issue or the machine name or IP address is wrong.
   - **Failed:** SS could connect but could not authenticate. This likely means the password on the secret is incorrect.
   - **Success:** SS successfully connected with the username and password.

1. You can test password changing by viewing a secret and clicking the **Change Password Remotely** button.

   > **Note:** This will change the password on the target system.

1. You can view the status of password changes and heartbeats in the log at **Admin \> Remote Password Changing.**

## Next Steps

- Add another user to the Administrator role in SS. This allows you to have another administrator besides the initial user account created. To assign roles, go to **Admin \> Roles** and click the **Assign Roles** button.

- Add a folder and share it with the group you synchronized from Active Directory. Create and edit folders from the Folder Tree View on your Dashboard.

- Create a secret in that folder for other users to see. When creating a secret, you can click the **Folder** link to save it to another folder.

- Have other users log on. Any users synchronized to SS through the domain synchronization can log on with their domain credentials.

- Enable Google two-factor authentication by going to **Admin \> Users**, editing the specific user, and assigning a two-factor option.

## Troubleshooting and Resources

#### Get Error: “Site (Default) engines are not currently online” When Saving Domain

This can occur when SS was not able to complete a round trip with the installed engine service. This validation may take several minutes for SS to perform after the engine has been approved and assigned to the site. To address the issue:

1. On the server you installed engine on, check the logs in the install directory `C:\Program Files\Thycotic Software Ltd\Distributed Engine\log`.

1. If you see a message for “Could not configure, trying in 30 seconds” or a “Bus Broken Down Error” verify that the engine is approved and assigned to your default site.

1. Go to the site under **Admin \> Distributed Engine \> Manage Sites**.

1. Click the **Validate Connectivity** button.

1. If a success message appears and the engine status shows as online, try saving the domain again.

#### Support Resources

- The support portal has many knowledge base articles and is located at: https://thycotic.force.com/support/s/

- The SS documentation and more information on distributed engine is available at: https://thycotic.force.com/support/s/documents.