[title]: # (Folder Permissions)
[tags]: # (XXX)
[priority]: # (10)

# Folder Permissions

If the new folder is a subfolder, you can have it use the sharing settings of its parent folder by enabling the Inherit Permissions from Parent setting for the folder.

Folders can apply one the following permissions to users or groups in the folder's Permissions table:

- **View:** Allows the user to see the folder and secrets in that folder that are inheriting permissions from their folder.

- **Edit:** Allows the user to create new folders in that folder, which forces the "Inherit Permissions from Parent" permission on the new folder, move secrets into that folder, and add new secrets into that folder.

- **Add Secret:** Allows the user to add a secret in that folder. Does not grant access to the added secret.

- **Owner:** Allows the user to create new folders in that folder without forcing inheritance, move the folder, delete the folder, rename the folder, and change the permissions and inheritance settings on the folder.

Depending on your configuration, these settings could affect the permissions of subfolders and secrets contained in this folder. Folders are not visible to users that do not have at least View permission. This allows users to create and manage their own folders without making them visible to all users.

### Personal Folders

In SS, a _personal folder_ is a folder that one (and only one) individual has owner access to. No user can modify sharing permissions on these folders. A user cannot add subfolders to their personal folder. The purpose of this folder is to allow a user to securely store work-related secrets that other users do not require access to. Note that when in break-the-glass mode, an unlimited admin can access a user's personal folder in order to recover secrets if needed.

### Required Role Permissions for Managing Folders

Folder management is subject to these role permissions:

- The Administer Folders role permission allows a user to create new folders and manage folders, but specific folder permissions still apply.

- Any user with the Administer Folders role permission can create new folders; however, to create folders at the root level, the user also needs the Create Root Folders permission. They also can add new folders to any folders where they have Edit or Owner permission on that folder.

- They must have Owner permission to delete a folder.

- Users can also move folders where they have Owner permission on the source folder and Edit or Owner permission on the target folder (where they are moving it). The folder automatically inherits Permissions from its parent when it is moved, which is the same as when secrets are moved.
