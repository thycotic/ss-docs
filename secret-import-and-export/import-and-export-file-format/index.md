[title]: # (Import and Export File Format)
[tags]: # (Import,Export)
[priority]: # (1000)

# Import and Export File Format

Secrets are exported as a comma-separated-value (CSV) file or as XML. The CSV file can be easily handled in Excel or other spreadsheet applications. The file is grouped by secret template and each cluster of secrets has a header row that contains the template text-entry field names followed by all exported secrets based on that template.

The XML file follows the exact structure of the advanced xml import. As such, this can be useful with migrating data from one SS installation to another.

Secrets are exported in the exact structure as a secret Import. If exports are maintained, an installation of SS can be completely reproduced on a separate instance by applying the exported file.
