[title]: # "Session Recording and Launchers"
[tags]: # "Launcher"
[priority]: # "70"

# Session Recording and Launchers

Session recording provides an additional level of security by recording a user's actions after a launcher is used. Session recording works for any launcher, including PuTTY and SSH, Windows Remote Desktop, Microsoft SQL Management Studio, and custom executables. The resulting movie is viewable from the secret audit. Session recording can be toggled on or off globally on the Configuration page and set for individual secrets on the Security tab. Detailed information on supported codecs can be found in [Session Recording](../../../session-recording/index.md). When a user launches a session with session recording enabled, a brief message is displayed to inform the user that their actions are recorded.

> **Note:** When multiple Launchers are enabled for a secret template, enabling session recording for a secret applies the setting to all launchers for that secret.
