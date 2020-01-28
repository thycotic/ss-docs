[title]: # (Modifying Folders with Secret Policies)
[tags]: # (XXX)
[priority]: # (60)

# Modifying Folders with Secret Policies

You can configure secret policies to apply RPC and security settings to an entire folder of secrets. 

To create a new secret policy:

1. Click **Admin \> Secret Policy**. A Secret Policy page appears:

   ![1557158189203](assets/1557158189203.png)

1. Click the **Create New** button. The (new) Secret Policy page appears:

   ![1557158522564](assets/1557158522564.png)

1. Type a name for the new secret policy in the **Secret Policy Name** text box.

1. Click the Setting dropdown list, and choose the policy's settings for each relevant section. Aside from `< Not Set >`, which means that the setting is not applied, there are two options:

   - **Default:** The policy is applied to all secrets in the folder initially, but it **is** possible to manually change the applied secret settings as well.

   - **Enforced:** The policy is applied to all secrets in the folder initially, and it **is not** possible to change those applied settings on secrets in that folder.

1. Click to select the **Value** check box in that row to apply the setting. Applying the setting may enable configuration of related settings in the grid. For example, enabling Auto Change causes the Auto Change Schedule to be available for configuration:

   ![1557158990439](assets/1557158990439.png)

1. Click the **Save** button to make the policy available for assignment to folders. 

   > **Note:** To deactivate a policy that you no longer want, edit the policy and deselect the **Active** check box. For information about applying a secret policy to a folder, see [Editing Folder Permissions](#editing-folder-permissions).
