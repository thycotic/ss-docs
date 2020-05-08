
[title]: # (Enabling CAC/PIV Smart Cards for Secret Launchers)
[tags]: # (CAC/PIV Smart Cards, Launcher)
[priority]: # ()

# Enabling CAC/PIV Smart Cards for Secret Launchers

## Overview

A Common Access Card (CAC) or Personal Identity Verification (PIV) smart card is a physical card with an embedded electronic chip that uses a certificate-key pair to authenticate users. The certificate is issued by an authorized organization. The user has a PIN that should be known only to that user, which serves a second factor for two-factor authentication—access requires physical possession of the card, as well as the PIN. The user inserts the card into a card reader, which prompts for the PIN.

SS launchers can pass smart card credentials through Remote Desktop Protocol (RDP) sessions. This is useful when a user needs to authenticate through an RDP session to a resource that requires smart card authentication, for example, a secured network drive that the user attempts to open while using the RDP session.

Currently, you can enable this either globally, via user settings, or per secret:

## Enabling Globally with User Settings

1. In SS, click the user icon and select **User Preferences**. The User Preferences page appears.
1. Click the **Settings** tab.
1. In the **Launcher Settings** section, click to enable the **Allow Access to Smart Cards** toggle. The change is automatically saved.

## Enabling on a Specific Secret

1. On a Secret with an RDP launcher, click the **Settings** tab.
1. Click the **Edit** link on the **Under RDP Launcher – Personalized User Settings** title bar. The page changes to edit mode.
1. Click to select the **Allow Access to Smart Cards** check box.
1. Click the **Save** button.