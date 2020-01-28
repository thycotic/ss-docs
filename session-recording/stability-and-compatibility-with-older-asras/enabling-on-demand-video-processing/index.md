[title]: # (Enabling On-Demand Video Processing)
[tags]: # (XXX)
[priority]: # (20)

# Enabling On-Demand Video Processing

As described above, this feature was added in SS 10.6.24 to greatly improve session recording performance.

The Windows protocol handler now encodes the recording on the fly in WEBM format and streams the video to SS. Once the session has ended, SS reconstructs the video and leaves it in WEBM format, which Chrome and Firefox can natively play back.

Internet Explorer and Edge currently have issues playing back WEBM videos, so if you are using those browsers and try to view an on-demand recording, you are presented with a “Request Video Processing” button, which converts the video to H.264/MP4, as soon as possible, which IE or Edge can then play back.

If this option is not checked, all sessions recorded by the Windows protocol handler are converted to H.264/MP4 automatically. If you have many IE or Edge users, Thycotic recommends leaving this option unchecked, but this will increase the processing time of videos and increase the load on your SS servers that have the Session Recording role enabled.

This setting has no effect on sessions recorded with the Mac protocol handler, which is always encoded using your legacy video codec choice.
