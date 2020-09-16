[title]: # (Secret Import and Export)
[tags]: # (Import,Export)
[priority]: # (1000)

# Secret Import and Export

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

## Overview

Secrets are exported as a comma-separated-value (CSV) file or as XML. The CSV file can be easily handled in Excel or other spreadsheet applications. The file is grouped by secret template and each cluster of secrets has a header row that contains the template text-entry field names followed by all exported secrets based on that template.

The XML file follows the exact structure of the advanced xml import. As such, this can be useful with migrating data from one SS installation to another.

Secrets are exported in the exact same structure as a secret Import. 

> **Note:** File  attachments on the original secret are not exported into the XML file and require using the API to migrate. Secret audits and history  are not preserved during the migration. Be sure to first create the AD  groups and users using the permissions on the secrets in the original SS instance. Otherwise, they will not be created when the secrets are imported into the new instance.

## What Gets Imported or Exported

Import and export include:

- Folders (and their permissions)

- Secret templates

- Secrets (and their permissions)

The import or export does **not** include users, groups, launchers, configuration, and others.

> **Note:** Folders and secret templates are only exportable from SS 10.0 and later.

> **Important:** To ensure permissions are applied correctly, you must recreate your users and groups on the target SS before importing.

The following secret template settings **are** transferred with the export or import:

- Edit requires

- Field slug names

- Hide on view

- Is required?

- Keep secret name history

- One-time password settings

- Secret template icons

- Type descriptions

- Validate password requirements on create or edit

The following secret template settings are **not** transferred:

- Associated secrets

- Launcher settings

- Password changing settings

- Session recording enabled

## Migrating Secret Server Cloud

If you use XML import and export to migrate from SS on-premises to cloud, the major release version (x.x) must be the same. Otherwise, you need to upgrade before you can migrate. Additionally, the **Allow Duplicate Secret Names** check box on the **General** tab of the **Admin Configuration** page should be disabled in Secret Server Cloud before importing. 

You can use XML import and export to transfer between on-premises and cloud editions.

> **Important:** Do not edit the XML file with Windows Notepad. Instead, use Notepad++, Visual Studio Code, or Atom to make your edits. Windows Notepad can add invisible characters that can prevent importation.

