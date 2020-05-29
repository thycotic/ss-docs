[title]: # (Secret Import and Export)
[tags]: # (Import,Export)
[priority]: # (1000)

# Secret Import and Export



> **Note:** Please click the table of contents on the left to see any sub-pages to this one.

You can export your data as XML by going to **Admin > All** and typing `export` in the search text box. Once on the Export page, click to select **XML** on the **Export Format** selection button.

You can import your data to another SS server as XML by going to **Admin > All** and typing `import secrets` in the search text box. Once on the Choose Secret Template page, click the **Upload XML File** link in the **Additional Options** section.

> **Important:** Do not edit the XML file with Windows Notepad. Instead, use Notepad++, Visual Studio Code, or Atom to make your edits. Windows Notepad can add invisible characters that can prevent importation.

XML export includes: 

- Folders (and their permissions)
- Secret templates
- Secrets (and their permissions)

The XML export does **not** include users, groups, launchers, configuration, and others.

> **Note:** Folders and secret templates are only exportable from SS 10.0 and later.

**To ensure permissions are applied correctly, you must recreate your users and groups on the target SS before importing.** 

The following secret template settings **are** transferred with the XML export or import:

- Edit Requires
- Field slug Names
- Hide on View
- Is Required?
- Keep Secret Name History
- One-time password settings
- Secret template icons
- Type descriptions
- Validate password requirements on create or edit

The following secret template settings are **not** transferred:

- Associated secrets
- Launcher settings
- Password changing settings
- Session recording enabled

> **Note:** You *can* use this XML import and export to transfer between on-premises and cloud editions.

If you use XML to migrate from SS on-premises to cloud, the major release version (x.x) must be the same. Otherwise, you need to upgrade before you can migrate. Additionally, the **Allow Duplicate Secret Names** check box on the **General** tab of the **Admin Configuration** page should be disabled in Secret Server Cloud before importing.

