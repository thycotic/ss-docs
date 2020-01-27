[title]: # (Event List)
[tags]: # (XXX)
[priority]: # (40)

# Event List

The following events are available:

**Table:** Folder Events

| Event                | Scope                                |
| -------------------- | ------------------------------------ |
| Create               | All, In this Folder                  |
| Delete               | All, For this Folder, In this Folder |
| Edit Permissions     | All, For this Folder, In this Folder |
| Secret Policy Change | All, For this Folder, In this Folder |

**Table:** Secret Events

| Event                                          | Scope                                |
| ---------------------------------------------- | ------------------------------------ |
| Access Approved                                | All, For this Secret, In this Folder |
| Access Denied                                  | All, For this Secret, In this Folder |
| Cache View                                     | All, For this Secret, In this Folder |
| Check In                                       | All, For this Secret, In this Folder |
| Check Out                                      | All, For this Secret, In this Folder |
| Copy                                           | All, For this Secret, In this Folder |
| Create                                         | All, In this Folder                  |
| Custom Audit                                   | All, For this Secret, In this Folder |
| Custom Password Requirement Added to Field     | All, For this Secret, In this Folder |
| Custom Password Requirement Removed from Field | All, For this Secret, In this Folder |
| Delete                                         | All, For this Secret, In this Folder |
| Dependency Added                               | All, For this Secret, In this Folder |
| Dependency Deleted                             | All, For this Secret, In this Folder |
| Dependency Failure                             | All, For this Secret, In this Folder |
| Edit                                           | All, For this Secret, In this Folder |
| Expired Today                                  | All, For this Secret, In this Folder |
| Expires in 1 Day                               | All, For this Secret, In this Folder |
| Expires in 3 Days                              | All, For this Secret, In this Folder |
| Expires in 7 Days                              | All, For this Secret, In this Folder |
| Expires in 15 Days                             | All, For this Secret, In this Folder |
| Expires in 30 Days                             | All, For this Secret, In this Folder |
| Expires in 45 Days                             | All, For this Secret, In this Folder |
| Expires in 60 Days                             | All, For this Secret, In this Folder |
| Export                                         | All, For this Secret, In this Folder |
| File Save                                      | All, For this Secret, In this Folder |
| Heartbeat Failure                              | All, For this Secret, In this Folder |
| Heartbeat Success                              | All, For this Secret, In this Folder |
| Hook Create                                    | All, For this Secret, In this Folder |
| Hook Delete                                    | All, For this Secret, In this Folder |
| Hook Edit                                      | All, For this Secret, In this Folder |
| Hook Failure                                   | All, For this Secret, In this Folder |
| Hook Success                                   | All, For this Secret, In this Folder |
| Launch                                         | All, For this Secret, In this Folder |
| Password Change Maximum Attempts Reached       | All, For this Secret, In this Folder |
| Password Copied to Clipboard                   | All, For this Secret, In this Folder |
| Password Displayed                             | All, For this Secret, In this Folder |
| Password Change                                | All, For this Secret, In this Folder |
| Secret Policy Change                           | All, For this Secret, In this Folder |
| Session Recording View                         | All, For this Secret, In this Folder |
| Undelete                                       | All, For this Secret, In this Folder |
| View                                           | All, For this Secret, In this Folder |
| View Secret Edit                               | All, For this Secret, In this Folder |
| Web Password Fill                              | All, For this Secret, In this Folder |

**Table:** User Events

| Event              | Scope                              |
| ------------------ | ---------------------------------- |
| Added to Group     | All, For this User, For this Group |
| Challenge Applied  | All, For this User                 |
| Challenge Cleared  | All, For this User                 |
| Create             | -                                  |
| Disabled           | All, For this User                 |
| Edit               | All, For this User                 |
| Enable             | All, For this User                 |
| Lockout            | All, For this User                 |
| Login              | All, For this User                 |
| Login Failure      | All, For this User                 |
| Logout             | All, For this User                 |
| Owners Modified    | All, For this User                 |
| Password Change    | All, For this User                 |
| Removed From Group | All, For this User, For this Group |
| Two Factor Changed | All, For this User                 |

**Table:** Other Events

| **Entity**                                  | Event                                                        |
| ------------------------------------------- | ------------------------------------------------------------ |
| Configuration                               | Edit                                                         |
| Dual Controls                               | Create, Delete, Edit                                         |
| Encryption                                  | HSM Disable, HSM Enable, Rotate Secret Keys, Rotate Secret  Keys Cancel Requested, Rotate Secret Keys Failure, Rotate Secret Keys Success |
| Engine                                      | Engine Activated, Create, Deactivate, Delete, Offline, Online |
| Export Secrets                              | Exported                                                     |
| Group                                       | Owner Modified                                               |
| Import Secrets                              | Imported                                                     |
| IP Address Range                            | Create, Delete, Group Assigned, Group Unassigned, Edit,  User Assigned, User Unassigned |
| Licenses                                    | Expires in 30 Days                                           |
| Role                                        | Assigned User or Group, Create, Edit, Role Disabled,  Role Enabled, Unassigned User or Group |
| Role Permission                             | Added to Role, Removed From Role                             |
| Script - PowerShell                         | Create, Deactivate, Edit, Reactivate, View                   |
| Script - SQL                                | Create, Deactivate, Edit, Reactivate, View                   |
| Script - SSH                                | Create, Deactivate, Edit, Reactivate, View                   |
| Secret Policy                               | Create, Edit                                                 |
| Secret Template                             | Create, Create Secret Access Changed, Edit, Field  Encrypted, Field Exposed, Owners Modified, Copy |
| Privileged Behavior Analytics Configuration | Edit                                                         |
| Site                                        | Engine Added, Domain Assigned to Site, Create, Disable,  Edit, Enable, Engine Downloaded, Engine Offline, Engine Online, Domain  Removed from Site, Engine Removed |
| Site Connector                              | Create, Credential View, Disable, Edit, Enable               |
| Unlimited Administrator                     | Disable, Enable                                              |
| User Audit                                  | Expire Now                                                   |
