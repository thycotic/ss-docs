[title]: # (Troubleshooting Heartbeat and RPC Connection Errors for Linux Secrets)
[tags]: # (troubleshooting, workaround, rpc, heartbeat)
[priority]: # (1000)

# Troubleshooting Heartbeat and RPC Connection Errors for Linux Secrets

 When creating custom SSH secret templates in Secret Server (SS), you may run into this error:

`Connection Failed - Connection lost (error code is 10058)` 

Please follow these steps to address that. You start with heartbeat and then address Remote Password Changing (RPC). 

> **Note:** See [Troubleshooting SSH Issues](../ssh-issues/index.md) for other SSH issues.

## Step 1: Troubleshooting Heartbeat

To determine if the heartbeat issue is outside of SS: 

1. Go to the errant secret in SS. 

1. Check that secret’s site. If the secret is using the "local” site, you should test the application servers. If this secret is using a different site, such as a distributed engine (DE), then test on that machine.

2. [Download PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) on the application or any of the DE servers. 

2. Return to the secret on SS.

2. Click the **Remote Password Changing** tab of the secret. 

2. Check to see if the secret is run by an associated secret:

   ![img](images/clip_image003.jpg)

   This tells you the associated privileged account. 

1. Log on that account to sudo to root.

1. Return to the local server or the DE.

2. Open PuTTY.

3. Type the IP of the subject Linux machine.

4. Log on the privileged account.

5. Sudo to root.
6. If you cannot log on, you could have a permissions, networking, or firewall issue that your team will need to address.

## Step 2: Troubleshoot RPC 

To determine if the RPC issue is outside of SS: 

1. Go to the errant secret in SS. 

1. Check that secret’s site. If the secret is using the "local” site, you should test the application servers. If this secret is using a different site, such as a distributed engine (DE), then test on that machine.

1. Open PowerShell to test the connection from the application or DE to the subject machine.

1. Test the SSH TCP port:

   `Test-NetConnection -ComputerName -Port 22`

1. Test the Telnet TCP port:

   `Test-NetConnection -ComputerName -Port 23`

1. [Download PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) on the application or any of the DE servers. 

1. Return to the secret.

1. Click the **Remote Password Changing** tab to determine the account responsible for running the custom password changer:

   ![img](images/clip_image004.jpg)

1. Determine the password type for the template:

   1. Go to **Admin > Secret Templates**.

   1. Click the desired template.

   1. Click **Edit > Configure Password Changing > Password Type to Use**. 

   1. Note the type of password.

1. Determine the applicable custom RPC commands:

   1. Go to **Admin > Remote Password Changing > Configure Password Changers**.

   1. Click the same password changer. On the left side, you see heartbeat commands under **Verify Password Changed Commands**. On the right side, you see RPC commands under **Password Change Commands**. These commands are needed shortly.

1. Return the SS or DE server.

1. Launch PuTTY.

1. Type the IP address of the subject Linux machine.

1. Log on as root, or if you have an associate secret on the SSH secret, use it to log on.

1. Use the RPC commands noted earlier in PuTTY to determine if they work outside of SS. If they do not work, contact your team to address the connectivity issue.

1. Once the issue is fixed (the amended commands work in PuTTY), return to SS.

1. Go to **Admin > Remote Password Changing > Configure Password Changers**.

1. Click the link to select the same password changer. 

1. Replace the RPC commands under **Password Change Commands** with the amended ones.

1. Click Test Action. DON'T SEE THIS. DO WE NEED TO GO TO ADMIN > SCRIPTS TO DO THIS?
