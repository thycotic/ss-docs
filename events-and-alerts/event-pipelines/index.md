[title]: # (Event Pipelines)
[tags]: # (Event Pipelines)
[priority]: #

# Event Pipelines

## Overview

*Event pipelines* (EPs) are a named group of triggers, filters, and tasks to manage events and responses to them. Event pipelines themselves can be grouped into EP policies. The SS EP system is essentially a flexible instruction set builder and manager for controlling events and responses. 

## Definitions

### Event Pipelines

An EP is a single named group of triggers, filters, and tasks. The same EP can be in multiple EP policies. Changing an EP affects all EP policies that EP is a part of. EPs do nothing if not assigned to an EP policy.

### Event Pipeline Policies

An EP *policy* is a named grouping of EPs. EP policies can target secret policies or folders. EP policies have no effect if the EP policy has no target. Similarly, an EP policy with no assigned EPs does nothing.

### Event Pipeline Filters

EP *Filters* are parameters that limit when an EP runs. All Filters have settings and can be added to an EP multiple times. The filters are:

- Custom Variable
- Group
- Policy on a Secret
- Role
- Role Permission
- Secret Access Role Permission
- Secret Field
- Secret has Field
- Secret has RPC enabled
- Secret Name
- Secret Setting
- Secret Template
- Site

All filters prompt you for additional information when you select them.

### Event Pipeline Policy Targets

EP policy *targets* are SS folders or secret policies that are the *subject* and EP policy is applied to. The secrets inside the folders or secrets under the secret policies trigger the EPs in an EP policy. As targets, folders are not recursive—only the secrets directly in the folder can trigger an EP. 

> **Note:** EP targets are *not* the receivers of task action. Those receivers are usually components of SS. The term *target* is instead used for the *subject* of an EP policy—the policy targets the secret in the policy or folder to trigger the EPs to process.

### Event Pipeline Tasks

EP *tasks* are actions, which are triggered in an EP, assuming any filtering conditions are met. 

> **Note:** EP targets are *not* the receivers of task action. Those receivers are usually components of SS. The term *target* is instead used for the *subject* of an EP policy—the policy targets the secret in the policy or folder to trigger the EPs to process.

The tasks are:

- Add Custom Audit

- Add Share
- Assign Secret Policy
- Assigning Site to Secret
- Change Password Remotely
- Change Secrets to not require a comment when viewed
- Change Secrets to not require Check Out
- Change Secrets to require Check Out
- Change Secrets to require Comment on View
- Change to Inherit Permissions
- Delete
- Disable Auto Change
- Disable Heartbeat
- Edit Share
- Enable Heartbeat
- Expire Secrets
- Fail with a message
- Hide Launcher Password
- Move To Folder
- Post Slack Message (WebHook)
- Retry with new random password
- Run Heartbeat
- Run Script
- Schedule Pipeline
- Send Email to Event User
- Send Email To Group
- Send Email To List
- Send Email To Owners
- Set Custom Variable
- Set Privileged Account
- Stop RPC
- Undelete
- Unhide Launcher Password
- Update Secret by field
- Update Secret Name
- Update Secret with a script
- Update Secrets to automatically change the password

### Triggers

EP *triggers* are events in SS that cause the EP to begin processing. All triggers have no settings and can only be added to an EP once. The triggers are:

- Access Approved
- Access Denied
- Cache View
- Check In
- Check Out
- Copy
- Create
- Custom Audit
- Custom Password Requirement Added To Field
- Custom Password Requirement Removed From Field
- Delete
- Dependency Added
- Dependency Deleted
- Dependency Failure
- Edit
- Expired Today
- Expires in 1 Day
- Expires in 15 Days
- Expires in 3 Days
- Expires in 30 Days
- Expires in 45 Days
- Expires in 60 Days
- Expires in 7 Days
- Export
- File Save
- Heartbeat Failure
- Heartbeat Success
- Hook Create
- Hook Delete
- Hook Edit
- Hook Failure
- Hook Success
- Launch
- Password Change
- Password Change Failed
- Password Change Maximum Attempts Reached
- Password Copied to Clipboard
- Password Displayed
- Pre-CheckOut
- Secret Policy Change
- Session Recording View
- Undelete
- View
- Viewed Secret Edit
- Web Password Fill


## Permissions

There are three permissions: 

- **Administer Pipelines:** Allows the user to create, edit, and remove EPs and EP policies.
- **Assign Pipelines:** Allows the user to assign an EP policy to secret policies, or folders.
- **View Pipelines:** Allows the user to view EP policies and policy activities.

