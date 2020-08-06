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
$1
$2$1
$2$1
$2
### Secret Dependencies

The precedence order for which RunAs secret to use for PowerShell Secret dependencies is:
$1
$2$1
$2$1
$2$1
$2
### Checkout Hooks

The precedence order for which RunAs secret to use for checkout hooks is:
$1
$2$1
$2$1
$2
## Procedures

### Setting the Default PowerShell Credential for a Site

To set a default PowerShell credential for a site:
$1
$2$1
$2$1
$2$1
$2$1
$2
### Using the Site PowerShell Credentials for Discovery

To use the site PowerShell credentials on a discovery scanner:
$1
$2$1
$2$1
$2
   > **Note:** If no RunAs secret is set on the site, you will get an error message when you try to save.