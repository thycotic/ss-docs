[title]: # (BMC Remedy Error Messages)
[tags]: # (BMC Remedy,errors)
[priority]: # (1000)

# BMC Remedy Error Messages

When Secret Server calls the BMC Remedy SOAP-based web services, there are times that BMC will only return a 500 error without any details of the exception. You can see the details of this exception from the BMC Remedy server logs as described below:

1. Log on BMC Remedy as a user with access to the administrative console.

1. Navigate to **AR System Administration** from the main menu.

1. Navigate to **System \> General \> Service Information**.

1. Click the **Log Files** tab.

1. Click to enable the **API Log** check box.

1. Click the **Apply** button.

1. Once enabled, you can click **View** from this window to see the log or navigate to the mid-tier server’s file system at the location specified. Details of the SOAP web service exception are written to the log file including a stack trace.