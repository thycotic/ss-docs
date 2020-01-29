[title]: # (Secret Template Settings for Importation and Exportation)
[tags]: # (Secret Template Settings for Importation and Exportation)
[priority]: # (80)

# Secret Template Settings for Importation and Exportation

Secret template settings for importation and exportation include: 

- Is Required?

- Edit Requires

- Hide on View

- Secret template icon

- Keep Secret Name History

- Validate Password Requirements on Create/Edit

- Field Slug Name

- Type Description

- One Time Password settings

 The secret template settings that do **not** transfer include:

- Launcher settings

- Password changing settings

- Session recording enabled

- Associated secrets

See the [Can I import/export data between Secret Servers?](https://thycotic.force.com/support/s/article/Can-I-import-export-data-between-Secret-Servers) KBA for more information. 

### Exported File Format

Secrets are exported as a comma-separated-value (CSV) file or as XML. The CSV file can be easily handled in Excel or other spreadsheet applications. The file is grouped by secret template and each cluster of secrets has a header row that contains the template text-entry field names followed by all exported secrets based on that template.

The XML file follows the exact structure of the advanced xml import. As such, this can be useful with migrating data from one SS installation to another.

Secrets are exported in the exact structure as a secret Import. If exports are maintained, an installation of SS can be completely reproduced on a separate instance by applying the exported file.

### Recovery

Recovery requires using the application and database backups. To restore Web application directory, extract the root directory to the Web server. The `encryption.config` file is most important for being able to read the contents of the database. The SQL database can be restored using the standard process in SQL Server Management Studio from the `.bak` file.

> **Note:** For detailed instructions, see the [Restoring Secret Server from a Backup](https://updates.thycotic.net/link.ashx?SSUserGuide_restoreSecretServerBackup) KB article.
