[title]: # (Secret Import and Export)
[tags]: # (Import,Export)
[priority]: # (1000)

# Secret Import and Export

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

## Overview

Secrets are imported or exported as a comma-separated-value (CSV) file or as XML:

- The CSV file is easily read and edited in Excel or other spreadsheet application. The file is grouped by secret template and each cluster of secrets has a header row that contains the template text-entry field names followed by all exported secrets based on that template.
- The XML file is useful for migrating data from one SS installation to another or even from a third-party application to SS.

Secrets are exported in the exact same structure as a secret Import.

This topic has three subtopics:

- [Exporting Secrets](./exporting-secrets/index.md)
- [Importing Secrets](./importing-secrets/index.md)
- [Secret Server Migration Tool](./secret-server-migration-tool/index.md)

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

## Migrating to and from Secret Server Cloud

If you use XML import and export to migrate from SS on-premises to cloud, the major release version (x.x) must be the same. Otherwise, you need to upgrade before you can migrate. Additionally, the **Allow Duplicate Secret Names** check box on the **General** tab of the **Admin Configuration** page should be disabled in Secret Server Cloud before importing.

You can use XML import and export to transfer between on-premises and cloud editions.
