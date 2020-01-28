[title]: # (Recording Metadata)
[tags]: # (XXX)
[priority]: # (40)

# Recording Metadata

By default, session recording creates videos of the launched session. SS supports logging additional metadata, such as keystrokes for RDP and SSH sessions. When these options are enabled, users can search for keystrokes or applications across sessions, and the session playback interface shows additional activity information.
Remote Desktop session metadata requires SS 10.6 and the advanced session recording feature, which in turn requires an installation of an advanced session recording agent (ASRA) on the target servers. See https://thycotic.force.com/support/s/article/SS-INST-EXT-Adv-Session-Rec-Agent.
SSH keystroke data relies on the Secret Server SSH Proxy. This can be enabled under Admin \>SSH Proxy. See the SSH Proxy configuration KB article for more information. Once proxying is enabled recorded SSH sessions will log SSH traffic which can be searched and is displayed in the session playback interface.
