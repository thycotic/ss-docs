[title]: # (Creating a Configuration)
[tags]: # (XXX)
[priority]: # (20)

# Creating a Configuration

When configuring the Web Launcher:

- **Entering the Login URL:** SS needs to know the exact URL used to login to be able to figure out the controls and perform the automatic login. Some example login URLs:

  - `https://login.yahoo.com/config/login`

  - `https://MyServer/Billing/login.aspx`

  - `https://firewall07/login/`

> **Note:** The Login URL is typically a secure site with a prefix of `https://`. If allowed to access the site, SS automatically detects if https should be used to ensure the credentials are passed securely.

- **Providing the Page Source:** If SS is not allowed access to sites, or the login URL is not accessible by an external site, the page source needs to be provided for the Web launcher controls to be obtained. Ensure the login URL is correct when the page source is taken. If the site can be accessed by SS the page source is automatically obtained and this step is not present.

- **Choosing the Form:** The page is read, and the exact login form needs to be identified. The page forms are listed in the list with the most likely selected. If no forms or no likely forms are found, the user needs to update the URL or page source, as configuration must have at least one textbox and one password box.

- **Wiring Up the Fields to Controls:** In most cases, SS automatically wires up the Username and Password text fields to the correct page controls. If not, the user completes the control mapping on the Launcher tab.
