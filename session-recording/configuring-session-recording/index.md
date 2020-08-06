[title]: # (Configuring Session Recording)
[tags]: # (Session Recording)
[priority]: # (1000)

# Configuring Session Recording

## Overview

Session recording allows you to record an RDP or PuTTY session, with optional metadata, and play it back in Secret Server (SS).

The Windows protocol handler encodes your session in WebM format in real time and sends the recording to SS. There is an "Enable On-Demand Video Processing" option in SS which leaves the recordings in WebM format, which Chrome and Firefox can playback without any further processing, saving server processing time. If an on-demand recording is viewed with Internet Explorer or Edge (which do not support WebM playback), you can click the "Request Video Processing" button and the video is converted to H.264/MP4, which they can then play. If "Enable On-Demand Video Processing" is not checked, then all sessions recorded by the Windows protocol handler are automatically converted to H.264/MP4.

> **Note:** The Mac protocol handler does not yet support this feature, so any recordings created with it are converted to the chosen legacy video codec format. We recommend H.264/MP4.

You can set the advanced session recording agent to "Record All Sessions." If someone logs into a server directly without launching from SS, or even logs in at the console, the full session is recorded, including metadata.

## Configuration
$1
$2$1
$2$1
$2   
> **Note:** For testing and proof of concept deployments, SS's [**Internal Site Connector**](https:/"updates.thycotic.net/links.ashx?InternalSiteConnector) is sufficient for session recording. For production deployments we strongly recommend [**RabbitMQ**](https://updates.thycotic.net/links.ashx?RabbitMQ) for a more-robust message queue.

### Using Legacy Video Codecs

You can select a legacy video, but it will only apply to sessions recorded by the Mac protocol handler. Thycotic recommends the H.264 codec, which was available starting in SS 10.5.000003 because it produces the highest quality videos and requires no additional installation. If you want a different legacy codec, ensure that the codec you select is correctly installed on the same machine as SS. It does not need installation on any client machines, where the session recording is occurring.

Available legacy codecs:

>**Note**: On Windows Server 2008 and above, you can install Window Media Player by adding "Desktop Experience" from the features of Server Manager.

- Microsoft Video 1 (testing only): Microsoft Video 1 is deprecated in favor of Microsoft Video 9 and should not be used for production. Microsoft Video 1  does not support browser-based playback of sessions.

- Microsoft Video 9: High compression level and quality. Requires Windows Media Player. This option produces comparable video sizes to Xvid for moderate activity in an RDP session.

- VP8:  High compression level and quality. VP8 is bundled with SS. This option produces comparable sized video to Xvid for moderate activity in an RDP session.

- Xvid:  Provides similar quality and compression to DivX and is freely available. This option produces approximately 20 MBs of video for 1 hour of moderate activity in an RDP session. See https://www.xvid.com/

### Enabling Session Recording on Secrets

You must enable session recording on the Security tab for each secret. Once session recording is enabled, SS records that session when the launcher is used.

To view the recorded session after it is completed, click the **View Audit** button on the secret screen and then the **View Session Recording** link in the **Details** column.

You can also search recordings from the Session Monitoring page under **Admin \> Session Monitoring**.

The Session Monitoring page lets users search and filter sessions based on session data, secrets, users, groups, launcher type, date, and folders. This page is also where any recordings appear when using the Record All Sessions option (see below), because such recordings are not tied to a specific secret.

>**Note:** Browser playback is only supported in SS 10.2 and higher. Older versions of SS prompt the user to download the recording.

To view a session, click the camera icon to the right of it. This takes you to the Web playback interface. The video playback shows an activity map to quickly skip to sections of higher usage.

As noted above, if using the "On-Demand Video Processing" option, Chrome and Firefox can play the video. If you try to view an on-demand video using Internet Explorer or Edge, a warning message appears.

If you click the **Request Video Processing** button, the recording is converted from WebM to H.264 as soon as possible, allowing IE/Edge to play it back.

### Extending Session Recording with Custom Launchers

