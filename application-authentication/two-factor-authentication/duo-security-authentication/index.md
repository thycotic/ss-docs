[title]: # (Duo Security Authentication)
[tags]: # (2FA)
[priority]: # (10)

# Duo Security Authentication

> **Note:** Using this method of two-factor authentication requires that you have an active account for Duo Security.

> **Note:** SS supports using Duo Security as a second factor of authentication. See below for setup instructions:

## Enabling Duo (Admin)

1. From the **Admin** menu, select **Configuration**.

1. Click the **Login** tab, and then click **Edit**.

1. Select the **Enable Duo Integration** check box.

1. Enter the **API Hostname**, **Integration Key**, and **Secret Key** values (obtain these by logging into your account at duosecurity.com). See [Configuring Duo for Two-Factor Authentication](https://thycotic.force.com/support/s/article/Configuring-Duo-for-Two-Factor) for details.

1. Click **Save**.

1. See **User Setup of Duo Two-Factor Authentication** for further details on the procedure that the user follows.

## Setting up Duo (User)

1. Log into SS.

1. After successful authentication, a new screen appears with the option to select a method to authenticate with.

1. Select one of the options (**Duo Push**, **Send SMS**, or **Phone)**, depending on your setup with Duo) and complete the selected authentication process to log in.
