[title]: # (Maintenance Mode FAQ)
[tags]: # (Administration, Maintenance mode)
[priority]: # (1000)

# Maintenance Mode FAQ

## What is Maintenance Mode?

 Maintenance mode prevents users from changing secrets or secret-related data such as dependencies, secret templates, and password requirements.

##   Why do we need Maintenance Mode?

When secret key rotation takes place, or the HSM configuration is changed, SS needs to ensure that no data corruption occurs.  To mitigate this, these operations turn on maintenance mode, which puts Secret Server into read-only mode. We also recommend manually enabling maintenance mode before performing upgrades.

## Can I still access my Secrets when Maintenance Mode is turned on?

Yes.  Secrets will be read-only, but you can still view them, including secrets that are double-locked or protected by "require approval for access."  You are unable to change the checkout status of a secret during maintenance mode.  This means if the secret is currently checked-in, you will be unable to check it out.  If the secret is currently checked out, it cannot be checked in until the system leaves maintenance mode.

## How long does Maintenance Mode last?

Maintenance mode lasts until the operation triggering it is completed. The time required will vary based on the operation and the number of secrets in the system.  Typically, maintenance mode lasts less than 30 minutes.
