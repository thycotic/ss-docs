[title]: # (User Teams)
[tags]: # (Teams)
[priority]: # (1000)

# User Teams

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

## What Are Secret Server Teams for?

With SS teams, administrators can create special groups called _teams_ to restrict what users can see. A team bundles users and groups to assign them the same rules as to what other users and sites are visible to them. For example, a managed service provider could isolate their customers from seeing other customer's user accounts or a large company could "firewall" their users by department. Site visibility can also be restricted by teams.

> **Note:** Teams are designed for shared secrets and do not apply to SS administration as a whole.

> **Note:** Users *without* any team-related permissions are subject to team restrictions. The Unrestricted by Teams permission must be present to remove them. That is why the User role comes with that permission by default.  See [Team-Related Permissions](#team-related-permissions).

> **Note:** Team restrictions are designed for regular users so granting additional  administrative permissions can override the restriction. This applies to group owners, so if a user is assigned as a group owner, that user will be able to see all users when assigning members.

## Team-Related Permissions

Team visibility and management are controlled by user roles. Those roles, and by extension users, are governed by the following team-related role permissions:

- **Administer Teams:** Users can create, edit, and view all teams.
- **No Teams-related Permissions:** Users can only view other users within their team.
- **Unrestricted by Teams:** Users can view all users, groups, and sites, regardless of Team affiliation. Essentially, teams do not exist for the users with this permission, and the Teams page is not available to them. The default user role has this permission.
- **View Teams:** Users can view all teams. This is essentially a read-only Administer Teams.
