[title]: # (REST API Client Generation)
[tags]: # (REST API,API,Scripting,PowerShell,Swagger,OpenAPI)
[priority]: # (1000)

# REST API Client Generation with OpenAPI Swagger

Secret Server (SS) contains an OpenAPI Swagger specification file that describes the REST API endpoints. There are several Swagger-based tools available to generate clients. This document describes using some popular ones to generate clients for different languages including C#, Java, and PowerShell. The generated client facilitates calling the SS REST API and indicates API changes with new SS versions.

> **Note:** Please use the article quick links on the right to jump to the section you are interested in.

## Generating Clients

### C# Client Using NSwagStudio

1. Download and install NSwagStudio ( https://github.com/RicoSuter/NSwag/wiki/NSwagStudio )

1. Copy and paste the `swagger.json` file for "Documentation for token authentication." This is located at:
   `{Your SecretServer Base Url}/Documents/restapi/OAuth/swagger.json`

1. Suggested settings:

   - Namespace: SecretServerAuthentication
   - Inject HttpClient via constructor
   - Generate default values for properties

1. Generate output.

1. Copy output into a C# file in solution.

1. Copy and paste the swagger.json for "Documentation for REST API using bearer token authentication." It is located at `{Your SecretServer Base Url}/Documents/restapi/TokenAuth/swagger.json`.

1. Suggested Settings:

   - Namespace: SecretServerRestClient
   - Inject HttpClient via constructor
   - Generate default values for properties

1. Generate output.

1. Copy output into a C# file in solution

``` csharp
// Authenticate:
var httpClient = new HttpClient();
var tokenClient = new SecretServerAuthentication.Client("https://secretserver.url.local/ss", httpClient);
var token = tokenClient.TokenAsync("username", "password", Grant_type.Password);
var tokenResult = token.Result;

// Set credentials (token):
httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", tokenResult.Access_token);

// Call REST API:
var client = new SecretServerRestClient.SecretsServiceClient("https://secretserver.url.local/ss/api/v1", httpClient);
var search = client.SearchAsync(sortBy0_name: "lastHeartBeatStatus", sortBy0_direction:"asc");
var results = search.Result;
```

### C# or .NET Core Client Using OpenAPI Generator

>**Note:** These client-generation instructions were written with OpenAPI Generator version 2.4.3, which was the latest version at the time. Future versions may fix issues that necessitated some workarounds. If you are using a newer version, you may need to make adjustments.

> **Note:** These instructions assume that you have Java and .NET Core installed on your machine. They should work on all systems, but the syntax will need to be tweaked for other shells.

1. Follow the steps in [Getting OpenAPI Generator](#Getting-OpenAPI-Generator).

2. Store the path to the relevant `swagger.json` files as variables. These variables can be either a local file path or a URL.

``` javascript
$oauthSwagger = 'OAuth/swagger.json'
$tokenAuthSwagger = 'TokenAuth/swagger.json'
```

3. Run the following commands to generate the necessary clients. You can run `java -jar openapi-generator-cli.jar help generate` to see advanced options that you may wish to configure.

```shellscript
java -jar openapi-generator-cli.jar generate -i $oauthSwagger -g csharp-netcore --skip-validate-spec --package-name SecretServerOAuth --remove-operation-id-prefix --additional-properties=netCoreProjectFile=true -o oauth-csharp
java -jar openapi-generator-cli.jar generate -i $tokenAuthSwagger -g csharp-netcore --skip-validate-spec --package-name SecretServerTokenAuth --remove-operation-id-prefix --additional-properties=netCoreProjectFile=true -o tokenauth-csharp
```

4. Edit several files to fix a bug in OpenAPI Generator. OpenAPI Generator generates code that uses the [null-coalescing operator](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/null-coalescing-operator) with non-nullable enums, which is invalid C#.

5. For PowerShell:

```powershell
(Get-Content -Path .\tokenauth-csharp\src\SecretServerTokenAuth\Model\WorkflowTemplateCreateArgs.cs) | Foreach-Object {$_ -replace 'this\.WorkflowType = workflowType \?\? throw new ArgumentNullException\("workflowType is a required property for WorkflowTemplateCreateArgs and cannot be null"\);;', 'this.WorkflowType = workflowType;'} | Set-Content -Path .\tokenauth-csharp\src\SecretServerTokenAuth\Model\WorkflowTemplateCreateArgs.cs
(Get-Content -Path .\tokenauth-csharp\src\SecretServerTokenAuth\Model\Sort.cs) | Foreach-Object {$_ -replace 'this\.Direction = direction \?\? throw new ArgumentNullException\("direction is a required property for Sort and cannot be null"\);;', 'this.Direction = direction;'} | Set-Content -Path .\tokenauth-csharp\src\SecretServerTokenAuth\Model\Sort.cs
```
6. For Mac (untested):

```shellscript
sed -i '' -e 's/this.WorkflowType = workflowType ?? throw new ArgumentNullException("workflowType is a required property for WorkflowTemplateCreateArgs and cannot be null");;/this.WorkflowType = workflowType;/g' tokenauth-csharp/src/SecretServerTokenAuth/Model/WorkflowTemplateCreateArgs.cs
sed -i '' -e 's/this.Direction = direction ?? throw new ArgumentNullException("direction is a required property for Sort and cannot be null");;/this.Direction = direction;/g' tokenauth-csharp/src/SecretServerTokenAuth/Model/Sort.cs
```

7. For Linux (tested on bash, should work on other shells):

```shellscript
sed -i -e 's/this.WorkflowType = workflowType ?? throw new ArgumentNullException("workflowType is a required property for WorkflowTemplateCreateArgs and cannot be null");;/this.WorkflowType = workflowType;/g' tokenauth-csharp/src/SecretServerTokenAuth/Model/WorkflowTemplateCreateArgs.cs
sed -i -e 's/this.Direction = direction ?? throw new ArgumentNullException("direction is a required property for Sort and cannot be null");;/this.Direction = direction;/g' tokenauth-csharp/src/SecretServerTokenAuth/Model/Sort.cs
```

8. Build the packages in release mode:

```shellscript
dotnet build -c Release oauth-csharp/src/SecretServerOAuth
dotnet publish -c Release tokenauth-csharp/src/SecretServerTokenAuth
```

9. Add the necessary .dll files to your project. The DLLs are located at the paths below:

```
oauth-csharp/src/SecretServerOAuth/bin/Release/netstandard2.0/SecretServerOAuth.dll
tokenauth-csharp/src/SecretServerTokenAuth/bin/Release/netstandard2.0/publish/*.dll
```

10. Test the API. For example:

```csharp
// set to the root of the Secret Server instance with no trailing slash
const string basePath = "https://thycotic.com/SecretServer";

// DO NOT USE THIS IN PRODUCTION! this is an example for simplicity
const string ssUsername = "myUsername";
const string ssPassword = "myPassword";

var oauthConfig = new SecretServerOAuth.Client.Configuration();
var tokenAuthConfig = new SecretServerTokenAuth.Client.Configuration();

oauthConfig.BasePath = basePath;
tokenAuthConfig.BasePath = $"{basePath}/api/v1";

var authApi = new AuthenticationApi(oauthConfig);
var token = await authApi.AuthorizeAsync(ssUsername, ssPassword, "password");

Console.WriteLine($"Token: {token.AccessToken}");

// Do not use tokenAuthConfig.AccessToken
// This method can be called repeatedly as the access token expires, old values will be overwritten
tokenAuthConfig.AddApiKey("Authorization", $"{token.TokenType} {token.AccessToken}");

var foldersApi = new FoldersApi(tokenAuthConfig);
var folder = await foldersApi.GetAsync(11);

Console.WriteLine(folder);
```

### Java Client Using OpenAPI Generator

>**Note:** These client-generation instructions were written with OpenAPI Generator version 2.4.3, which was the latest version at the time. Future versions may fix issues that necessitated some workarounds. If you are using a newer version, you may need to make adjustments.

> **Note:** These instructions assume that you have Java configured on your machine. JDK 8 or greater is required. These instructions should work on all systems, but the syntax will need to be tweaked for other shells.

1. Follow the steps in [Getting OpenAPI Generator](#Getting-OpenAPI-Generator).

2. Store the path to the relevant `swagger.json` files as variables. These variables can be either a local file path or a URL.

```javascript
$oauthSwagger = 'OAuth/swagger.json'
$tokenAuthSwagger = 'TokenAuth/swagger.json'
```

3. Run the following commands to generate the necessary clients. You can run `java -jar openapi-generator-cli.jar help generate` to see advanced options that you may wish to configure.

```shellscript
java -jar openapi-generator-cli.jar generate -i $oauthSwagger -g java --skip-validate-spec --invoker-package secretserver.oauth.client --api-package secretserver.oauth.api --model-package secretserver.oauth.model --group-id secretserver --artifact-id secretserver.oauth --remove-operation-id-prefix -o oauth-java
java -jar openapi-generator-cli.jar generate -i $tokenAuthSwagger -g
java --skip-validate-spec --invoker-package secretserver.tokenauth.client --api-package secretserver.tokenauth.api --model-package secretserver.tokenauth.model --group-id secretserver --artifact-id secretserver.tokenauth --remove-operation-id-prefix -o tokenauth-java
```

4. Follow the instructions in `oauth-java/README.md` to include the package in your build process. Alternatively, follow the steps below to generate JAR files and test.

```shellscript
cd oauth-java
mvn clean install -DskipTests # this step will throw errors about HTML documentation generation that can be ignored
cd ..\tokenauth-java
mvn clean install -DskipTests # this step will throw errors about HTML documentation generation that can be ignored
```

5.   Include the following JARs in your project (replace version numbers as necessary):

```shellscript
oauth-java/target/secretserver.oauth-10.7.30.jar
tokenauth-java/target/secretserver.tokenauth-10.7.73.jar
tokenauth-java/target/lib/*.jar
```

6.   Test the JAR files:

```csharp
/*
need to import:
import secretserver.oauth.api.AuthenticationApi;
import secretserver.oauth.model.TokenResponse;
import secretserver.tokenauth.api.FoldersApi;
import secretserver.tokenauth.model.FolderModel;
*/

// set to the root of the Secret Server instance with no trailing slash
String basePath = "https://thycotic.com/SecretServer";

// DO NOT USE THIS IN PRODUCTION! this is an example for simplicity
String ssUsername = "myUsername";
String ssPassword = "myPassword";

secretserver.oauth.client.ApiClient oauthClient = secretserver.oauth.client.Configuration.getDefaultApiClient();
secretserver.tokenauth.client.ApiClient tokenAuthClient = secretserver.tokenauth.client.Configuration.getDefaultApiClient();

oauthClient.setBasePath(basePath);
tokenAuthClient.setBasePath(basePath + "/api/v1");

AuthenticationApi authApi = new AuthenticationApi(oauthClient);
TokenResponse tokenResponse = authApi.authorize(ssUsername, ssPassword, "password"); // async methods are also available
String token = tokenResponse.getAccessToken();

System.out.println(token);

tokenAuthClient.setApiKey(tokenResponse.getTokenType() + " " + token);
FoldersApi foldersApi = new FoldersApi(tokenAuthClient);
FolderModel folderModel = foldersApi.get(11, false, false);
System.out.println(folderModel);
```

### PowerShell Using OpenAPI Generator

>**Note:** These client-generation instructions were written with OpenAPI Generator version 2.4.3, which was the latest version at the time. Future versions may fix issues that necessitated some workarounds. If you are using a newer version, you may need to make adjustments.

> **Note:** These instructions assume that you have Java configured on your machine. JDK 8 or greater is required. Only Windows is supported at this time, though PowerShell Core does work.

1. Follow the steps in [Getting OpenAPI Generator](#Getting-OpenAPI-Generator).

2. Store the path to the relevant `swagger.json` files as variables. These variables can be either a local file path or a URL.

```javascript
$oauthSwagger = 'OAuth/swagger.json'
$tokenAuthSwagger = 'TokenAuth/swagger.json'
```

3. Run the following commands to generate the necessary clients. You can run `java -jar openapi-generator-cli.jar help generate` to see advanced options that you may wish to configure.

```shellscript
java -jar openapi-generator-cli.jar generate -i $oauthSwagger -g java --skip-validate-spec --invoker-package secretserver.oauth.client --api-package secretserver.oauth.api --model-package secretserver.oauth.model --group-id secretserver --artifact-id secretserver.oauth --remove-operation-id-prefix -o oauth-java
java -jar openapi-generator-cli.jar generate -i $tokenAuthSwagger -g java --skip-validate-spec --invoker-package secretserver.tokenauth.client --api-package secretserver.tokenauth.api --model-package secretserver.tokenauth.model --group-id secretserver --artifact-id secretserver.tokenauth --remove-operation-id-prefix -o tokenauth-java
```

4. Replace several invalid values generated by the previous step:

```shellscript
(Get-Content -Path .\tokenauth-ps\src\SecretServerTokenAuth\API\SecretSessionsApi.ps1) | Foreach-Object {$_ -replace '\[SecretServerTokenAuth.Model.System.Guid\]', '[System.Guid]'} | Set-Content -Path .\tokenauth-ps\src\SecretServerTokenAuth\API\SecretSessionsApi.ps1
(Get-Content -Path .\tokenauth-ps\src\SecretServerTokenAuth\Model\New-SecretItemUpdateArgs.ps1) | Foreach-Object { $_ -replace '\[System.Nullable\[String\]\]', '[byte[]]' } | Set-Content -Path .\tokenauth-ps\src\SecretServerTokenAuth\Model\New-SecretItemUpdateArgs.ps1
```

5. Edit one of the build files that will be used in the next step to significantly decrease build time:

```shellscript
Get-ChildItem .\tokenauth-ps\src\SecretServerTokenAuth\*.ps1 -rec | %{ $f=$_; (Get-Content $f.PSPath) | %{ $_ -replace '\[SecretServerTokenAuth.Model.System.Guid\]', '[System.Guid]' } | %{ $_ -replace '\[System.Nullable\[String\]\]', '[byte[]]' } | Set-Content $f.PSPath }
```

6. Run the following commands to build the PowerShell modules. `-Verbose` can be specified if desired.

```shellscript
.\oauth-ps\Build.ps1
.\tokenauth-ps\Build.ps1
```

7. Import both modules:

```shellscript
Import-Module .\oauth-ps\src\SecretServerOAuth
Import-Module .\tokenauth-ps\src\SecretServerTokenAuth
```

8. Set the base path of each module. Only edit the first line below. The value must be the full URL to the root of Secret Server **with no trailing slash**, for example `https://thycotic.com/SecretServer`.

```shellscript
$basePath = 'https://thycotic.com/SecretServer'
[SecretServerOAuth.Client.Configuration]::Default.BasePath = $basePath
[SecretServerTokenAuth.Client.Configuration]::Default.BasePath = "$basePath/api/v1"
```

9. Store the Secret Server credentials to be used:

```shellscript
$cred = Get-Credential -Message 'Enter your Secret Server username/password'
```

10. Store a token by running the following commands:

```shellscript
$token = Invoke-AuthenticationApiAuthorize $cred.UserName $cred.GetNetworkCredential().Password 'password'
```

11. Set the TokenAuth module to use the token:

```shellscript
[SecretServerTokenAuth.Client.Configuration]::Default.AddApiKey('Authorization', "$($token.TokenType) $($token.AccessToken)")
```

12. Test the folder service Get endpoint (replace the ID as needed):

```shellscript
Invoke-FoldersApiGet -id 11
```

> **Note:** The `$token` variable contains a property called `ExpiresIn` that gives the number of seconds in which the token will expire. The endpoint must be called again to generate a new token.

> **Note:** Steps 11 and 12 can be called repeatedly to generate a new token and set it on the auth module.

### Postman Workspace

[Postman](https://www.postman.com/) is a REST client with a GUI to easily test API requests. To automatically generate a workspace with SS API calls, click the **Import** button and choose whether to use a local file or a URL. Ensure the **Generate a Postman Collection** check box is selected. The program appears to be doing nothing while importing, but will inform you of success shortly.

### Insomnia Workspace

[Insomnia](https://insomnia.rest) is a REST client similar to Postman. To automatically generate a workspace with SS API calls, first click the arrow to open the dropdown, then click **Import/Export**. Click **Import Data**, then **From File** or **From URL** as desired.

## Getting OpenAPI Generator

>**Note:** These client-generation instructions were written with OpenAPI Generator version 4.3.0, which was the latest version at the time. Future versions may fix issues that necessitated some workarounds. If you are using a newer version, you may need to make adjustments.

Several sections above require [OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator). You can download it manually from this link or use the commands below.

> **Note:** OpenAPI Generator requires the Java SDK (8 or greater) to be installed and configured.

Windows/PowerShell:

```powershell
Invoke-WebRequest -OutFile openapi-generator-cli.jar https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/4.3.0/openapi-generator-cli-4.3.0.jar
```

Mac or Linux:

```shellscript
wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/4.3.0/openapi-generator-cli-4.3.0.jar -O openapi-generator-cli.jar
```

## Self-Signed or Other Invalid Certificates

If you use an SSL certificate that is self-signed or otherwise not technically valid, OpenAPI Generator throws an error if you try to use a URL to `swagger.json` instead of a local file (or when using the Java client). To fix this, you need to import the certificate into Java's certificate store. The following example commands are  for Windows, but the same concept applies to Mac and Linux as well.

> **Note:** The default password for the cacerts keystore is `changeit`.

Java 8 stores the cacerts keystore in JAVA_HOME unless it was explicitly changed. `keytool` should also be on your PATH if `java` itself is.

```shellscript
keytool -import -keystore "%JAVA_HOME%\jre\lib\security\cacerts" -file "path\to\cert.pem"
```

Java 11 provides a flag on `keytool` to find the cacerts keystore automatically.

```shellscript
keytool -import -cacerts -file "path\to\cert.pem"
```

## Swagger 2.0 Notes

Some features in our REST API are not currently supported in Swagger 2.0. For example, the sort is an array of a complex objects. The actual API will accept multiple sort levels by passing this query string, `paging.sortBy[0].name=secretname&paging.sortBy[1].name=folderid`. The auto-generated client only allows you to specify the first sort by default. To specify multiple sorts, the serialization needs to be customized. We assumed that multiple sorting levels is probably an advanced feature and or choice will work for most.