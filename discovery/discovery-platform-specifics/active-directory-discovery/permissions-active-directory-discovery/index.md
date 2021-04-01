[title]: # (Permissions for AD Scans)
[tags]: # (Discovery)
[priority]: # (1000)

# Setting Permissions for Active Directory Scans

## Local Windows Accounts

The scanning account needs the "Access This Computer From the Network" permission (and possibly one more) on the endpoint:

1. Open the local group policy editor (gpedit.msc).

1. Go to **Computer Configuration \> Windows Settings \> Security Settings \> Local Policies \> User Rights Assignment**.

1. Double-click the **Access this computer from the network** policy. The properties for the policy appears.

1. Ensure the scanning account is one of the listed users. If not, click the **Add User or Group** button to add it.

1. Look at the following list of operating systems and updates to determine if any of them match your system:

   - Windows 10, version 1607 and later
   - Windows 10, version 1511 with [KB 4103198](https://support.microsoft.com/en-us/topic/march-14-2017-kb4013198-os-build-10586-839-b30e879e-52b2-7746-f690-719984e1b9f4) installed
   - Windows 10, version 1507 with [KB 4012606](https://support.microsoft.com/en-us/help/4012606/windows-10-update-kb4012606) installed
   - Windows 8.1 with [KB 4102219](https://support.microsoft.com/en-us/help/4012219/march-2017-preview-of-monthly-quality-rollup-for-windows-8-1-and-windo) installed
   - Windows 7 with [KB 4012218](https://support.microsoft.com/en-us/help/4012218/march-2017-preview-of-monthly-quality-rollup-for-windows-7-sp1-and-win) installed
   - Windows Server 2019
   - Windows Server 2016
   - Windows Server 2012 R2 with [KB 4012219](https://support.microsoft.com/en-us/help/4012219/march-2017-preview-of-monthly-quality-rollup-for-windows-8-1-and-windo) installed
   - Windows Server 2012 with [KB 4012220](https://support.microsoft.com/en-us/help/4012220/march-2017-preview-of-monthly-quality-rollup-for-windows-server-2012) installed
   - Windows Server 2008 R2 with [KB 4012218](https://support.microsoft.com/en-us/help/4012218/march-2017-preview-of-monthly-quality-rollup-for-windows-7-sp1-and-win) installed

   > **Note:** For more information on this security issue, see [Network access: Restrict clients allowed to make remote calls to SAM](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/network-access-restrict-clients-allowed-to-make-remote-sam-calls).

1. If you found a match, do the following too:

   1. Go to **Computer Configuration \> Windows Settings \> Security Settings \> Local Policies \> Security Options**.

   1. Double-click the **Network access: Restrict clients allowed to make remote calls to SAM** policy. The policy properties appear.

   1. Click the **Edit Security** button to select an account for the Security descriptor text box. The Security Setting for Remote Access to SAM dialog box appears.

   1. Ensure the scanning account is present (if not add it).

   1. Click the account in the **Group or user names** list. The permissions for that account appear.

   1. Ensure the **Allow** check box next to the **Remote Access** permission is selected.

   1. Click the **OK** button.

> **Note:** The discovery account must be part of the local admin's group to be able to pull back any local accounts.

## Windows Services, Scheduled Tasks, App Pools, and COM+ Applications

> **Note:** There are special considerations for discovering service accounts running COM+ Applications, please see the following for instructions: [COM+ Dependency Scanner](https://thycotic.force.com/support/s/article/ka037000000HtkmAAC/COMPlus-Depenency-Scanner) (KBA).

To scan for service accounts, the account entered must be a domain account that is in the Administrators group on the target machines. Follow the instructions below in either case to ensure your account has the appropriate privileges to run a successful scan:

1. Open the group policy editor for your domain policy.

1. Go to **Computer** **Configuration** \> **Preferences** \> **Control Panel Settings**.

1. Right-click **Local Users and groups** and select **New** > **Local Group.**

1. Leave the **Action** dropdown list set to **Update**.

1. Click to select **Administrators (Built-in)** in the **Group Members** dropdown list.

1. Click the **Add…** button.

1. Search for the account you will use for discovery scanning.

1. Click the **OK** button to save your changes. The next time the group policy updates across your environment, the discovery account will be part of the local administrators group.

1. For strong security, configure the group policy to limit the logon privileges of that account:

   1. Open the group policy editor

   1. For your domain policy, go to **Computer Configuration** \> **Policies** \> **Windows Settings** \> **Security Settings** \> **Local Policies** \> **User Rights Assignment**.

   1. Add your discovery account to the **Deny log on locally** policy.

   1. Add your discover account to the **Deny log on through Remote Desktop Services** policy.

   1. (Optional) Ensure the account is not part of the remote desktop users group.