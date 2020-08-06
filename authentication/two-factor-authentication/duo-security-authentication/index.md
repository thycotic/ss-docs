[title]: # (Duo Security Authentication)
[tags]: # (Authentication, Credentials, 2FA)
[priority]: #

# Duo Security Authentication

> **Note:** Using this method of two-factor authentication requires that you have an active account for Duo Security.

> **Note:** SS supports using Duo Security as a second factor of authentication. See below for setup instructions.
>
> Note:  For more information on Duo and Secret Server, see the [Thycotic Secret Server and Duo](https://www.duosecurity.com/docs/thycotic) page.

## Task 1: Create a Duo Application Representing Your Secret Server (Admin)
$1
$21. Under **Applications**, create a new application of the **Thycotic Secret Server** type. Name the application as you wish. 
$1
$2
## Task 2: Configure Secret Server to Use Duo (Admin)

> **Note:** Because Duo is a service, the SS instance must have outbound access (TCP port 443) to reach the API host to work. If there is a firewall rule preventing access to Duo's servers, two factor authentication will not work.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
   ![image-20200625133503984](images/image-20200625133503984.png)
$1
$2$1
$2$1
$2$1
$2
## Task 3: Setting up Duo (User)
$1
$21. After successful authentication, a new screen appears with the option to select a method to authenticate with.
$1
$2