## Procedures

### Event Pipelines

#### Activating or Deactivating Event Pipelines

To control if an EP is available to all EP policies, you can toggle the EP’s active status:

1. Go to the **Event Pipelines** page.
1. Click the **Pipelines** tab.
1. Locate the card for the EP you want to activate or deactivate.
1. Click the **Active/Inactive** toggle button. A confirmation popup appears.
1. Click the **OK** button. The EP’s status is changed for all EP policies it belongs to.

#### Creating New Event Pipelines

> **Note:** You can create EPs from the Event Pipelines list (shown below) or an EP policy’s details view. With the former method, you will have to add the EP to an EP policy separately. With the latter method, the EP is automatically added to the EP policy you are viewing. You can later manually add additional EPs to the policy as desired.

To create a new EP:

##### Step One: Create EP

1. Go to the **Event Pipeline** page.
1. If necessary, click the **Pipelines** tab. The Event Pipeline Pipelines page appears.
1. Click the **Add Pipeline** button. The New Pipeline popup page appears.
1. Click to select the **Create New Pipeline** selection button.
1. Click the **Create** button. The New Pipeline wizard appears on the Choose Triggers page.

##### Step Two: Add Triggers

1. In the **Add Triggers** section, click the **+** button next to the triggers you desire. You can also search for a trigger by typing in the search text box. The selected triggers appear in the Selected Triggers list. Consider the following when selecting triggers:

   - Currently triggers are centralized around events that are linked to a secret.
   - You can add multiple triggers.
   - You can limit when the EP runs by adding filters.
   - Multiple triggers are logically ORed (not XORed) together. Each trigger is considered individually, and only one needs to apply for the EP to run—if concurrent triggers do not apply, it does not matter. If multiple triggers do apply, the EP will only run once per EP policy.
1. Click the **Next** button. The Choose Filters page of the wizard appears.

##### Step Three: Add Filters

1. Use the exact same method to add filters to the EP. All filters present a popup page for you to provide additional information when you click on them. Consider the following when selecting filters:

   - Whereas triggers focused on secrets, filters can access secret and user information.
   - Because the same filter can differ by its settings, you can add the same filter multiple times to an EP.
   - Filters are logically ANDed together—all filters apply at once and all matter.
1. Click the **Next** button. The Choose Tasks page of the wizard appears.

##### Step Four: Choose Tasks

1. Use the exact same method to add tasks to the EP. Many tasks present a popup page for you to provide additional information when you click on them.  

1. Set the task order. Tasks run in order of their appearance in the **Task** tab of the **Event Pipeline** page. To change the task running order, hover the mouse pointer over the one you want to move, and use the anchor on the left of its card to drag the task to the order you wish it to run. If a Task fails, then the following tasks will not run.

   > **Warning:** Tasks are very powerful and thus can be dangerous. You can alter SS in dramatic, sometimes irreversible ways. We strongly recommend testing EPs in a safe sandbox environment before applying them to production SS servers.

1. Click the **Next** button. The Name Pipeline page of the wizard appears.

1. Type the EP’s name in the **Pipeline** text box.

1. Type a description of the EP in the **Pipeline Description** text box.

1. Click the **Save** button.

#### Editing Existing Event Pipelines

To create an EP:

