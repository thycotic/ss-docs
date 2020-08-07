[title]: # (Account Permissions for Discovery)
[tags]: # (Discovery, Permissions)
[priority]: # (1000)

# Account Permissions for Discovery

## Unix

The scanning account needs to be able to connect over SSH and read the contents of `/etc/passwd`. This includes the minimum permissions for taking over accounts during import sudoer permissions then
 sudoer permissions on `/etc/passwd`

## ESXi

The scanning account needs “Shell Access” and the “Query VRM Policy” permission.

## Local Windows Accounts

The scanning account needs the “Access This Computer From the Network” permission. To find this permission:

1. Open the local group policy editor (gpedit.msc).

1. Go to **Computer Configuration \> Windows Settings \> Security Settings \> Local Policies \> User Rights Assignment**.

1. For Windows 2016/Win10 endpoints, edit the security policy for "Network Access: Restrict Clients allowed to make remote calls to SAM,” adding the account used for discovery and giving it “Allow” permissions.

> **Note:** For more information refer to [Network access: Restrict clients allowed to make remote calls to SAM](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/network-access-restrict-clients-allowed-to-make-remote-sam-calls).

## Windows Services, Scheduled Tasks, App Pools, and COM+ Applications

> **Note:** There are special considerations for discovering service accounts running COM+ Applications, please see the following for instructions: [COM+ Dependency Scanner](https://thycotic.force.com/support/s/article/ka037000000HtkmAAC/COMPlus-Depenency-Scanner) (KBA).

To scan for service accounts, the account entered must be a domain account that is in the Administrators group on the target machines. Follow the instructions below in either case to ensure your account has the appropriate privileges to run a successful scan:

1. Open the group policy editor for your domain policy.

2. Go to **Computer** **Configuration** \> **Preferences** \> **Control Panel Settings**.

3. Right-click **Local Users and groups** and select **New** > **Local Group.**

3. Leave the **Action** dropdown list set to **Update**.

3. Click to select **Administrators (Built-in)** in the **Group Members** dropdown list.

3. Click the **Add…** button.

3. Search for the account you will use for discovery scanning.

3. Click the **OK** button to save your changes. The next time the group policy updates across your environment, the discovery account will be part of the local administrators group.

3. For strong security, configure the group policy to limit the logon privileges of that account:

   1. Open the group policy editor

   1. For your domain policy, go to **Computer Configuration** \> **Policies** \> **Windows Settings** \> **Security Settings** \> **Local Policies** \> **User Rights Assignment**.

   1. Add your discovery account to the **Deny log on locally** policy.

   1. Add your discover account to the **Deny log on through Remote Desktop Services** policy.

   1. (Optional) Ensure the account is not part of the remote desktop users group.

