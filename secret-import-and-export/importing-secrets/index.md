[title]: # (Importing Secrets)
[tags]: # (Import)
[priority]: # (1000)

# Importing Secrets

SS's importation feature simplifies integration with legacy systems and allows users to easily add large numbers of secrets from an Excel or comma-separated values (CSV) file. Secrets are batch imported by template, so multiple types of input data need to be imported in several batches. The Password Migration Tool supports easy addition of existing secrets from other third-party password-storing applications.

## Configuring Data for Importation

1. Click the ![1557174423911](images/1557174423911.png) button on the Dashboard and select **Import Secrets**. The Choose Secret Template page appears:

   ![1557174549399](images/1557174549399.png)

1. Click the **What type of Secret…** list box to select the type of secrets you intend to import.

1. Click the **Continue** button. The Import Secrets page appears:

   ![1557174816852](images/1557174816852.png)

1. Paste the secrets for importation from MS Excel or a CSV file directly into the text box in the **Import Secrets**  page. The order of the imported fields is based on the template selected. Consider the following:

   - Do not include a header line. The field names are determined by the order, not a header line.
   - The fields **must** be in this order: `Secret Name`, `AccessKey`, `SecretKey`, `Username`, `SecretId`, and `Trigger`.
   - Secret names must be included,but other text-entry fields can be blank unless the secret template indicates that the text-entry field is required
   - Fields containing commas or tabs must be surrounded with double quotation marks
   - If you have to include double quotation marks inside your data, escape all of  them with a `\` character so the importer does not get confused.

1. Click to select the **Allow Duplicate Secrets** check box if you wish to import a secret with the same name as an existing one.

1. Click to select the **Import with Folder** check box if you included an additional field in the importation  text with a fully qualified folder name for the secret to be created in.

1. Click the **Next** button. SS displays a preview:

   ![1557176230259](images/1557176230259.png)

1. If you are happy with what you see, click the **Yes, Import these Secrets** button.

## Importing Secrets with the Secret-Server Migration Tool

SS offers a migration utility for users wishing to import secrets from other applications. Currently, the migration tool supports to following applications:

- KeePass
- Password Corral
- Password Safe

> **Note:** This is done with another exportation tool that creates a single XML file. Please contact Thycotic Support for details.

## Importing Secrets with Advanced XML Importation

Advanced importation adds folders, secret templates, and secrets based on an XML file. Permissions can be specified on the folders and secrets or the default is to inherit permissions. This import can only be done by administrators with proper role permissions.

> **Note:** For details on the XML file, see [Advanced Import with XML](https://updates.thycotic.net/links.ashx?AdvancedImportWithXML).
