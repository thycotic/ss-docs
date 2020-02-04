[title]: # (Customizing the User Interface)
[tags]: # (Customizing the User Interface)
[priority]: # (50)

# Customizing the User Interface

By default, SS is set to a default theme unless specified within the Configuration settings. SS comes with three other bundled themes: Blue, Dark, and Green. The default theme can be set at **Administration > Configuration** on the general tab. Theming differences can be allowed by individual users with the **Allow User to Select Themes** permission.

## Themes

### Choosing Themes

1. Click your user icon in the top right of the dashboard and select **Account Settings**.
2. Ensure the **General** tab is selected.
3. Click the **Edit** button.
4. Click the **My Theme** dropdown list to select the theme. Your choices are:
   - Secret Server Classic - Blue
   - Secret Server Classic - Dark
   - Secret Server Classic - Default
   - Secret Server Classic - Gray
   - Secret Server Classic - Green
   - Secret Server (New)
5. Click the **Color Mode** dropdown list to select the color mode (default, light, or dark) when **My Theme** is set to **Secret Server (New)**.

> **Note:** The color mode only applies to Secret Server (New). If you change it while in one of the classic themes, nothing seems to happen; however, when you switch to Secret Server (New), the color mode you chose applies.

## Creating Themes

Themes are controlled from the Theme Roller. To create a custom theme, go to Admin | More | Themes. For detailed instructions on using the Theme Roller please see ==this KB guide==.

## Embedded Mode

_Embedded mode_ removes the header and footer to allow SS to be more easily placed within a frame. To activate embedded mode for the session, add an embedded=true query string parameter to the URL when accessing SS. For example, if you normally access SS by going to:

`https://myserver/secretserver/login.aspx`,

then you can enable embedded mode by going to:

`https://myserver/secretserver/login.aspx?embedded=true`.

This parameter can be added to the URL on any page in SS. To disable embedded mode simply change the query string to embedded=false.
