[title]: # (Load User Profile Setting Must Be Enabled for Application Pool)
[tags]: # (troubleshooting, workaround, IIS, load user profile setting)
[priority]: # (1000)

# Application Pool Load User Profile Setting Must Be Enabled

Secret Server (SS) requires the application pool to have the “load user profile” setting enabled. Secret Server will report a critical alert to notify admins if this setting is not enabled.

> **Note:** The site will load to give access to secrets but many internal operations will not function correctly so we recommend fixing the issue as soon as possible.

> **Note:** This applies to version 10.2 and later.

Steps to enable the "load user profile” setting:

1. On each Web server that is running Secret Sever, open IIS Manager.

1. Under the **Application Pool** node on the left, select **Secret Server**.

1. On the right-hand panel, select **Advanced Settings** to get to the full properties.

1. Scroll to the **Load User Profile** setting in the **Process Model** section.

1. Set **Load User Profile** to **True**.

1. Click the **OK** button.

1. Preform an `iisreset` on the server:

   1. Open a Windows command prompt as an administrator.

   1. Type `iisreset`.

   1. Press the **\<Enter\>** key.
