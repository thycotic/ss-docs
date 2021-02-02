[title]: # (Enabling AWS Discovery)
[tags]: # (AWS, AccountDiscovery)
[priority]: # (1000)

# Enabling AWS Discovery

1. For SS to communicate with AWS, users with sufficient privileges need to create an access key for their account in AWS Identity and Access Management (IAM). The account used to do this requires the following permissions to discover users and access keys:

   - `iam:ListUsers`

   - `iam:GetLoginProfile`

   - `iam:ListAccessKeys`

   > **Note:** These permissions are limited to the resources the user is allowed to access.

1. Once this access key is created, use the access key and secret key to create a secret in SS using the Amazon IAM key template.

1. Create a new AWS discovery source and use the Amazon IAM key as the credentials secret for that discovery source.

   > **Note:** AWS only allows programmatic integration through access keys. This type of secret is required for discovery to work. Discovery must be enabled in SS for this feature to work.
