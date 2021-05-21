[title]: # (Creating a Custom Password Changer for Cisco ASA)
[tags]: # (custom,remote,ssh,password changer,cisco,asa)
[priority]: # (1000)

# Creating a Custom Password Changer for Cisco ASA

To create a custom password changer using SSH for Cisco ASA 5505, 5515 and other models with IOS 12.2 and earlier that cannot use the copy command, follow the procedure for [Creating a Custom Password Changer](../creating-a-custom-password-changer/index.md). Make sure you choose a base password changer that ends with (SSH) with a command set similar to the one you are adding, and use the following settings:

## Authenticate As

1. `$[1]$USERNAME`
1. `$[1]$PASSWORD`

## Commands
1. enable
1. `$CURRENTPASSWORD`
1. config terminal
1. enable password `$NEWPASSWORD`
1. end
1. wr mem
1. exit
