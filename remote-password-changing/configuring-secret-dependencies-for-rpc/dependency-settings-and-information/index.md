[title]: # (Dependency Settings and Information)
[tags]: # (XXX)
[priority]: # (10)

# Dependency Settings and Information

Dependencies have the following settings:

> **Note:** Not all dependency types have all these settings.

- **Change Fail Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that determines if SS was unable to update the public key on the dependency.

- **Change Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that updates the public key on the dependency.

- **Change Success Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that determines if SS was able to update the public key on the dependency.

- **Database:** For SQL script dependency types, the database name for the script.

- **Dependency Group:** Name of the group to run the dependency update in.

- **Description:** Description of the dependency for documentation purposes.

- **Enabled:** Whether SS attempts to update the dependency. A disabled dependency is ignored by SS.

- **File Path:** For Remote File Dependency types, this is the UNC file path on the remote server where the embedded password exists.

- **Machine Name:** Computer name or IP address on which the dependency is located.

- **Name:** Name of the dependency on the remote machine.

- **Port:** For SQL and SSH script dependency types, the port name for the script.

- **Privileged Account:** The account SS authenticates as when changing the dependency's credentials, so it must have privileges on the remote machine to edit the dependency.

- **Public Key:** For SSH key rotation and SSH key rotation privileged dependency types, this text-entry field holds the value of the public key stored on the dependency.

- **Regex:** For Remote File Dependency types, the regular expression used to locate the password embedded in the configuration file.

- **Restart:** Determines if the dependency is restarted once the account has been updated.

- **Run Condition:** Allows the dependency to run conditionally depending on the outcome of the dependencies above it.

- **Script:** Name of the PowerShell script, SSH script, or SQL script in the scripts repository configured on the Dependency Template. The actual script selected can be previewed by clicking the eye icon.

- **Server Key Digest:** For SSH key rotation and SSH key rotation privileged dependency types, a text-entry field that serves as a security control for specifying the SHA1 hash of the SSH host key on the remote server.

- **Server Name:** For SQL script dependency types, the server name for the script.

- **SSH Key Secret:** An account with SSH Key that SS uses to authenticate when executing the SSH Script or SSH Key rotation dependency types.

- **Template:** Whether the dependency is an IIS application pool, Scheduled Task, windows service, remote file, COM+ application. Custom dependencies can also be created using a SQL, SSH, or PowerShell script.

- **Verification Script:** For SSH key rotation and SSH key rotation privileged dependency types, this is the built-in script that verifies that the new public key on the dependency matches the private key on the secret.

- **Wait(s):** Time in seconds that SS pauses before changing the dependency.

Example values for a Windows service dependency on a remote computer might be: `192.11.158.99`, `Windows Service`, `aspnet_state`, or `DOMAIN\admin`.

The following operations can be performed in the Dependency grid:

- **Delete:** Click the ![1556294394197](assets/1556294394197.png) icon to delete the dependency.

- **Edit:** Click the ![1556294408164](assets/1556294408164.png) icon to edit dependency text boxes. Cancel changes by pressing the Cancel button.

- **Run Dependency:** Click the second arrow icon to run the script on the selected dependency and set the password on the selected dependency to the current password for the secret

- **Test Connection:** Click the return arrow icon to test the dependency connection, the tests results are displayed afterward.

- **View Dependency History:** Click the ![1556294428031](assets/1556294428031.png) icon to view the activity logs for the dependency.

> **Note:** Due to security constraints, scheduled tasks require an Active Directory domain user as the privileged account.
