[title]: # (Setting up Access Requests for Secrets)
[tags]: # (Access Requests)
[priority]: # (40)

# Setting up Access Requests for Secrets

To enable Access Request for a secret, navigate to the **Secret View** page for the secret:

1. Go into the **Security** tab and click the **Edit** button.
1. Check the **Enable Requires Approval for Access** checkbox to enable the setting. 
1. Once enabled, select users or groups as approvers for the secret. Unless the **Owners and Approvers also Require Approval** option is turned on, owners or users that are members of the Approvers group do not need to request access to view the secret.

> **Note:** Users need at least view access to the secret to be able to access the secret even with **Access Request** enabled. If the users do not have view permission they are unable to find the secret with Search or Browse.

> **Note:** The email configuration settings need setting up, including valid email addresses, for the users in the approval group for emailing to work.
