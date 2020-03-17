[title]: # (Removing Deactivated User PII)
[tags]: # (Users, PII)
[priority]: #

# Removing Deactivated User PII

## Overview

General Data Protection Regulation (GDPR) adherence raises the possibility that SS users may make a data removal claim against a SS administrator. This requires removing any personally identifiable information (PII) in SS for that individual.

To address this, SS has a button that automatically removes most PII for any deactivated user.

## Removing the PII

1. Remove the user from Active Directory (AD). See [Active Directory Considerations](#active-directory-considerations) below.

1. In SS, go to **Admin \> Users**. The Users page appears.

1. Click the user name link for the desired user. The View User Page appears.

1. Click the **Remove Personally Identifiable Information** button. A confirmation dialog box appears.
    
    > **Important:** Once you confirm, the user cannot log on SS. Click the Cancel button if you are not positive this is what you want to do.
    
    Clicking the OK button will change these to random values:
    
    - Username 
    - Display name
    - Password
    - Personal folder name
    - Personal group name
    - RADIUS username
    
    In addition:
    
    - The user's AD GUID is cleared
    - The user's email address is removed from their record
    - The user's name is replaced with "\<redacted\>" in event audits
    - The PII removal is recorded in the user's audit
    
1. Click the **OK** button. The removal begins. Once complete, the Remove PII button disappears for that user.

1. (Optional) Run a query that scans the entire SS database for the removed strings. You may want to do this because the process cannot find *all* potential instances of USER PII throughout SS, such as that in secret names or notes.

>**Note:** You can create an Event Subscription to "remove user PII" events.

## Active Directory Considerations

We recommend removing the user from AD before removing the PII. If you remove the PII without first removing the user from AD, the user is reintroduced into SS on subsequent AD synchs. This creates a new user account in SS, which might require you to to disable this new user account and remove its PII too (after removing the AD user).
