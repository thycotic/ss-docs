[title]: # (Creating Custom Dependencies)
[tags]: # (XXX)
[priority]: # (30)

# Creating Custom Dependencies

If there are different dependency types that you want to manage that are not supported out of the box, new ones can be created based on a script. A custom dependency consists of two components:

- **Dependency Template:** The dependency template defines how a dependency is matched to discovered accounts and how it updates the target after a password change occurs on the account. to create a new dependency template, go to **Admin \> Secret Templates** and click the **Dependency Templates** button.

- **Dependency Changer**: A dependency changer is a script and the associated parameters to be passed into the script. Dependency changers can be created and modified by going to **Admin > Remote Password Changing > Configure Dependency Changers**.

> **Note:** Please see the [Secret Server Account Discovery Guide](https://thycotic.force.com/support/s/article/Account-Discovery) for a comprehensive guide to configuring and using dependency changers and dependency templates.
