[title]: # (Dependency Settings and Information)
[tags]: # (Dependency Settings)
[priority]: # (1000)

# Dependency Settings and Information

Dependencies have the following settings:

> **Note:** Not all dependency types have all these settings.

- **Change Fail Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that determines if SS was unable to update the public key on the dependency.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Change Success Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that determines if SS was able to update the public key on the dependency.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Dependency Group:** Name of the group to run the dependency update in.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Enabled:** Whether SS attempts to update the dependency. A disabled dependency is ignored by SS.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Machine Name:** Computer name or IP address on which the dependency is located.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Port:** For SQL and SSH script dependency types, the port name for the script.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Public Key:** For SSH key rotation and SSH key rotation privileged dependency types, this text-entry field holds the value of the public key stored on the dependency.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Restart:** Determines if the dependency is restarted once the account has been updated.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Script:** Name of the PowerShell script, SSH script, or SQL script in the scripts repository configured on the Dependency Template. The actual script selected can be previewed by clicking the eye icon.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Server Name:** For SQL script dependency types, the server name for the script.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Template:** Whether the dependency is an IIS application pool, Scheduled Task, windows service, remote file, COM+ application. Custom dependencies can also be created using a SQL, SSH, or PowerShell script.
- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.
- **Wait(s):** Time in seconds that SS pauses before changing the dependency.

Example values for a Windows service dependency on a remote computer might be: `192.11.158.99`, `Windows Service`, `aspnet_state`, or `DOMAIN\admin`.

The following operations can be performed in the Dependency grid:

- **Delete:** Click the ![1556294394197](images/1556294394197.png) icon to delete the dependency.
- **Edit:** Click the ![1556294408164](images/1556294408164.png) icon to edit dependency text boxes. Cancel changes by pressing the Cancel button.
- **Run Dependency:** Click the second arrow icon to run the script on the selected dependency and set the password on the selected dependency to the current password for the secret
- **Edit:** Click the ![1556294408164](images/1556294408164.png) icon to edit dependency text boxes. Cancel changes by pressing the Cancel button.
- **View Dependency History:** Click the ![1556294428031](images/1556294428031.png) icon to view the activity logs for the dependency.

> **Note:** Due to security constraints, scheduled tasks require an Active Directory domain user as the privileged account.
