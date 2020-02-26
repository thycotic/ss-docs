[title]: # (CEF and SIEM Integration)
[tags]: # (CEF and SIEM)
[priority]: # (20)

# CEF and SIEM Integration

SS can log to a Comment Event Format (CEF) or Syslog listener. When this is configured, all event engine events and important system log entries are sent to the CEF or Syslog server that is entered in the configuration. The written events contain data such as user information, time, IP address, and any other important details about the event.

## Configuring CEF

1. To configure CEF:

1. Navigate to Administration > Configuration.

1. Click the **Edit** button.

1. Check the **Enable Syslog/CEF Logging** check box. When you do this, three additional text boxes or lists appear:

   - **Syslog/CEF Server:** IP address or name of the server.

   - **Syslog/CEF Protocol:** Either UDP or TCP, the protocol used by your server.

   - **Syslog/CEF Port:** Server port for sent events.

1. Complete or configure those controls.

1. Click **Save**.

## Testing CEF

After enabling CEF, your server should start to receive messages right away if you entered the data correctly. In order to force an event to happen, perform a log out and then log back in. If the event does not appear on your CEF server soon after, there is something wrong with your configuration.
