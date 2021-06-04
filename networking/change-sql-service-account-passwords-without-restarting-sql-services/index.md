[title]: # (Change SQL Service Account Passwords without Restarting SQL Service)
[tags]: # (Database,SQL Server,password,service,restart,Networking)
[priority]: # (1000)

# Change SQL Service Account Passwords without Restarting the SQL Service

>**Note**: As of SQL Server 2008 R2, Microsoft no longer recommends changing the password of the SQL service via the services console. According to Microsoft Documentation for SQL Server 2008 R2 and above: *Changing a SQL Server service by using the Windows Service Control Manager (services.msc) application does not always change all of the necessary settings and might prevent the service from functioning properly. However, in a clustered environment, after changing the password on the active node by using SQL Server Configuration Manager, you must change the password on the passive node by using the Service Control Manager.*

## Requirements

* a PowerShell script that you will create
* a SQL dependency changer that you will create
* a secret that contains the AD credentials of the SQL instances
* a secret that contains the AD administrative credentials for PowerShell to run with
* SQL services imported via discovery

## Create a PowerShell Script in Secret Server

>**Note**: You must have administrative permission to add the script in Secret Server.

1. In Secret Server, go to **Admin \> Scripts \> PowerShell \> Create New**.

1. In the **New PowerShell Script** dialog, fill in the following values:

   * **Name**: `SQL Service Password Changer`

   * **Description**: `Changes SQL service account's password without disrupting the Services`

   ![image-new-powershell-script](images\new-powershell-script.png).

1. In the **Script** field, paste in the script below:

      ```powershell
      $TargetComputer = $args[0]
      Write-Debug $TargetComputer
      $domain= $args[1]
      Write-Debug $domain
      $UName= $args[2]
      Write-Debug $uname
      $PWord= $args[3]
      Write-Debug $PWord
      $SQLService=$args[4]
      Write-Debug $SQLService
      $SvcAccntUsr=$args[5]
      Write-Debug $SvcAccntUsr
      $SvcAcctPWD=$args[6]
      Write-Debug $SvcAcctPWD

      $Spassword = ConvertTo-SecureString $Pword -AsPlainText -Force #Secure PW
      $creds = New-Object System.Management.Automation.PSCredential ("$domain\$UName", $Spassword) #Set credentials for PSCredential logon

      $ScriptBlock= {
      param($SQLService,$TargetComputer,$domain,$username,$pword)
      "$SQLService,$TargetComputer,$domain,$username,$pword" | out-file test.txt -Append
      [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement") | out-null
      $SMOWmiserver = New-Object ('Microsoft.SqlServer.Management.Smo.Wmi.ManagedComputer') # $TargetComputer
      try
      {
      #Specify the "Name" (from the query above) of the one service whose Service Account you want to change.
      $domainuser="$domain\$username"
      $ChangeService=$SMOWmiserver.Services | where {$_.displayname -eq $SQLService -or $_.name -eq $SQLService } #Make sure this is what you want changed!
      #$ChangeService | out-file c:\temp\test.txt -append # Remove this line for production for debugging and development only. Requires you create a temp directory on the targetmachine.
      $ChangeService.ChangePassword("$pword", "$pword")
      $ChangeService.Alter()
      }
      catch
      {
      $ErrorMessage = $_.Exception.Message
      $FailedItem = $_.Exception.ItemName 
       throw "Error $ErrorMessage : $FailedItem while setting $sqlservice on $targetComputer with $domainuser"
      }
      }

      ```

1. Create secure credentials to access the SQL box using a modified invoke-command. Add `$domain`, `$SvcAccntUsr`, and `$SvcAcctPWD` for the domain, username, and password, respectively. For example:

      ```powershell
      Invoke-Command 
      -Authentication Default 
      -ComputerName $TargetComputer 
      -ScriptBlock $ScriptBlock 
      -ArgumentList $SQLService,$TargetComputer,$domain,$SvcAccntUsr,$SvcAcctPWD 
      -Credential $creds

      ```

>**Note**: You might want to test the Script in PowerShell ISE. If the script succeeds, the SQL password has changed. You can test out on a SQLEXPRESS.

## Create a New Dependency Changer

1. Got to **Admin \> Discovery**.

1. Click the **Configuration** tab.

   ![image-extensible-discovery](images\extensible-discovery.png).

1. Click **Discovery Configuration Options**.

1. From the drop-down menu, click **Extensible Discovery**.

1. Click **Configure Dependency Changers**.

1. Click **Create New Dependency Changer**.

1. On the **Basic** tab, enter the following:

    * **Type**: `PowerShell Script`

    * **Scan Template**: `Windows Service`

    * **Name**: `SQL Service Dependency Changer`

    * **Description**: `SQL Service Dependency Changer`

   ![image-extensible-discovery](images\new-dependency-changer-basic.png).

1. On the **Scripts** tab, enter the following:

   * **Script**: (Select the script you just created).
   * **Arguments**: `$MACHINE $DOMAIN $[1]$USERNAME $[1]$PASSWORD $SERVICENAME $USERNAME $PASSWORD`

   ![image-extensible-discovery](images\new-dependency-changer.png).

1. Click **Save**.

## Discovery and Importing to the Right Template

When discovery finds your SQL services and you start importing them, you'll be able to choose the template you just created as well as your privileged account, which will be running PowerShell. Once the import is finished, associate a Secret on the **Remote Password Changing** tab, which is the same as the privileged account used during the import process. Your SQL dependencies will use the SQL PowerShell changer you created, and the passwords will be changed *without* restarting SQL.
