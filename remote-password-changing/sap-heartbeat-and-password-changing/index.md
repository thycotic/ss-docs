[title]: # (Create a New Dependency Changer for Synchronizing Passwords During RPC)
[tags]: # (synchronize,passwords,rpc,remote password changing, dependency)
[priority]: # (1000)

# SAP Heartbeat and Password Changing

You can enable Secret Server to perform heartbeat and change passwords on SAP accounts by following the procedures as indicated below (Premium Add-on or Enterprise Plus Edition Only).

First, create a new privileged SAP account administrator secret, typically for the SAP or DDIC account that is used to log on to SAP for administrative tasks. Select the **SAP Account** template and enter all required information to create the new SAP account administrator secret. By default, the **Instance Number** will be 00 and the **Client Number** will be 001.

 >**Note**: the default **System ID** for SAP is also NSP.

Second, create the account you are planning to change. Follow the same method as before and enter the current account password in the password field.

Third, in your new SAP account administrator secret, set the privileged account on the "Remote Password" changing tab.
>**Note**: for an account to have its password changed, even a privileged account changing its own password, it requires permissions in SAP.

## For Secret Server 8.8.000000 and Higher

Download [SAP .Net Connector 3.0]( https://help.sap.com/saphelp_crm700_ehp02/helpdata/en/4a/097b0543f4088ce10000000a421937/frameset.htm) and install it using the following procedure:

1. Navigate to `service.sap.com/connectors`.
1. Enter your credentials for the SAP Marketplace.
1. Click on SAP Connector for Microsoft .NET.
1. Download the .NET 4.0 Option with the proper bitness for your application pool (64-bit mode for most customers).
1. Install the downloaded file.
1. Copy the sapnco.dll and sapnco_utils.dll files into the bin folder of your web application.
1. Recycle the application pool.

Once these steps are complete, heartbeat and password changing should be working.

 >**Note**: Accounts can change their own SAP passwords just once per day. This is a restriction in the SAP software that cannot be changed. If an account needs its password to change more than once a day, use a privileged account to perform the reset.

If performing a Heartbeat on an SAP Secret fails with the error, `Exception: PASSWORD_EXPIRED`, it most likely means an administrator has reset the SAP account’s password, and the account must log in and change its own password in SAP.

## For Secret Server 8.7.000000 and Below

1. Change your Secret Server application pool to run in 32-bit mode.
1. Download the SAP GUI version 720 from the [SAP Community website](http://scn.sap.com).
1. Extract the downloaded ZIP file. Depending on the version, the extracted download will have a GUI or Frontend Tools directory.
1. Copy that directory over to the machine running Secret Server.
1. Run the installer inside the directory. The install should take only a couple of minutes.
