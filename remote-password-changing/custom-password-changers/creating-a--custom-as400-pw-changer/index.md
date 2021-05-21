[title]: # (Creating a Custom Password Changer for IBM AS/400)
[tags]: # (create,custom,password changer,ibm,as/400)
[priority]: # (1000)

# Creating a Custom Password Changer for IBM AS/400

>**Note**: Password changing on the IBM AS/400 can be performed through SSH, which is installed by default on version 7.1 If you are using an earlier version, you will need to install SSH.

To create a custom password changer for IBM AS/400 on newer systems such as i7, use the procedure for [Creating a Custom Password Changer](./creating-a-custom-password-changer/index.md). Be sure to use the following SSH command:

* Command: system `CHGUSRPRF $USERNAME PASSWORD($NEWPASSWORD)`

* Comment: Set Password on account

* Pause(ms): 2000

See [Securing Communications
with OpenSSH on IBM i5/OS](https://www.redbooks.ibm.com/redpapers/pdfs/redp4163.pdf) for additional information.
