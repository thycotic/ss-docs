[title]: # (Understanding Expiration, Auto Change and Auto Change Schedules)
[tags]: # (Automatic Remote Password Changing, secret expiration, auto change, auto change schedules)
[priority]: # (1000)

# Understanding Expiration, Auto Change and Auto Change Schedules

## Definition

What is the difference between expiration, auto change and auto change schedules?

- **Expiration**: sets whether or not a secret in SS is marked as expired and the period SS counts down before marking the secret as expired.
- **Auto Change**: sets SS to automatically initiate a password change after a secret expires.

- **Auto Change Schedule**: sets the day and time to initiate the password change after the secret has expired. This cannot be configured without also enabling Auto Change.

## Examples

Some examples to illustrate this:

### Scenario One: Expiration with Auto Change and No Auto Change Schedule

- A Secret has an expiration period of 30 days, and auto change is enabled. No auto change Schedule has been set.
- At the end of the 30-day expiration period, the secret will expire.

- Immediately after the secret expires, it will be queued for a password change.
- Once the password has been changed, the secret is no longer marked as expired and expiration is reset to count down again from 30 days.

### Scenario Two: Expiration with Weekly Auto Change

- A secret has an expiration period of 30 days, auto change is enabled, and an auto change schedule is configured for Weekly, recurring once a week on on Tuesday, changing at 0300.
- At the end of the 30-day expiration period, the secret will expire.

- Immediately after the secret expires, SS will comply with the auto change schedule to determine when a password change occurs.
- The secret is queued for a password change as soon as it becomes 0300 on a Tuesday.

- Once the password is changed, the secret is no longer marked as expired. Expiration is reset to count down again from 30 days.

### Scenario Three: Expiration with No Auto Change

- A Secret has an expiration period of 30 days, and auto change is not enabled.
- At the end of the 30-day expiration period, the secret expires.

- The secret remains expired until the field it applies to (usually the password field) is updated on the secret. This happens by manually updating the field or by using the "Change Password Remotely" button on the Remote Password Changing tab of the secret.
- Once the password is changed, the secret is no longer be marked expired, and expiration is reset to count down again from 30 days.

## Important Considerations and Best Practices

- If you want to rely strictly on expiration for password changing, enable auto change but set the schedule to none. Leave “Only change password when Secret is expired” checked.
- If you want to set an auto change schedule to run daily at a specific time, the change will only happen at maximum once per day at that given time. If a change happens already within that same day for the same secret, you cannot adjust the auto change schedule to run later within the same day and then have a password change occur again within that same 24-hour period.  For example, if the password was already changed earlier in the day. The schedule is then adjusted to run a few minutes later within the same day. In that case, another password change will not occur until 24 hours has passed since the last change.

- If you set the auto-change schedule to run once per week, for example, on a Thursday, and “Only change password when secret is expired” is checked. Even if the secret expires on a Monday, a password change would not occur until the secret has expired and the scheduled time on Thursday has passed.
- If you set the auto change schedule to run once per week on a Thursday and “only change password when Secret is expired” is not checked, the password would be changed every Thursday, regardless of the secret’s expiration status.

- If a secret has an expiration period but auto change is not enabled, no password change occurs automatically. The expiration would only update when the password is manually updated or a remote password change is manually triggered through SS.
- If you want to change a password more frequently than once per day, we recommend using some of the advanced security features at the secret level or controlling the change through a secret policy. Use the check out feature combined with “Change Password on Check In” on the Security tab of a Secret. You can specify a custom interval to check out the secret.  After the password check out interval expires or a user manually checks in the secret, the password is automatically changed.

> **Important:** For the configuration above, ensure that these accounts have a password-related group policy in Active Directory that specifies that the “Minimum Password Age” is set to 0. We recommend creating fine-grained password policies to achieve this. Add all the accounts that need rotation more frequently than once per day to an AD security group assigned to the fine-grained password policy. See [Step-by-Step: Enabling and Using Fine-Grained Password Policies in AD](https://docs.microsoft.com/en-us/archive/blogs/canitpro/step-by-step-enabling-and-using-fine-grained-password-policies-in-ad) for more information.