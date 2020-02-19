[title]: # (Duo Push Notifications)
[tags]: # (Duo)
[priority]: # (20)

# Duo Push Notifications

Users can now approve secret access requests and workflows using Duo push notifications. The push notification includes information, displayed on the user's screen, that helps the approver make the access decision.

## Prerequisites

To use Duo push notifications:

- Duo must set up for SS. See [Duo Security Authentication](../../application-authentication/two-factor-authentication/duo-security-authentication/index.md).

- Duo user must be set up for Duo two-factor authentication. See [Setting up Duo (User)](../../application-authentication/two-factor-authentication/duo-security-authentication/index.md).

- The permission "Approve via DUO" must be granted to a role that is assigned to a group that includes all who will be approving requests via Duo. This allows enough flexibility so that those not wanting Duo push approvals can be configured to not receive them.

## Assigning the Duo Approval Permission

To associate the permission with users:

1. Go to **Admin \> Roles**.

1. Click the **Create New** button to create a new role. Name it "Duo Push Approver" or another name of your choosing.

1. Assign the **Approve Via DUO Push** permission to the new role.

1. Click the **Save** button.

1. If you choose to create a separate group for approvers, do this by navigating to **Admin \> Groups**.

1. Click the **Create New** button to create a new group.

1. Add the desired users (chosen approvers) to that group.

   > **Note:** You can also assign users to the group later. This method is a shortcut when creating a group.

1. Click the **Save** button.

1. Go to **Admin \> Roles**.

1. Click the **Assign Roles** button. The View Role Assignment page appears.

1. Click the **Role** dropdown list to select the role you created. Note that there are no groups or users.

1. Click the **Edit** button. The Role Assignment page appears.

1. Assign the **Approve via DUO Push** role to the **Assigned** list box.

1. Click the **Save Changes** button. Setup is now complete.

> **Note:** In addition to having the role you created, the user must be properly set up to receive Duo push notifications. See [Setting up Duo (User)](#setting-up-duo-(user)).

> **Note:**  Any notifications will all be sent out at the same time, and the first response (approve or deny) will be the determinant response. A non-response will not result in either an approve or deny response.
