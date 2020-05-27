[title]: # "Importing Secrets with XML"
[tags]: # "Import,XML,Secrets"
[priority]: # "1000"

# Importing Secrets with XML

The XML file should look like the example below, the comments are for explanation reasons only and may be removed before importing, if desired.

> **Important:** Migration is **not** supported by Thycotic Technical Support.

## Notes

- Leaving the `<Permissions>` tag empty for a folder will cause that folder to inherit permissions from its parent folder.
- Leaving the `<Permissions>` tag empty for a secret will cause it to inherit permissions from its folder.
- To add a line-break within a Notes field use `##BR##`.

> **Note:** Please do **not** edit the XML file with Windows Notepad. Use Notepad++, Visual Studio Code, or Atom to make your edits. Using Notepad increases you chances of importation failure.

## Sample XML

```xml
<?xml version="1.0" encoding="utf-16"?>

<ImportFile xmlns:xsi="[http://www.w3.org/2001/XMLSchema-instance"](http://www.w3.org/2001/XMLSchema-instance) xmlns:xsd="http://www.w3.org/2001/XMLSchema"%3E;

  <Folders>
    <Folder>
      <FolderName>Customers</FolderName>
      <FolderPath>Customers</FolderPath>
      <Permissions>
        <Permission>
          <View>true</View>
          <Edit>true</Edit>
          <Owner>true</Owner>
          <UserName>admin</UserName> 
<!-- Either UserName or GroupName is required in permissions -->
        </Permission>
        <Permission>
          <View>true</View>
          <Edit>false</Edit>
          <Owner>false</Owner>
          <GroupName>Auditors</GroupName>
        </Permission>
      </Permissions>
    </Folder>
    <Folder>
      <FolderName>Customer A</FolderName>
      <FolderPath>Customers\Customer A</FolderPath>
      <Permissions /> 
<!-- Empty Permissions will cause folder to inherit from parent -->
    </Folder>
  </Folders>
<!-- Groups are optional -->
  <Groups> 
    <Group>
      <GroupName>Other Administrators</GroupName>
      <GroupMembers>
        <GroupMember>
          <UserName>admin2</UserName>
        </GroupMember>
        <GroupMember>
          <UserName>DomainAdmin</UserName>
          <Domain>http://testdomain.test.com</Domain>
        </GroupMember>
      </GroupMembers>
    </Group>
    <Group>
      <GroupName>Domain Administrators</GroupName>
      <Domain>http://testdomain.test.com</Domain>
      <GroupMembers>
        <GroupMember>
          <UserName>DomainAdmin</UserName>
          <Domain>http://testdomain.test.com</Domain>
        </GroupMember>
      </GroupMembers>
    </Group>
  </Groups>
  <SecretTemplates>
<!-- You can have multiple secrettype entries -->
    <secrettype>      
      <name>Windows Account</name>
      <active>true</active>
      <fields>
        <field isexpirationfield="false">
          <name>Resource URL</name>
          <mustencrypt>false</mustencrypt>
          <isurl>false</isurl>
          <ispassword>false</ispassword>
          <isnotes>false</isnotes>
          <isfile>false</isfile>
          <passwordlength>0</passwordlength>
           <historylength>0</historylength>
          <isindexable>false</isindexable>
        </field>
        <field isexpirationfield="false">
          <name>Username</name>
          <mustencrypt>false</mustencrypt>
          <isurl>false</isurl>
          <ispassword>false</ispassword>
          <isnotes>false</isnotes>
          <isfile>false</isfile>
          <passwordlength>0</passwordlength>
           <historylength>0</historylength>
          <isindexable>false</isindexable>
        </field>
        <field isexpirationfield="false">
          <name>Password</name>
          <mustencrypt>true</mustencrypt>
          <isurl>false</isurl>
          <ispassword>true</ispassword>
          <isnotes>false</isnotes>
          <isfile>false</isfile>
          <passwordlength>12</passwordlength>
<!-- Use this number for 'All' history -->
           <historylength>2147483647</historylength> 
          <isindexable>false</isindexable>
        </field>
        <field isexpirationfield="false">
          <name>Notes</name>
          <mustencrypt>false</mustencrypt>
          <isurl>false</isurl>
          <ispassword>false</ispassword>
          <isnotes>true</isnotes>
          <isfile>false</isfile>
           <passwordlength>0</passwordlength>
          <historylength>0</historylength>
          <isindexable>true</isindexable>
        </field>
      </fields>
      <expirationdays>0</expirationdays>
    </secrettype>
 </SecretTemplates>
 <Secrets>
    <Secret>
      <SecretName>Test Secret</SecretName>
      <SecretTemplateName>Windows Account</SecretTemplateName>
      <FolderPath>Customers\Customer A</FolderPath>
      <Permissions>
        <Permission>
          <View>true</View>
          <Edit>true</Edit>
          <Owner>false</Owner>
          <GroupName>IT Admins</GroupName>
        </Permission>
        <Permission>
          <View>true</View>
          <Edit>true</Edit>
          <Owner>true</Owner>
          <UserName>admin</UserName>
        </Permission>
      </Permissions>
      <SecretItems>
        <SecretItem>
          <FieldName>Resource URL</FieldName>
          <Value>10.10.0.25</Value>
        </SecretItem>
        <SecretItem>
          <FieldName>Username</FieldName>
           <Value>Administrator</Value>
        </SecretItem>
        <SecretItem>
          <FieldName>Password</FieldName>
          <Value>D*KGY#$5</Value>
        </SecretItem>
        <SecretItem>
          <FieldName>Notes</FieldName>
          <Value>Just some notes##BR##...and some more notes on a new line. </Value>
        </SecretItem>
      </SecretItems>
    </Secret>
    <Secret>
      <SecretName>Another Test Secret</SecretName>
      <SecretTemplateName>Windows Account</SecretTemplateName>
      <FolderPath>Customers\Customer A</FolderPath>
<!-- Empty Permissions causes secret to inherit from folder -->
      <Permissions />
      <SecretItems>
        <SecretItem>
          <FieldName>Resource URL</FieldName>
          <Value>10.10.0.25</Value>
        </SecretItem>
        <SecretItem>
          <FieldName>Username</FieldName>
          <Value>JSmith</Value>
        </SecretItem>
        <SecretItem>
          <FieldName>Password</FieldName>
          <Value>DKud3()DS</Value>
        </SecretItem>
         <SecretItem>
          <FieldName>Notes</FieldName>
          <Value>This line has an empty line##BR####BR##in between this line.</Value>
        </SecretItem>
      </SecretItems>
      <SecretDependencies> 
<!-- Secret dependencies are optional, and there can be multiple ones -->
        <SecretDependency>
          <Active>true</Active>
          <Restart>true</Restart>
          <Description>Some Dependency</Description>
          <MachineName>192.168.99.1</MachineName>
          <DependencyName>Some Service</DependencyName>
          <Type>Windows Service</Type>
<!-- Leave this blank to not use a PrivilegedAccount -->
          <PrivilegedAccount>Some Account</PrivilegedAccount> 
          <WaitBeforeSeconds>10</WaitBeforeSeconds>
        </SecretDependency>
      </SecretDependencies>
    </Secret>
  </Secrets>
</ImportFile>

```