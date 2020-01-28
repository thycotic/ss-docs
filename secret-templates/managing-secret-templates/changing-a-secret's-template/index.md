[title]: # (Changing a Secret's Template)
[tags]: # (XXX)
[priority]: # (40)

# Changing a Secret's Template

To convert secrets from one secret template to another:

1. View a secret and click on the **Convert Template** button.

1. Click to select the target template from the **Secret Template** list.

1. Map each text-entry field to a new field: 

   1. Go through each list and select the target text-entry field for each source text-entry field on your secret.

   1. If you want to remove the value for a text-entry field instead of converting it, then select the `<Remove>` option on the list for that text-entry field.

   1. When you are done selecting, you can choose a folder.

1. Click **Save**.

The Convert Template button is only available to users and groups with the "Owner" permission to the secret.

> **Note:** To preserve audit data, when a secret is converted from one type to another, the old secret is deleted, and a new secret is created. An admin can view old secret by searching for deleted secrets on the dashboard. A user needs "Add Secret," "Edit Secret," "Delete Secret," and "Own Secret" role permissions in order to convert a secret to a new template.
