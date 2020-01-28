[title]: # (User Preferences)
[tags]: # (XXX)
[priority]: # (70)

# User Preferences

> **Note:** Users can set their preferences by hovering on their profile icon in the top right and selecting preferences.

### General Tab

The following configuration settings are available for users under the General tab:

- **Date Format and Time Format:** Date and time format displayed for a user in SS.

- **Language and My Theme:** Customize the look of SS on a per user basis. For details, see [Customizing Secret Server's Appearance](#Customizing-Secret-Server's-Appearance).

- **Mask passwords when viewing Secrets:** When enabled, this masks the Password text box for a secret. There is a configuration setting that forces this to be enabled for all users. For details on password masking, see [Setting Up Password Masking](#Setting-Up-Password-Masking).

- **Send email alerts when dependencies fail to update:** Enables emails to be sent when dependencies fail to update.

- **Send email alerts when Heartbeat fails for Secrets:** When enabled, the user is emailed when a heartbeat fails for any secret the user has view permission to.

- **Send email alerts when Secrets are changed:** Enables emails to be sent on all changes of any secret that the user has view permission. There is a limit of one mail per five minutes per edit of the same user. For example, if user "User1" edits the secret twice within this grace period, only one email is sent.

- **Send email alerts when Secrets are viewed:** Enables emails to be sent on all views of any secret that the user has view permission. There is a limit of one email per five minutes per view of the same user. For example, if user "User1" views the secret twice within this grace period, only one email is sent.

- **Show the full folder path on search results:** Enables the full path to be displayed in the Folder column on the Home page.

- **Use the TreeView control for search on the home screen:** Enables the TreeView control for the Search tab on the Legacy Home screen. This option does not apply to the Dashboard.

### Launcher Tab

The following configuration settings are available to users on the Launcher tab:

- **Allow Access to Printers, Allow Access to Drives, Allow Access to Clipboard:** Allow access to various items when using the launcher.

- **Connect to Console:** Allows you to connect to remote machines using the Remote Desktop launcher and connects as an administrator. This is the equivalent of using the `/admin` or `/console` switch when launching Remote Desktop.

- **Use Custom Window Size:** Checking this box displays Width and Height text boxes for the user to specify a custom window size for an RDP launcher.
