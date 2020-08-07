[title]: # (Secret-based Credentials for PowerShell Scripts)
[tags]: # (Authentication, Credentials, PowerShell)
[priority]: #

# Secret-based Credentials for PowerShell Scripts

## Overview

You can specify a secret to provide the default credentials for running all PowerShell scripts on a site. This allows sites in  different data centers to have different default credentials. This applies to remote password changing, checkout hooks, and account discovery PowerShell scripts.

> **Note:** If you want a specific secret checkout hook, secret  password changer, or account discovery scanner to use different credentials you can still provide credentials in those areas, which will take precedence over the one set on the site.

## RunAs Secret Precedence

### Remote Password Changing

The precedence order for which RunAs secret to use for remote password changing is:

1. Privileged account on the secret RPC tab

1. Secret site's RunAs secret

1. Secret

### Secret Dependencies

The precedence order for which RunAs secret to use for PowerShell Secret dependencies is:

1. Privileged account on the dependency

1. Run As secret on the dependency group's site

1. Secret site's RunAs secret

1. Secret

### Checkout Hooks

The precedence order for which RunAs secret to use for checkout hooks is:

1. Privileged account on the hook

1. Secret site's RunAs secret

1. Secret

## Procedures

### Setting the Default PowerShell Credential for a Site

To set a default PowerShell credential for a site:

1. Go to **Admin \> Distributed Engines \> Manage Sites**.

1. Select the desired site.

1. Click **Edit**.

1. Click the secret picker link on the **Default PowerShell RunAs Secret** field.

1. Click **Save**.

### Using the Site PowerShell Credentials for Discovery

To use the site PowerShell credentials on a discovery scanner:

1. Add a PowerShell scanner to a discovery source or edit an existing scanner.

1. In the **Edit** dialog for the scanner, click to select the **Use Site RunAs Secret** checkbox.

1. Click **Save**.

   > **Note:** If no RunAs secret is set on the site, you will get an error message when you try to save.