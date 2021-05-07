[title]: # (Mac OS X iTerm Launcher)
[tags]: # (Launcher, protocol handler,iterm,mac os x)
[priority]: # (1000)

# Mac OS X iTerm Launcher

This topic covers how to configure a custom launcher for iTerm with the Mac OSX session launcher. The example uses Applescript from a shell script to create an iTerm launcher for Mac OS X users in Secret Server.

1. Save the following in a file named `iterm.sh`:

```shellscript
#!/bin/sh
USER="$1"
MACHINE="$2"
PASSWORD="$3"
 
osascript - "$USER" "$MACHINE" "$PASSWORD" <<EOF 2> /dev/null
 
on run argv
 
tell application "iTerm"
 
    activate
 
    tell the current window
 
      launch session "Default Session"
      activate current session
 
 
      tell the current session
            write text "ssh " & (item 1 of argv) & "@" & (item 2 of argv)
            delay 2
            write text (item 3 of argv)
      end tell
 
    end tell
end tell
 
end run
 
EOF
 
exit 0
```
2. In Secret Server, go to **Admin \> Secret Templates \> Configure Launchers**.

3. Click the **New** button. 

4. For the launcher settings, choose the following:
   - **Launcher Type:** Batch File
   - **Shell Script:** choose and upload your `iterm.sh` file
   - **Process Arguments:** $USERNAME $MACHINE $PASSWORD

   > **Note:** You may need to change the process arguments if the names of these fields on your secret template are something other than "Username" "Machine" and "Password"

4. Assign the launcher to a template, such as Unix Account (SSH).

   1. Whether you use an existing template or create a new one, go to the **Edit** page for it.

   1. Click **Configure Launchers**.

   1. Click **Add New Launcher**.

   1. Select the iTerm one you created previously.

   1. Map the username and password fields accordingly. Disregard the domain field mapping. 

   1. Click **Save**.

1. Create an SSH secret to test:

   1. Go to the **Secret Template** page.
   1. Click the **New** button.
   1. Select **UNIX Account (SSH)** (or whatever template you assigned the launcher to). 
   1. Fill out the fields for a machine you can test iTerm with.
   1.  Click the **Save** button.

6) Click the launcher icon to test.

> **Note:** There may be a terminal window that remains open after running the launch script. This behavior can be changed in the Terminal Preferences under **Profiles \> Shell** and setting **When the shell exits:** to **Close if the shell exited cleanly**.