[title]: # "Creating and Editing Reports"
[tags]: # "Creating and Editing Reports"
[priority]: # "21"

# Creating and Editing Reports

There are two ways to create a Report. From the Reports Edit page, click the **Add New** link at the bottom of a Report Category. Or alternatively, from the Reports View page, click the **Create it** link at the bottom of that page.

To edit a Report, navigate to the Report View page and click **Edit**.

> **Note:** The SQL script text cannot be edited for standard reports.

Below is an explanation of the different text-entry fields for the Report Edit page:

- **Report Name:** Name that is displayed on the Reports page as a link underneath its containing category.

- **Report Description:** Description for the Report. This is displayed in the Report View page. It is also used as the Tooltip for the Report name on the Reports page.

- **Report Category:** Selection for which Report Category to place the Report into.

- **Chart Type:** Type of chart to use for displaying the results. If set to None, a grid displays.

- **3D Report:** Specify a 3D style to render the chart in.

- **Page Size:** Page size limit setting for the data displayed in the grid.

- **Report SQL:** SQL script that is used to generate the report.

Reports support the embedding of certain parameters into the SQL to give the user the ability to dynamically change the resulting data set. Another option available for custom reports is to apply a different color to returned rows dependent on certain conditions. For more information as well as examples, see the [Using Dynamic Parameters in Reports](https://updates.thycotic.net/link.ashx?SSUserGuide_SecretServerReportParameters) KB article.

You can show SS's SQL database information to assist with creating custom reports. By selecting the SQL Table from the list, the details of the table's columns display in a grid. Click the **Show SS SQL database information** link to see the SQL Table list and SQL Table Columns grid. Click **Preview** at the bottom of the page to see a preview of the chart. The resulting chart displays in the Report Preview section at the bottom of the page.
