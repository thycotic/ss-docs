[title]: # (Custom Launcher for SecureCRT)
[tags]: # (Launcher, custom launcher, SecureCRT)
[priority]: # (1000)

# Custom Launcher for SecureCRT (SSH)

The following instructions describe how to set up a custom launcher using SecureCRT:

## Step 1: Creating the Custom Launcher
$1
$2$1
$2$1
$2
   ![image-20200430134847224](images/image-20200430134847224.png)
$1
$2
   - **Process:** If you would like to use secret credentials to connect directly to the remote host.
   - **Proxied SSH Process:** If you have SSH Proxy enabled. This will prevent Secret credentials from being passed to the client by connecting to Secret Server's proxy to interact with the remote host.
$1
$2$1
$2$1
$2
   `/ssh2 /AUTH keyboard-interactive /PASSWORD $PASSWORD /P $PORT /L $USERNAME $HOST`
$1
$2
   ![image-20200430141525162](images/image-20200430141525162.png)

## Step 2: Creating a Custom Secret Template (optional)

See [Creating and Editing Secret Templates](../../secret-templates/managing-secret-templates/creating-or-editing-secret-templates/index.md) for details on creating a custom secret template.

## Step 3: Associating the Launcher with a Secret Template
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
   ![image-20200430143053490](images/image-20200430143053490.png)
$1
$2
 

 

 

 