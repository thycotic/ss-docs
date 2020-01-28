[title]: # (Resetting a DoubleLock Password)
[tags]: # (XXX)
[priority]: # (70)

# Resetting a DoubleLock Password

When users forget their doublelock passwords, there are multiple steps and considerations. Data loss may or may not result from resetting:

1. When you forget your doublelock password, you typically come to that realization when attempting to access a secret protected by that doublelock:

   ![1557345036694](assets/1557345036694.png)

1. Click the **Forgot DoubleLock Password?** link. The Reset DoubleLock Password page appears:

   ![1557345196279](assets/1557345196279.png)

1. At this stage, there are two possibilities:

   - You are the only one with access to the doublelocked secret: When you reset the doublelock password, the secret and its data is deleted. **This is permanent**.
   - Others have access to the secret via that doublelock: You can reset the doublelock, and you lose access to the secret, but it is not deleted. You must ask one of those others to re-assign you to the doublelock after you reset it.

1. Type your main SS password in the **Login Password** text box.

1. Click the **Reset DoubleLock Password** button. The password is reset, and if you are the only one with access to it, the secret is deleted.

1. (Optional) Ask one of the others with the doublelock password to re-assign you to the doublelock.
