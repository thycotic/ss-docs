[title]: # (Customizing Access Request Emails)
[tags]: # (Access Requests)
[priority]: # (1000)

# Customizing Access Request Emails

When implementing the "Requires Approval For Access" feature to force a user to request access to a Secret and "Allow Approval For Access from Email" is turned on, an email with approval links is sent out to all the approvers. To customize this email, follow the steps below:

1. Find the Secret Server directory, which is typically `C:\inetpub\wwwroot\SecretServer`
1. Under the `customresources` directory:

   * If it does not already exist, create a directory named by a digit corresponding to your language Locale ID (LCID). For English, use the digit `9`.
   * If it does not already exist, create a `pages.xml` file.
   * Insert the code below into `pages.xml` The hours value can be any integer greater than 0:

    ````XML
    <resources>
     <page name="legacyhome.aspx">
      <control controlId="SearchTermTextBox">
        <property name="ToolTip" value="This is a customer set resource." />
      </control>
     </page>
    <messages>
  
      <message name="SecretAccessRequestEmailSubject">Application : {0}, Secret : {1}, Requestor : {2}</message>
      <message name="SecretAccessRequestEmailMessage">Requestor : {0}{2}Secret : {1}{2}Beginning : {6}{2}Ending : {7}{2}Reason : {3}{2}Link : {4}{2}Ticket Number : {5}{2}Secret Field : #$DOMAIN#</message>
  
      <message name="SecretAccessRequestEmailMessageApprovalPart">
        <![CDATA[
        Approve for 3 hours from start date: #URL#RequestApproval.aspx?op=approve&id=#UNIQUEID#&hours=3
       
        Approve for 24 hours from start date: #URL#RequestApproval.aspx?op=approve&id=#UNIQUEID#&hours=24
        
        Deny Request:  #URL#RequestApproval.aspx?op=deny&id=#UNIQUEID#
        ]]>
      </message>
      <message name="SecretAccessRequestEmailMessageTicketReferencePart">{0}{1}</message>
    </messages>
    </resources>
    ````

      `#URL#` = the URL of your Secret Server instance

      `#UNIQUEID#` = the approver's unique ID

      hours = X is the number of hours approval will apply

      `#$SECRETFIELD#` = the name of a Secret Field

      For example #$MACHINE# will be replaced with the value from the machine field on the Secret. If no field with that name is present, it will be blanked out. Please note the location of the field name in the xml. The fields will not resolve in the CDATA section.
  
1. Perform IIS reset