You can configure SS with custom launchers to run arbitrary programs, which can then be recorded by session recording. To do so:
$1
$2   1. Go to **Admin \> Secret Templates \> Configure Launchers**. The Manage Launcher Types page appears.
   
   1. Click the **New** button.
   1. Leave the **Launcher Type** dropdown list set to **Process**.
   1. Type a name for the custom launcher in the **Launcher Name** text box.
   1. Type a process name in the Process Name text box.
   1. (optional) Type process arguments in the Process Arguments text box.
   1. Customize other Options as needed.
   1. Click the **Save** button. 
$1
$2   1. Go to **Admin > Secret Templates**. The Manage Secret Templates page appears.
   1. Click the template dropdown list and select the desired template.
   1. Click the **Edit** button.
   1. Click the **Configure Launcher** button. The Secret Template Edit Launcher Configuration page appears.
   1. Click the **Add New Launcher** button.
   1. In the **Launcher Type to use** dropdown list, select your custom launcher.
   1. Customize any other options as needed.

Secret Server 10.8 added two new options to custom launchers:

#### Record Multiple Windows Option 

If this option is not checked, only the main window of the main launcher process will be recorded (this was always the behavior prior to Secret Server 10.8). If it is checked, multiple windows as well as child processes are recorded.

Without this enabled, the main window of the main process sometimes does not show anything useful, depending on the application, resulting in a blank recording. With this enabled, recordings are generally more accurate. This also applies to applications that can open or undock separate windows or those that launch additional processes, such as an application launching PowerShell and then launching other applications from the command prompt.

#### Record Additional Processes Option

Here you can type an optional comma-separated list of processes to record if found, running under your same user account, that are not started or terminated by the custom launcher. "Record Multiple Windows" must be enabled for this option to be available. 

In the example above of launching PowerShell and then opening Notepad, if "Record Multiple Windows" is enabled, both PowerShell and Notepad would be recorded automatically, because the OS can tell that Notepad is a child process of PowerShell. This even works multiple levels deep—for example, launching PowerShell, then the command prompt, and then launching in PowerShell again, finally followed by Notepad.

In some cases, though, you may wish to record an additional process that was already running before the custom launcher was launched or may want to start running one later. To this end, any process names specified in this option are checked for periodically, and recording is attempted on them as well.

#### Example

If you wanted to run an X11 server such as Xming and then PuTTY with X11 forwarding, you could configure a custom lauchcher with these values:

Process Name: `C:\Program Files\PuTTY\putty.exe`
Process Arguments: `-X -ssh $MACHINE -l $USERNAME -pw $PASSWORD`
Record Additional Processes: `Xming.exe`

In this case, Xming should already be running before the launcher was used and would remain running after the session hased ended. It would have no parent/child relationship with PuTTY at all. However, while the launcher session was active, any windows it spawns would still be recorded, allowing the X11-forwarded applications to be recorded, not only the PuTTY window.

### Advanced Session Recording

#### Metadata Recording

By default, session recording creates videos of the launched session. SS supports logging additional metadata, such as keystrokes for RDP and SSH sessions. When these options are enabled, users can search for keystrokes or applications across sessions, and the session playback interface shows additional activity information.

