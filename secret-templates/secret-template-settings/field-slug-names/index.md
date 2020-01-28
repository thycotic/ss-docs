[title]: # (Field Slug Names)
[tags]: # (XXX)
[priority]: # (30)

# Field Slug Names

A *field slug name* in SS is a unique human-readable identifier for a data field in a SS template. The field slug name is available for integrating third-party applications via API calls. Slug names are programmatically available for API calls but are not visible to users of the template (those creating secrets).

> **Note:** If you are not planning to access SS with an API, slug field names are not for you—leave the suggested name as is.

**Figure:** Field Slug Name in a Secret Template

![](assets/image-20191101144814839.png)

Field slug names are automatically generated, based on the field name, when the field is created. For example, “User Name” became “user-name.” Characters that are potentially problematic for programming, such as spaces, are swapped out. The automatically generated name is unchangeable by human users, unlike the field name. If API calls were based on the field name, human users with access to the template could break those calls, simply by changing the name. 

With SS 10.7.X+, The generated field slug names are now user-definable. You can edit the generated names to:

- Conform to a naming convention used in your API calls.
- Maintain the same name for a field across secret templates to simplify coding by developers.

The only requirement is that each slug field name is unique to that template.

> **Note:** If you are wondering how SS internally uniquely identifies fields, there is an internal ID that is not accessible by users or APIs. It is not available read-only (for API use) because we want to futureproof integrations from internal changes to SS.

> **Note:** The user-definable field slug names are also automatically generated when you upgrade from a version of SS that did not have user-defined field slug names. If there are two fields with the same field name, the second (and later) generated field slug name has an incremented number appended to it.
