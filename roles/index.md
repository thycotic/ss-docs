[title]: # (Roles)
[tags]: # (Roles)
[priority]: # (1000)

# Roles

> **Note:** Please click the table of contents on the left to see any sub-pages to this one.

Modeled after the role-based access control (RBAC) mechanism, role-based security (RBS) is SS's method of regulating permission to system access. Each user and group must be assigned to a role. SS ships with three roles: Administrator, User, and Read-Only User. Each role contains various permissions to match the job function of the user. With RBS, strict granular access to SS is ensured. A list of role permissions and their descriptions can be found in the [Secret Server Role Permissions List](role-permission-list/index.md).

You can assign multiple permissions to a role. For example, you could assign Administer Users, Edit Secret, Own Secret, and View Active Directory permissions to a role. That role can then be assigned to a user or group.

> **Note:** The Unlimited Administrator permission allows the user to have unlimited administrator rights when Unlimited Administrator is enabled in the configuration. By default, it is disabled.

> **Note:** to see the built-in roles and what permissions they possess, click the desired role link on the Admin \> Roles page. 