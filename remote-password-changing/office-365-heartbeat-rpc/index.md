[title]: # (Running Heartbeat and RPC for Office 365 Accounts with a PowerShell Module)
[tags]: # (Remote Password Changing, PowerShell, office 365)
[priority]: # (1000)
[redirect]: # (SSPowerShellModules)

# Running Heartbeat and RPC for Office 365 Accounts with a PowerShell Module

Secret Server supports Office 365 in version 8.8 and later. This does not require the advanced scripting add-on license. To perform heartbeat checks and remote password changes on secrets using the Office 365 password changer for user accounts, follow the steps below:

## Procedure

> **Note:** This applies to both the Secret Server Web server or distributed engines.

1. Run Windows PowerShell as an admin. This opens an elevated Windows PowerShell command prompt.

1. Run this command: `Install-Module -Name AzureAD`.

1. Recycle the application pool.

> **Note:** These steps are required once on the subject computer, not every time you connect. However, you may want to update the module periodically as a security best practice using the command: `Update-Module -Name AzureAD`

## Troubleshooting

1. Uninstall AzureAD using command `remove-module AzureAD`.

1. Reinstall using the above procedure.

1. Ensure the Secret Server application pool setting *Load User Profile* is set to "True".

1. Recycle the application pool.