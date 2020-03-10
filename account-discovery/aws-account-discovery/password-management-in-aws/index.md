[title]: # "Password Management in AWS"
[tags]: # "AMAZON,AWS,IAM,RPC"
[priority]: # "20"

# Password Management in AWS

SS can manage password and access keys for AWS IAM accounts.

## Amazon IAM Keys

Password changing, privileged password changing, and running heartbeats are available for Amazon IAM key secrets. When an Amazon IAM key has its password changed through SS, the new secret key is generated automatically and is not set by user input.

During password changing, you can disable or remove old keys through settings available in the advanced configuration:

- `<add key="ShouldDeletePreviousKey" value="true" />`
- `<add key="ShouldInactivatePreviousKey" value="true" />`

> **Important:**  Altering advanced settings can significantly impact the performance and behavior of SS, so there is no direct link anywhere in SS to the Advanced Settings page. If you need to change any advanced setting (as mentioned in this guide), please contact Thycotic Technical Support. 

## Amazon IAM Console Password

Password changing, and privileged password changing are available for Amazon IAM console password secrets. Due to AWS IAM's restrictions on programmatic integration, this secret type cannot use SS heart beat.

In addition, an Amazon IAM key secret must be associated with an Amazon IAM console password secret for password changing to occur. To associate the two:

1. Create the Amazon IAM console password secret, and an Amazon IAM Key secret for an account that has the permissions to change the console user's password. This can be the console account's own access keys, if the user has permission.
1. Navigate to the RPC tab of the Amazon IAM Console Password.
1. Under **Change Password Using Privileged Account** select **Edit**, and choose the IAM key secret created in the previous step. RPC should now be possible on the console password secret.

## Permissions Required for Secret Key Changes

> **Note:** These permissions are at the most granular level. You can implement broader methods  through wildcard resource restrictions, permission policies, or groups.

Privileged Permissions: (those the AWS account needs to change another users' access keys):

- `iam:DeleteAccessKey` on resource `arn:aws:iam::<account>:user/<otherUserName>`
- `iam:UpdateAccessKey` on resource `arn:aws:iam::<account>:user/<otherUserName>`
- `iam:CreateAccessKey` on resource `arn:aws:iam::<account>:user/<otherUserName>`
- `iam:ListAccessKeys` on resource `arn:aws:iam::<account>:user/<otherUserName>`

Basic Permissions (those the AWS account needs to change its own access keys):

- `iam:DeleteAccessKey` on resource `arn:aws:iam::<account>:user/${aws:username}`
- `iam:UpdateAccessKey` on resource `arn:aws:iam::<account>:user/${aws:username}`
- `iam:CreateAccessKey` on resource `arn:aws:iam::<account>:user/${aws:username}`
- `iam:ListAccessKeys` on resource `arn:aws:iam::<account>:user/${aws:username}`

## Permissions Required for Changing the Amazon IAM Console Password

> **Note:** These permissions are at the most granular level. You can implement broader methods  through wildcard resource restrictions, permission policies, or groups.

The permissions are:

- Privileged Permission: `iam:UpdateLoginProfile` on `resouce arn:aws:iam::account>:user/<otherUserName>`

- Basic Permission: `iam:ChangePassword` on resource `arn:aws:iam::<account>:user/${aws:username}`
