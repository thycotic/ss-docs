[title]: # (Enabling AWS Discovery)
[tags]: # (AWS, AccountDiscovery)
[priority]: # (1000)

# Enabling AWS Discovery
$1
$2
   - `iam:ListUsers`
   - `iam:GetLoginProfile`
   - `iam:ListAccessKeys`

   > **Note:** These permissions are limited to the resources the user is allowed to access.
$1
$2$1
$2
   > **Note:** AWS only allows programmatic integration through access keys. This type of secret is required for discovery to work. Discovery must be enabled in SS for this feature to work.