1. Go to the **Event Pipeline** page.
1. If necessary, click the **Pipelines** tab. The Event Pipeline Pipelines page appears.
1. Click the title of the card representing the EP you want to edit. The EP wizard appears.
1. See [Creating New Event Pipelines](#creating-new-event-pipelines) for instructions on using the wizard.

#### Viewing Event Pipelines

Because EPs are not directly tied to a single EP policy, they can be viewed through an EP policy or directly from the EP list. The EP list is a tab on the main Event Pipeline Policy page directly after navigating from the Admin page. After selecting an EP policy, its associated EPs are displayed in cards.

### Event Pipeline Policies

#### Activating or Deactivating Event Pipeline Policies

To control if an EP policies is available, you can toggle the EP policy’s active status:

1. Go to the **Event Pipelines** page.
1. If necessary, click the **Policies** tab.
1. Locate the card for the EP policy you want to activate or deactivate.
1. Click the **Active/Inactive** toggle button. A confirmation popup appears.
1. Click the **OK** button. The EP policy’s status is changed.

> **Note:** The EPs belonging to the EP policy remain available to other EP policies. 

#### Assigning Folders and Secret Policies to Event Policy Targets

##### Folders

1. Go to the **Event Pipeline** page.
1. If necessary click the **Policies** tab. The Event Pipeline Policies page appears.
1. Click the title of the EP policy on its card on the **Event Pipeline Policies** page. The page for that EP policy appears.
1. Click the **No Folder Selected** link in the **Targets** section. A destination page appears. 
1. Click to select the check boxes for the desired target folders in the tree. Click the tiny arrow next to the check box to expand the tree. Remember, selecting a folder does *not* automatically select its subfolders.
1. Click the **Save** button.

##### Secret Policies

1. Click **Admin > Secret Policies**. The Secret Policy page appears.
1. Click the desired secret policy’s name in the list. The Secret Policy page for that policy appears.
1. Click the **Edit** button. The list becomes editable.
1. Click the **Event Pipeline Policy** dropdown list in the **Security Setting** section and select **Enforced**.
1. Click the **Save** button. All secrets under that secret policy are now affected by the EP policy.

#### Creating, Importing, and Duplicating Event Pipeline Policies

> **Note:** Newly added EP policies are deactivated by default.

1. Click **Admin \> See All**.
1. Click the **Action** button and select **Event Pipeline Policy**.
1. If you plan to duplicate an existing EP policy, click the card for that policy in the **Event Pipeline Policies** list. 
1. Click the **Add Policy** button, and you will be presented with the following options:
   - **Create New Policy:** Click the selection button, and type a name in the **Policy Name** text box, and optionally type a description in the **Policy Description** text box. 
   - **Import Policy:** Import an exported EP policy in JSON format. This can be a policy exported from a separate SS instance. Click the selection button, and paste the JSON payload in the **Add Policy** text box, click the **Create** button.
   - **Duplicate Selected Policy:** Copy an existing EP policy. Click the selection button, and then click the **Create** button. 
   
    The new EP appears in the Event Pipeline Policies list.

#### Monitoring Event Pipeline Policies

There are two ways to monitor your EP policy:

- **Audit:** Shows changes to EP policies, targets, and EPs. Click the **Audits** tab on the **Event Pipeline Policies** page.
- **Activity:** Shows the actions each EP policy or single EP took each time it is triggered. This includes failures, skips, and successes. Click the card for the desired EP policy, and then click the **View Policy Activity** button on the right. Alternatively, you can click the title on the card. When the page for the EP policy appears, click the **Activity** tab.

#### Ordering Event Pipelines in Event Pipeline Policies

Event Pipelines run in order they appear in the EP policy. Since EPs can be in multiple EP policies, the order is unique to each policy. To change the EP order in the EP policy:

1. Go to the **Event Pipeline Policies** page.
1. Click the name on the card for the EP policy you want to edit. The policy’s page appears on the Details tab.
1. Hover the mouse pointer over the EP you want to reorder. An anchor appears on the left of the card.
1. Drag that anchor to the desired position. 

> **Note:** If an error occurs in a policy’s EP, then the following EP  still runs.

#### Removing Event Pipelines from Event Pipeline Policies

To remove an EP from an EP:

1. Go to the **Event Pipeline Policies** page.
1. Click the name on the card for the EP policy you want to edit. The policy’s page appears on the Details tab.
1. Click on an EP in the details of an EP policy. A panel appears on the right of the page.
1. Click the **Remove Pipeline** button.

> **Note:** The button removes the EP from the EP policy, but it does not remove it from SS. Other EP policies using the EP still have access to it. 

## Infinite Loops

It is possible for EPs to trigger each other over and over in an endless loop. For example:

1. Editing a secret triggers one EP to run a heartbeat on the secret.
1. The heartbeat triggers another EP to edit the secret. 
1. Editing the secret triggers the original EP to run another heartbeat, restarting the cycle, creating an infinite feedback loop.

Fortunately, SS detects these loops and automatically deactivates the involved EPs. So, if you have EPs that seem to be deactivating themselves, look for circular logic paths involving the EPs.

> **Note:** By default, pipelines are configured to consider any event that executes five tasks within five minutes from the same trigger as an infinite loop. For example, "secret edit" is selected as a pipeline trigger, and "remote password change" is selected as the task. After the first edit is made on a secret, an RPC is triggered. Every time the RPC completes, a new edit is triggered, which, in turn, triggers another RPC. If this happens five times within five minutes, then an infinite loop is declared. If the RPC is slow, taking more than five minutes for five password changes to occur, then an infinite loop is **not** declared. In this case, use the “configuration advanced” page to change "event pipelines infinite loop time (minutes)" to a longer time.