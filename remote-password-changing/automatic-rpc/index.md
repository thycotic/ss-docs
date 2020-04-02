[title]: # (Automatic Remote Password Changing)
[tags]: # (Automatic Remote Password Changing)
[priority]: # (10)

# Automatic Remote Password Changing

The Remote Password Changing tab contains the settings for configuring RPC on an individual secret. Enabling RPC _autochange_ on a secret allows SS to remotely change the password when it expires. The user must have Owner permission on the secret to enable autochange. When editing on the RPC tab, the Next Password text-entry field can be set or if left blank an auto-generated password is used.

> **Note:** If the password change fails, SS flags the secret as out of sync and continue to retry until it is successful. If the secret cannot be corrected or brought In sync, manually disabling autochange stops the secret from being retried.

## AutoChange Schedule

The AutoChange Schedule button is visible on the secret View RPC tab when RPC and autochange is enabled on a secret. The AutoChange Schedule page allows you to specify an interval, start date, start time, and time frame for when the password can be changed. This setting is useful for having the RPC occur during off-hours in order to prevent disruptions. By default, this setting is None, which allows the secret to be changed immediately. Note that regardless of the autochange schedule, the password still has to expire before being automatically changed.

> **Note:** While the password change is waiting for this next scheduled time, the RPC Log (visible by navigating to **Configuration > Remote Password Changing**) reports the secret could not be changed because of time schedule. The secret also remains expired until this autochange schedule is reached, even if the Secret was forced to expire.
