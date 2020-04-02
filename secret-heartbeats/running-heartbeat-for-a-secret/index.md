[title]: # (Running Heartbeat for a Secret)
[tags]: # (Heartbeat)
[priority]: # (60)

# Running Heartbeat for a Secret

Heartbeat runs in a background thread to check each secret where it is enabled. If the credential test fails, the secret is flagged as heartbeat failed and out of sync. To avoid locking out the account, heartbeat no longer run on that secret until the secret items are edited by the user. If the machine is determined to be unavailable, the secret is flagged as heartbeat unable to connect and the secret continues to be checked on the heartbeat interval.

To manually use heartbeat to check the credentials, the **Secret View** page has a **Heartbeat Now** button. The button marks the password as heartbeat pending. The background thread processes the secret in the next 10 seconds, and when the page is refreshed the heartbeat status is updated.

> **Note:** Heartbeat does not work on Windows accounts on the server that is running SS. These accounts are flagged with an "Incompatible Host" status.

To run heartbeat for a secret:

1. From **Dashboard**, click the secret you would like to test.
1. Click the **View** button.  The **Last Heartbeat** field of the secret shows the last date and time that Heartbeat ran for this secret. 
1. To run Heartbeat once more, click **Run Heartbeat** at the bottom of the Secret.
1. Monitor the **Last Heartbeat** field to see the updated status. This may take a few seconds to complete.

If you receive any Heartbeat status code aside from Success, you can check the Heartbeat log for details. To view the entry, Go to **Admin \> Remote Password Changing** and then search for the secret name in the **Search** field of the **Heartbeat Log**.
