[title]: # (Browser Configuration)
[tags]: # (Launcher)
[priority]: # (1000)

# Browser Configuration

Remote Desktop (RD) launchers require the following:

- **Firefox Configuration:** Firefox requires a helper add-on application to run the RD and PuTTy launchers. The Microsoft .Net Framework Assistant add-on and .NET framework version 4.5.1 SP1 needs to be installed.

- **Chrome Configuration:** If using ClickOnce, Chrome requires a Helper Add-on application to run the RDP and PuTTy Launcher. The ClickOnce add-on for Google Chrome Add-on needs to be installed. The launcher requires .NET framework version 4.5.1 SP1 as well.

- **SSL Certificates:** SSL must be set up properly for the RD launcher to work correctly. If SS is using SSL certificates, they must be trusted at the user's computer. This is only an issue with self-created certificates.
