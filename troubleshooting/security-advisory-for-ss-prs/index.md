[title]: # (Security Advisory 2019)
[tags]: # (security,advisory,attach,vulnerability)
[priority]: # (1000)

# Security Advisory 2019

## Detection

During a security review of Secret Server on June 4, 2019, an internal security team found the security issue described below. The issue was also detected later by an internal team in Password Reset Server.

## The Security Issue

An attacker with administrator permissions could modify the input field data in one specific location to execute a SQL injection attack against Secret Server or Password Reset Server. This means that the attacker could append, modify or delete data in the Secret Server or Password Reset Server SQL databases, and upgrade their access to code execution on the SQL server.

## Common Vulnerability Scoring System Version 3.0

The CVSS score for this issue is 9.1. The CVSS vector string is CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H

## Products Affected

* Secret Server On-Premises version 10.6.000026 and earlier.
* SS Cloud, which was updated June 15, 2019 to permanently remove this issue for all customers.
* Password Reset Server earlier than version 5.1.000005.

## Recommended Actions

* All Secret Server On-Premises customers should upgrade to version 10.6.000027 or later.
* All Password Reset Server customers should upgrade to version 5.1.000005 or later.
* SS Cloud users do not need to take any action.
