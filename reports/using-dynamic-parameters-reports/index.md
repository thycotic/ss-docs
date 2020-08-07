[title]: # (Using Dynamic Parameters in Reports)
[tags]: # (Reports, Dynamic Parameters, Coloring)
[priority]: # (1000)

# Using Dynamic Parameters in Reports

> **Note:** As version 7.0, Secret Server allows creation of Reports using custom SQL.

Reporting supports embedding certain parameters into the SQL to give the viewer controls to dynamically change the report. The supported parameters are:

## Primary Parameters

### #STARTDATE

This displays a calendar picker on view and returns a date. This defaults to beginning of the year and truncates the hours and minutes to 12:00 AM.

Example: display all users who have logged in after a certain date:

``` sql
SELECT
  Domain,
  Username,
  LastLogin
FROM tbUser
  LEFT JOIN tbDomain ON tbUser.DomainId = tbDomain.DomainId
WHERE
  LastLogin > #STARTDATE
```

### #ENDDATE

This displays a calendar picker on view and returns a date. This defaults the current day and truncates the hours and minutes to 11:59 PM.

Example: display all users who have logged on a certain date:

``` sql
SELECT
  Domain,
  Username,
  LastLogin
FROM tbUser
  LEFT JOIN tbDomain ON tbUser.DomainId = tbDomain.DomainId
WHERE
  LastLogin > #STARTDATE
AND
  LastLogin < #ENDDATE
```

### #USER

This displays a user dropdown list with all active users on view and returns an user id. This defaults to the current logged in user.

Example: display all audit entries for  a certain user:

``` sql
SELECT
  tau.UserIdAffected,
  tau.[Action],
  tau.Notes,
  tau.DateRecorded,
  tau.IpAddress,
  tau.MachineName,
  tau.DatabaseName,
  tu.UserId,
  tu.UserName
FROM tbAuditUser tau INNER JOIN tbUser tu ON tau.UserId=tu.UserId WHERE tu.UserId=#USER
```

### #ORGANIZATION

This is an internal parameter used for determining the current instance's organization code. This is only useful for Secret Server Cloud.  There is no need to use this parameter in your reports for on-premises edition.

> **Note:** As of Secret Server 7.8.000048 the #GROUP parameter is also available.

### #GROUP

Displays a group dropdown list with all active groups on view and returns a group id. This defaults to the Everyone group.

Example: display the group details of the selected group:

``` sql
SELECT
  GroupID,
  GroupName,
  Active
FROM tbGroup
WHERE GroupID = #GROUP
```
### #FOLDERID

Displays a folder picker that shows all Folders and returns a folder id.

Example: Display secret names in a selected folder:

``` sql
SELECT
  s.SecretName
FROM tbSecret s
WHERE s.Folderid = #FOLDERID
```
### #FOLDERPATH

Displays a folder picker that shows all folders and returns the path of the folder.

Example: display folders that are child folders of the selected path:

``` sql
SELECT *
FROM tbFolder f
WHERE FolderPath LIKE '%' + #FOLDERPATH + '%'
```

### #CUSTOMTEXT

Displays a text input where a user can put in arbitrary free text for searching.

Example: display secrets that have names that contain the text input:

``` sql
SELECT *
FROM tbFolder f
WHERE FolderPath LIKE '%' + #CUSTOMTEXT + '%'
```

## Additional Parameters

The following additional parameters can be used to make your report more dynamic:

### Parameters

**Table:** Additional Parameters

| **Parameter Name**  | **Description**                                    |
| ------------------- | -------------------------------------------------- |
| #ENDCURRENTMONTH    | The last day of current month                      |
| #ENDCURRENTYEAR     | December 31st of the current year                  |
| #ENDPREVIOUSMONTH   | The last day of the previous month at 11:59:59 PM  |
| #ENDPREVIOUSYEAR    | December 31st of the previous year                 |
| #ENDTODAY           | End of today at 11:59:59 PM                        |
| #ENDWEEK            | End of the current week (Sunday) at 11:59:59 PM    |
| #ENDYESTERDAY       | End of Yesterday at 11:59:59 PM                    |
| #STARTCURRENTMONTH  | The first day of current month                     |
| #STARTCURRENTYEAR   | January 1st of the current year                    |
| #STARTPREVIOUSMONTH | The first day of the previous month at 12:00 AM    |
| #STARTPREVIOUSYEAR  | January 1st of the previous year                   |
| #STARTTODAY         | Beginning of today at 12:00 AM                     |
| #STARTWEEK          | Beginning of the current week (Monday) at 12:00 AM |
| #STARTYESTERDAY     | Beginning of yesterday at 12:00 AM                 |

### Example

For example, the following script would give you a list of all users who have logged on during the last calendar month:

``` sql
SELECT
  Domain,
  Username,
  LastLogin
FROM tbUser
  LEFT  JOIN tbDomain ON tbUser.DomainId = tbDomain.DomainId
WHERE
  LastLogin BETWEEN #STARTPREVIOUSMONTH AND #ENDPREVIOUSMONTH
```

> **Note:** As of Secret Server 7.8.000048, the #STARTWEEK and #ENDWEEK parameters are available.

## Coloring Your Reports

Another option when creating reports is to include a Column in your SQL query called "Color" this will give the row that particular color. See [HTML Color Names](https://www.w3schools.com/tags/ref_colornames.asp).

For example, to show users who haven't logged in within 90 days in Red:

``` sql
SELECT DisplayName
  CASE
    WHEN LastLogin < GetDate() - 90 THEN 'Red'
    ELSE 'White'
  END AS Color
FROM tbUser
```