Remote Desktop session metadata requires SS 10.6 and the advanced session recording feature, which in turn requires an installation of an advanced session recording agent (ASRA) on the target servers. See [Advanced Session Recording Agent](https://thycotic.force.com/support/s/article/SS-INST-EXT-Adv-Session-Rec-Agent).

SSH keystroke data relies on the Secret Server SSH Proxy. This can be enabled under **Admin >SSH Proxy**. See [SSH Proxy Configuration](https://thycotic.force.com/support/s/article/ka0370000005Q1QAAU/SSH-Proxy-Bandwidth) (KBA) for more information. Once proxying is enabled recorded SSH sessions will log SSH traffic which can be searched and is displayed in the session playback interface.

#### Record All Sessions

As of SS 10.6.26, you can configure the ASRA to record all sessions. This causes it to record video and metadata for anyone logging into the server, even when not using SS, including logging into the console. Since these recordings are not tied to any specific secret, you must go to the **Admin** **>** **Session Monitoring** page to view them.

### Session Recording Settings

Under **Admin >** **Configuration** **>** **Session Recording** there are several settings for configuring how SS handles session recordings:

#### Hide Recording Indicator

When viewing a secret, the launcher icon normally indicates if the session will be recorded or not via the recording icon. When launched into, a notification window also informs the user that their session is being recorded. If "Hide Recording Indicator" is checked, users cannot tell which secrets have recording enabled based on the icons, and if they launch a recorded session, they will not be warned that their session is being recorded.

#### Enable On-Demand Video Processing

The Windows protocol handler encodes the recording on the fly in WebM format and streams the video to SS. Once the session has ended, SS reconstructs the video and leaves it in WebM format, which Chrome and Firefox can natively play back.

> **Note:** WebM is an audiovisual media file format that is a royalty-free alternative to HTML5 audio and video.

Internet Explorer and Edge currently have issues playing back WebM videos, so if you are using those browsers and try to view an on-demand recording, you are presented with a "Request Video Processing" button, which converts the video to H.264/MP4, as soon as possible, which IE or Edge can then play back.

If this option is not checked, all sessions recorded by the Windows protocol handler are converted to H.264/MP4 automatically. If you have many IE or Edge users, Thycotic recommends leaving this option unchecked, but this will increase the processing time of videos and increase the load on your SS servers that have the Session Recording role enabled.

This setting has no effect on sessions recorded with the Mac protocol handler, which is always encoded using your legacy video codec choice.

#### Enable Inactivity Timeout (Minutes)

If enabled, if a session appears idle, users are given a five-minute warning that they will be disconnected. A prompt appears that lets them choose to disconnect immediately or to continue the session. If no response is received, the session is disconnected five minutes later.

>**Note:** This feature was added in SS 10.6.26 and is currently only supported in the Windows protocol handler (not Mac).

#### Max Session Length (Hours)

This sets a hard limit to how long a recorded session may last. This includes both launched from SS, as well as recorded sessions if using ASRA and the "Record All Sessions" option. This option helps prevent accidental recordings over the weekend, or even longer, if someone forgets to disconnect their session.

>**Note:** This feature was added in SS 10.6.26 and is supported by both the Windows and Mac protocol handlers.

#### Use Hardware Acceleration

If enabled, when processing H.264/MP4 files, this setting makes SS attempt to use hardware acceleration for video processing if possible (GPU or CPU). Thycotic recommends this setting is always enabled because SS will fall back to not using hardware acceleration if necessary.

>**Note:** This feature was added in SS 10.6.0.

#### Save Videos to

This configuration includes:

- **Database**:  Stores the information from a recorded session as encrypted data to your database.

- **Disk**:  Stores the recorded session as a video file directly to the specified folder path.

#### Archive Location Dependent on Site

If you save recordings to disk, enabling this option lets you pick a separate path for each of your sites. This is useful in large environments that need many recordings spread out across multiple devices and locations.

>**Note:** See below for a note about using network shares for storage.

#### Folder Path

If you save recordings to disk, this is where they are saved. If you use the "Archive Location Dependent on Site" option, this is the default storage location for newly added sites, until you customize their folder path to something else.

>**Note:** See below for a note about using network shares for storage.

#### Encrypt Archive on Disk

This setting encrypts the session videos when stored on disk. Videos stored on disk are played back through the SS UI but cannot be viewed directly from the file system.

#### Enable Archiving to Disk

After the specified number of days have passed, all recorded session information in your database is transferred to the specified folder path as video files and cleared from the database.

#### Enable Deleting

After the specified number of days have passed, all recorded videos in your database will be cleared and video files in your archive path will be deleted.

#### Setting Notes

- To use "Save Videos to Disk" or "Archive to Disk," the Application Pool service account must have write permission to the specified file path.

- To delete videos from the archive path, the Application Pool service account must have "modify" permissions.

- After saving a change to **Configuration** **>** **Session Recording**, the configurations for "Save Videos To Disk" and "Enable Deleting" will immediately be applied to all existing session recordings.

#### Using Network Share Path

In a clustered environment SS needs to use a network path when saving the files to disk. All nodes need access to the path to read the videos back to the user.

To archive or save to a file path that is a network share, instead of a local folder:

- The SServer IIS application pool must be running as a service account. See [Running Secret Server IIS Application Pool with a Service Account](https://thycotic.force.com/support/s/article/Running-Secret-Server-IIS-Application-Pool-with-a-Service-Account) .

- You must grant access to the network share (using Windows ACLs) to the account running the SS IIS application pool.

 '