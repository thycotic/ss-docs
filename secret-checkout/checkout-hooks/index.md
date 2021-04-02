[title]: # (Checkout Hooks)
[tags]: # (Checkout Hooks)
[priority]: # (1000)

# Checkout Hooks

## Overview

In addition to changing the password on check in, secret owners can also specify administrator-created PowerShell scripts, called _hooks_, to run before or after checkout and check in. These are accessed from the **Hooks** tab of the secret, which only shows if checkout is enabled and PowerShell scripts have been created by an admin.

To specify a before- or after-checkout hook, click **Create New Hook** and specify the following settings:

- **Before/After:** Whether the PowerShell script should run before or after the event action.
- **Event Action:** The hook runs at either check in or checkout.
- **Name:** A descriptive name for the hook.
- **Event Action:** The hook runs at either check in or checkout.
- **PowerShell Script:** Administrator-created PowerShell script to run.
- **Event Action:** The hook runs at either check in or checkout.
- **Stop on Failure:** If enabled, SS prevents the event action if the script returns an error. For example, if "Stop on Failure" is selected for a checkout action, then SS prevents the user from checking out the secret if the script fails.
- **Privileged Account:** If needed, the script can run as another secret's identity.

## Checkout User Variables for Scripts

Checkout user variables for scripts are special code variables that return information about the user or automated task making the checkout request, rather than system or secret information. For example, the `$USERNAME` variable returns one or more user IDs related to a specific secret, whereas the `$SECRETSERVERUSERID` checkout user variable returns the user ID of the logged-on user or automated task.

> **Note:** These variables may also be useful for Active-Directory-related scripts.

The variables are:

**Table:** Checkout User Variables for Scripts:

| Variable                    | User Action Returns            | Automated Task Returns |
| --------------------------- | ------------------------------ | ---------------------- |
| `$SECRETSERVERUSERID`       | Logged-on user's ID            | -1                     |
| `$SECRETSERVERUSERNAME`     | Logged-on user's name          | "System"               |
| `$SECRETSERVERDISPLAYNAME`  | Logged-on user's display name  | "System"               |
| `$SECRETSERVEREMAILADDRESS` | Logged-on user's email address | Empty string           |

[]()

> **Note:** You can find the regular "system" variables in the [Editing Custom Commands](../../remote-password-changing/custom-password-changers/editing-custom-commands/index.md) subsection of the Custom Password Changers section.
