[title]: # (Assigning Workflows to Secret Policies)
[tags]: # (Workflow)
[priority]: # (1000)

# Assigning Workflows to Secret Policies

1. Click **Admin > Secret Policy**. The Secret Policy page appears:

   ![image-20210310101401078](images/image-20210310101401078.png)

1. For this instruction, we are going to create a new policy.

1. Click the **+ Create New** button. Another Secret Policy page appears:

   ![image-20210310101506872](images/image-20210310101506872.png)

1. Type the new policy name in the **Secret Policy Name** text box.

1. Scroll down the page to the **Security Settings** section of the unlabeled table.

1. Click the **Enable Requires Approval for Access** list and select **Enforced**.

1. Click to select the check box next to the list. The Assign Approvers popup page appears:

   ![image-20210310101842740](images/image-20210310101842740.png)

1. Click the **Cancel** button. The Request Access Approvers setting become enabled:

   > **Note:** You cannot set approvers and use a workflow at the same time. The intent of the next few instructions is avoid attempting to do so, which causes an error.

   ![image-20210310102657467](images/image-20210310102657467.png)

1. Click the **Request Access Approvers** list and select **Not Set**.

1. Click the **Request Access Workflow** list and select **Enforced**. A new list appears alongside:

   ![image-20210310102756952](images/image-20210310102756952.png)

1. Click the new unlabeled list and select the access template workflow to associate with the policy.

1. Click the **Save** button at the bottom of the page. The policy is now available for assignment to secrets and folders, just like any other policy.
