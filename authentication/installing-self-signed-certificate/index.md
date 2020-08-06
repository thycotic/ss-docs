[title]: # (Installing a Self-Signed SSL Certificate)
[tags]: # (Authentication, Certificate, Testing)
[priority]: # (1000)

# Installing a Self-Signed SSL Certificate

## Overview

An SSL (Secure Sockets Layer) certificate greatly enhances the security between the user’s browser and the server your SS is installed on. It encrypts all data between the server and the client’s browser so if an attacker were to look at the data being transmitted between the two, they would not be able to decipher it. 

> **Note:** SSL is required when using Integrated Windows Authentication.

## Obtaining an SSL Certificate

You can get a certificate from various companies such as [Thawte](http://www.thawte.com/) or [VeriSign](http://www.verisign.com/). If you already obtained a certificate from one of them, please follow their instructions for installing their certificates.

> **Note:** Thycotic does **not** provide certificates.

## Installing a Self-Signed Certificate

You can create your own certificate for trial or sandbox environments:

> **Note:** This requires IIS 7 or later.

### Task One: Generate an IIS Self-Signed Certificate
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
### Task Two: Bind the Self-Signed Certificate to the IIS Site
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
### Task Three: Test the Self-Signed Certificate
$1
$2$1
$2
> **Note:** It is possible to remove the warning by adding the self-signed certificate to the trusted root certificate authorities, but that is beyond the scope of this instruction.