[title]: # (Using a DoubleLock )
[tags]: # (XXX)
[priority]: # (80)

# Using a DoubleLock 

As an admin, to use doublelocks on a secret, you must first create complete these steps for a new doublelock:

1. One time: Create a doublelock password (one time per user). This is automatically required of you when you create a doublelock or access a secret with an existing one (that somebody else assigned to you). You can also create one manually ahead of time.
1. One time: Create a doublelock, which can be used on multiple secrets by multiple users.
1. One or more times: Assign the doublelock to a secret or secret template.
1. One time per user: Assign the user to that doublelock. Users without an existing doublelock password are required to create one.
1. Unlimited times: A user unlocks the doublelock with his doublelock password, which in turn gives the user access to the secret associated with the doublelock (every time the user wants access to the secret). 
