[title]: # (Enabling and Disabling Maintenance Mode)
[tags]: # (Administration, Enable, Disable, Maintenance mode)
[priority]: # (1000)

# Enabling and Disabling Maintenance Mode

Turning on Maintenance Mode allows you to temporarily prevent users from changing roles, Secrets, or Secret-related data such as dependencies, templates, and password requirements. For example, you would want to enable Maintenance Mode while migrating the Secret Server application to a new server with a different domain.

To turn on Maintenance Mode, click **Administration** in the left-hand navigation and at the bottom of the list of Administration areas, then click **Show All**.

1. In the Server Nodes window, click **Setup & System Maintenance**, then click **Server Nodes**.  

   ![enable-maint1](images/enable-maint1.png)

1. In the Maintenance Mode column, click the edit icon next to Disabled.

   ![enable-maint2](images/enable-maint2.png)

1. Check the box that appears and click the Save icon.
If you change your mind, you can click the **X** next to the Save icon.

   ![enable-maint3](images/enable-maint6.png)

    A notice appears stating, "Enabling Maintenance Mode will take 5 minutes. Are you sure you want to proceed?"

1. Click **OK**.

    While Maintenance Mode is setting up, a spinner appears.

   ![enable-maint3](images/enable-maint4.png)

    When Maintenance Mode is enabled, "Enabled" appears in the Maintenance Mode column.

    ![enable-maint2](images/enable-maint5.png)

    >**Note**:  When Secret Server is in Maintenance Mode; a notification bar is displayed to alert users.

To return Secret Server from Maintenance Mode to normal operation, return to the Server Nodes window, then follow these steps:

1. In the Maintenance Mode column, click the edit icon next to Enabled.

    ![enable-maint2](images/enable-maint5.png)

1. Uncheck the box that appears and click the Save icon.
If you change your mind, you can click the **X** next to the Save icon.

   ![enable-maintenance5](images/enable-maint3.png)

>**Note**: When Secret Server is in its normal running mode, the Maintenance Mode notification bar is no longer displayed to users.
