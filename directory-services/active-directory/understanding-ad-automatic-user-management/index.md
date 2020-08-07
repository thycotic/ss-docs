[title]: # (Understanding Active Directory Automatic User Management)
[tags]: # (Active Directory)
[priority]: # (1000)

# Understanding Active Directory Automatic User Management

## Overview

When Active Directory (AD) Sync is run with the "User status mirrors Active Directory (Automatic)" option, it creates groups and users in SS to mirror the organization's configured AD groups and users. A Secret Server user is created or enabled for every enabled AD user in the selected groups.

Thus, every enabled AD user in every synched group consumes a SS license, whether or not they use Secret Server. As a result, an organization can end up paying for far more SS licenses than they need.

AD Automatic User Management addresses this issue by automatically disabling the accounts of users who have not logged in to SS in a specified number of months. This saves unnecessary licensing costs as inactive users do not count against the number of user licenses required by SS.

You can configure the setting on the Edit Active Directory Configuration page. See [Configuring Active Directory](../configuring-active-directory/index.md) There is a checkbox to enable or disable the feature and a textbox to set the number of months before a user is auto-disabled. The default is three, but you can set it from one to 12.

Newly-added users remain enabled until the first synchronization after the configured number of months have passed. When a user whose account has been disabled by this feature attempts to log in they automatically have their account enabled, provided there are licenses available.

## Examples

### Example One

1. Maria joined the company today.

1. The next AD synchronization creates a SS account for Maria.

1. Maria never logs in to SS because she does not need it for her job.

1. Once the defined number of months have passed, the next AD synchronization disables Maria's SS account.

1. The SS license used by Maria's account becomes available for use.

### Example Two

1. Joe gets added to SS but never logs in.

1. The defined number of months later, Automatic User Management disables his account, freeing his license.

1. Joe gets promoted to a job that requires SS.

1. Joe logs into SS.

1. His account is automatically re-enabled, and he now takes up a license.

1. Joe gets demoted to his old job, which does not require SS.

1. A defined number of months later, Automatic User Management disables his account, and the license is freed up once again.

1. Joe has no idea any of this has happened—the automated process is hidden from him.

### Example Three

1. Rupert logs in to SS several times per month.

1. The defined number of months for Automatic User Management to disable his account is never reached.

1. Rupert's account stays current and his license remains his. The entire process is invisible to Rupert.
