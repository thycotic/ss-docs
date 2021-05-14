[title]: # (Custom TOAD Launchers)
[tags]: # (TOAD,custom,launcher)
[priority]: # (1000)

# Creating a Custom TOAD Launcher

You can create a custom launcher for TOAD by entering custom command line parameters in the "Process Arguments" field.

1. Navigate to **Admin \> Secret Templates**,

1. Click **Configure Launchers**,

1. Click **New**,

1. Select a Launcher Type:

   * Use **Process** if you would like to use Secret credentials to connect directly to the remote host.

   * Use **Proxied SSH Process** if you have SSH Proxy enabled, to prevent passing Secret credentials to the client by connecting to Secret Server's proxy to interact with the remote host.

    ![images-toad-launcher](images\toad-launcher.png)

1. Enter a **Launcher Name** of your choice.

1. For **Process Name**, enter the location and the Toad executable. The location must exist on the client machine that will run the Toad launcher.

1. For **Process Arguments**, enter your own custom command line parameters, or the following:

    `-C $USERNAME/$PASSWORD@$SERVER:$PORT/$DATABASE`

1. When finished, click **Save**.
