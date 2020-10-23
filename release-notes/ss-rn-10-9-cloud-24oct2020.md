[title]: # (Secret Server Cloud Release Notes Oct 2020)
[tags]: # (Release Notes)
[priority]: # (1001)
[display]: # (all)

# Secret Server: Cloud Release Notes - October 2020

October 24, 2020

>**Note:** The system requirements last changed with version 10.7.000000. See [that version's release notes](./ss-rn-10-7-000000.md) for details.

## Security

* Added an administrator configuration option for Web Password Filler to require a fully qualified domain match.

## New Features and Enhancements

* Scheduler role logging improved when a service provider disables an instance of Secret Server.
* Failure prevention processes for mitigating service outages improved.
* Delivery and loading of UI frameworks improved.
* Discovery dependency scanning performance improved.
* Discovery Active Directory OUs scanning via the engine worker improved.
* Error logging improved when a user enters an invalid AD credential.
* Secret Server Cloud platform stability improved.

## Bug Fixes

The following bug fixes apply to Secret Server Cloud only.

* Fixed an intermittent issue with the bulk exportation of event logs.
* Fixed an issue where a secret’s audit log accumulated an excessive number of encryption and decryption event messages.
* Fixed additional infrastructure bugs affecting the overall stability of Secret Server Cloud.
