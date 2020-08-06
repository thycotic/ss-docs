[title]: # (Duo Push Notifications)
[tags]: # (Duo, 2FA, MFA)
[priority]: # (1000)

# Duo Push Notifications

Users can now approve secret access requests and workflows using Duo push notifications. The push notification includes information, displayed on the user's screen, that helps the approver make the access decision.

## Prerequisites

To use Duo push notifications:

- Duo must set up for SS. See [Duo Security Authentication](../../authentication/two-factor-authentication/duo-security-authentication/index.md).

- Duo user must be set up for Duo two-factor authentication. See [Setting up Duo (User)](../../authentication/two-factor-authentication/duo-security-authentication/index.md).

- The permission "Approve via DUO" must be granted to a role that is assigned to a group that includes all who will be approving requests via Duo. This allows enough flexibility so that those not wanting Duo push approvals can be configured to not receive them.

## Assigning the Duo Approval Permission

To associate the permission with users:
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
   > **Note:** You can also assign users to the group later. This method is a shortcut when creating a group.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
> **Note:** In addition to having the role you created, the user must be properly set up to receive Duo push notifications. See [Setting up Duo (User)](../../authentication/two-factor-authentication/duo-security-authentication/index.md).

> **Note:**  Any notifications will all be sent out at the same time, and the first response (approve or deny) will be the determinant response. A non-response will not result in either an approve or deny response.
