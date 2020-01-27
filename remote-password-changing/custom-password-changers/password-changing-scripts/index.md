[title]: # (Password Changing Scripts)
[tags]: # (XXX)
[priority]: # (120)

# Password Changing Scripts

PowerShell scripts, SSH scripts, and SQL scripts for password changing, dependencies, and discovery custom actions can be created by administrators with the role permission called Administer Scripts. The scripts can be accessed by going to **Administration > Remote Password Changing > Scripts**.

> **Note:** SS requires that WinRM is configured on the Web server. For instructions please see [Configuring WinRM for PowerShell](https://updates.thycotic.net/links.ashx?SetUpPowerShell).

#### Creating Scripts

On the **Scripts** screen, select desired script tab and click **Create New** to enter the name of the script, a description, and the commands to run, then click **OK**. The script now shows up in the grid. Scripts can be deactivated and reactivated from the grid.

#### Testing Scripts

All scripts run from the machine that SS is installed on, or the site assigned to the secret. To test a script, click the **Test** button on the grid next to the corresponding script.

PowerShell scripts run as the identity of the secret, so enter in an Active Directory credential to run the script as or select a secret to pre-fill the run-as credentials. Then enter in any command line arguments that the script requires. The output of the script is displayed above the grid for debugging purposes. To test the script over an engine, select a site from the **Site** list. This helps in diagnosing server specific issues where engines are installed.

#### Using Scripts

To use a script as a password changer or Dependency, it must be wired up to the appropriate action under **Admin \> Remote Password Changing** on the password changer or dependency changer.

Discovery scripting is done under **Admin \> Discovery \> Extensible Discovery**. For more information on configuring extensible discovery see the [Extensible Discovery Overview](https://updates.thycotic.net/link.ashx?ScriptableDiscoveryMoreInformation).

#### Viewing Audits

A full history of each PowerShell script is kept and can be downloaded from the audit trail. Click **View Audit** to view the audit trail for PowerShell. Each time a script is updated, the previous one can be downloaded from the corresponding audit record.

> **Note:** For additional information on setting up PowerShell scripts, please read the following KB article: [Creating and Using PowerShell Scripts](https://updates.thycotic.net/links.ashx?SecretServerPowerShellKB).
