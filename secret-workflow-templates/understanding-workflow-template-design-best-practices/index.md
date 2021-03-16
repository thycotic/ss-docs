[title]: # (Understanding Workflow Design Best Practices)
[tags]: # (Workflow)
[priority]: # (1000)

# Understanding Workflow Design Best Practices

Consider the following when setting up an access-request workflow:

- Use multiple-step approval workflows when you need to have different people (such as different departments) sign off on an approval request.
- We do not recommend assigning equally important approvers or groups to multiple steps. Having a single step with multiple approvers works better. Remember, steps are best used for hierarchal approval--an approval chain.
- A reviewer can only respond to a request once. If you have the same user as a reviewer in multiple steps, that approver cannot respond if he or she already responded on an earlier step. In addition, the reviewer's earlier approval does **not** count towards the number of approvals required in later steps. Thus, if you want to assign the same user as a reviewer in multiple steps, make sure that you have enough reviewers in each step to approve without that user.
- A well-crafted workflow design ensures there are enough approvers in a group to satisfy the multiple approver (x of n reviewers must approve) requirement, but group membership can change after the workflow is created. Thus, if you remove members from groups used by workflows, ensure there are still enough members in those groups to approve requests.
- Once a workflow step times out, only the reviewers in the next step can approve the request. If you want reviewers from the initial step to respond after the initial request has timed out, add them to the reviewers of the next step.
