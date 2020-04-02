[title]: # (Sharing Secrets)
[tags]: # (Share Secret)
[priority]: # (80)

# Sharing Secrets

Sharing passwords is crucial for information technology teams. Due to the sensitive nature of sharing secure information, SS ensures shared passwords are tracked and guarded.

## Permissions

There are three permission levels to choose from when sharing secrets with another user or group:

- **View:** User may see all secret data, such as username and password, and metadata, such as permissions, auditing, history, and security settings.

- **Edit:** User may edit the secret data. Also allows users to move the secret to another folder unless the Inherit Permissions from Folder setting is turned on, in which case the user needs Owner permissions to move the secret.

- **List:** User may see the secret in a list, such as a list returned by running a search, but not to view any more details about a secret or edit it.

- **Owner:** User may change all the secret's metadata.

> **Note:** Password text-entry fields are not visible if a secret has a launcher and the Hide Launcher Password setting is on or the user does not have the View Launcher Password role permission.

Secrets can be shared with either groups or individual users. The Secret Sharing section allows secrets to be configured for access.

## Procedure

To add or remove secret sharing:

1. [View the secret](../viewing-secrets/index.md) you want to share.

1. Click the **Sharing** tab.

   ![1556740541839](images/1556740541839.png)

1. Click the **Edit** link. The page becomes editable:

   ![1556740706807](images/1556740706807.png)

1. Click the **Remove** link next to any share you want to delete.

1. Type any user or group you want to share with in the **Add Groups / Users** search text box.

1. When the user or group appears in the dropdown list, click to select it. The user or group appears in the **Shared with** table.

1. Click the unlabeled permission dropdown list box to select the desired permission.

1. Repeat the process for additional users or groups.

1. Click the **Save** button to commit the changes.

You can also modify sharing settings for users or groups that already have sharing enabled for the secret. If a user or group is not displayed, they do not have access to the secret.

To further simplify the sharing process, secrets can automatically inherit the settings from the folder they are stored in. By enabling the **Inherit Permissions from Folder** option on the **Sharing Edit** page, a secret inherits all the parent folder's sharing settings. For more on folder security, see the [Folders](../../../secret-folders/index.md) section.
