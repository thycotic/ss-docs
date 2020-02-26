[title]: # (Deleting and Undeleting Secrets)
[tags]: # (Secret)
[priority]: # (40)

# Deleting and Undeleting Secrets

To delete a secret:

1. Navigate to the secret **View** page by searching or drilling down the folder tree.

1. Click the **Options** dropdown list and select **Delete**. A confirmation appears.

1. Click the **Confirm Delete Secret** button.

1. The secret is logically deleted and hidden from users who do not have a role containing the View Deleted Secrets permission.

   > SS uses these "soft deletes" to maintain the audit history for all data. However, deleted secrets are still accessible by administrators (like a permanent Recycle Bin) to ensure that audit history is maintained and to support recovery. A user must have the View Deleted Secrets permission in addition to Owner permission on a secret to access the secret View page for a deleted secret. For more information about these permissions, see [Roles](#roles) and [Sharing a Secret](sharing-a-secret).

To undelete a secret, navigate to the secret View page and click **Undelete**.

> **Note:** Secrets can also be deleted in bulk. See [Running Dashboard Bulk Operations](#running-dashboard-bulk-operations).
