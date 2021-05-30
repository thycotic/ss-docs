[title]: # (Adding, Activating, and Deleting Licenses)
[tags]: # (license,add,delete,activate,activation)
[priority]: # (1000)

# Adding, Activating, and Deleting Licenses

This section explains how to add Secret Server licenses online and offline, how to activate and delete licenses, and how to convert from a trial license

## Adding Secret Server Licenses

1. Log on to Secret Server as an administrator.

1. Go to **Admin \> Licenses**.

1. In the **Licenses** dialog, click **Install New License**.

1. In the **License Edit** dialog, enter your **License Name** and **License Key**.

1. Click **Save**.

1. If you have another license to add, click **Add Another License**.

1. If you have finished adding your licenses, click **License Activation**.

## Activating Secret Server Licenses

All non-evaluation licenses require activation after install. Activation is per license and Web server combination. Therefore, if you bring up a new Web server, it needs activation, even if your previous Web server was already activated. After installing each license, you are prompted to activate. Follow the on-screen prompts for online or offline activation. The activation process gathers the name, email, and phone number of the individual activating for internal purposes only. No other personal information is be sent to Thycotic.

1. When you have finished adding your licenses, click **License Activation**.

1. Enter your name, email address, and phone number. This information is sent to Thycotic and is stored for internal Thycotic purposes only.

1. If your server has outbound network access

1. If your server has no outbound network access, click **Activate Offline**. Yes, there is an offline option for activating licenses. (See the Demo movie above for the offline process - also note the *offline=true* option described below if you have trouble activating offline)

Your activation is complete.  

Secret Server may be activated on an Airgap Network for both trials and licensed products. Please let your Account Manager know you will be using Secret Server on an Airgap network for more information.

If you receive an error message, please take note of the error code and call the phone number contained in the message.

If an error message persists after successful activation, remove expired/invalid licenses from Secret Server by following the steps below, under **Deleting Secret Server Licenses**.

If you need help and your Secret Server has a current support license for each user license, please [contact out technical support team](http://thycotic.com/products/secret-server/support-2/).

> **Note:**  For more information, see the [Licensing](../../licensing/index.md) and [License Activation FAQ](../licensing-faq/index.md) pages

## Converting from Evaluation Licenses

If you had evaluation licenses initially but you recently purchased Secret Server, you need to remove all evaluation licenses before you install your purchased licenses. Follow the steps below, under **Deleting Secret Server Licenses**.

## Deleting Secret Server Licenses

1. Log on to Secret Server as an administrator.

1. Go to **Admin \> Licenses**.

1. In the **Licenses** dialog, click the **License Name** of the license you want to remove.

1. Click **Delete**. The license information will remain available to you from your account at [my.thycotic.com](http://my.thycotic.com).

1. Click **OK**.

1. Verify that the selected license key has been removed from the list.
