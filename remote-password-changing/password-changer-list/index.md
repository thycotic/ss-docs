[title]: # (Password Changer List)
[tags]: # (Password Changer List)
[priority]: # (1000)

# Password Changer List

## Overview

Secret Server includes many pre-configured password changers that are used by Remote Password Changing (RPC). The following are commonly used password changers, and the list is always growing.

> **Note:** To see the latest list, go to Admin \> RPC \> Configure RPC.

> **Note**: Secret Server can use scripted password changers for devices that support SSH or Telnet (this allows for flexibility in changing passwords on less common devices). You can also run custom RPC PowerShell scripts to conduct password changes to other platforms.

## List


 The followings are the current built-in password changers:

-  Active Directory Account
-  Amazon IAM Console Password Privileged Account
-  Amazon IAM Key
-  Amazon IAM Console Password Privileged Account
-  Blue Coat Enable Password Custom (SSH)
-  Amazon IAM Console Password Privileged Account
-  Cisco Account Custom (Telnet)
-  Amazon IAM Console Password Privileged Account
-  Cisco Enable Secret Custom (Telnet)
-  Amazon IAM Console Password Privileged Account
-  F5 BIG-IP Root Account (SSH)
-  Amazon IAM Console Password Privileged Account
-  Generic ODBC (DataSource)
-  Amazon IAM Console Password Privileged Account
-  IBM iSeries Mainframe
-  Amazon IAM Console Password Privileged Account
-  LDAP (Active Directory)
-  Amazon IAM Console Password Privileged Account
-  LDAP (OpendLDAP)
-  Amazon IAM Console Password Privileged Account
-  Office365 *
-  Amazon IAM Console Password Privileged Account
-  Oracle Account (AS SYS)
-  Amazon IAM Console Password Privileged Account
-  PostgreSQL Account (x64)
-  Amazon IAM Console Password Privileged Account
-  SAP Account **
-  Amazon IAM Console Password Privileged Account
-  SonicWall NSA Web Local User Account
-  Amazon IAM Console Password Privileged Account
-  SSH Key Rotation **
-  Amazon IAM Console Password Privileged Account
-  SSH Key Rotation Privileged Account **
-  Amazon IAM Console Password Privileged Account
-  Sybase Account
-  Amazon IAM Console Password Privileged Account
-  Unix Account (Telnet)
-  Amazon IAM Console Password Privileged Account
-  Unix Account Custom (Telnet)
-  Amazon IAM Console Password Privileged Account
-  Unix Account SUDO Takeover (SSH)
-  Amazon IAM Console Password Privileged Account
-  WatchGuard Custom (SSH)
-  Amazon IAM Console Password Privileged Account
-  Windows Account
-  z/OS Mainframe

\* Does not require an Advanced Scripting Add-On License. Will require PowerShell installation.
\*\* Professional Edition add-on/Platinum Edition only


Other platforms that SS can change passwords on include:

-  AS/400
-  Linux / Mac
-  Check Point
-  Linux / Mac
-  Dell DRAC