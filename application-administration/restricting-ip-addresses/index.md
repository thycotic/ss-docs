[title]: # (Restricting IP Addresses)
[tags]: # (XXX)
[priority]: # (40)

# Restricting IP Addresses

IP address restrictions allow you to control which IP address ranges users can use to log in to SS.

### Creating IP Address Ranges

To create an IP address range:

1. Go to **Admin > IP Addresses** under Administration. The IP Address Management page appears:

   <img src="assets/image-20191115104938922.png" alt="image-20191115104938922" style="zoom:67%;" />

2. Click the **New IP Address** button. The Add New IP Address Range popup page appears:

   <img src="assets/image-20191115105135800.png" alt="image-20191115105135800" style="zoom:67%;" />

3. In the **IP Address User/Network Name** text box, type a descriptive name for your range.

4. In the **IP Address Range** text box, enter an IP Address or IP Address range. SS supports single IP Addresses (10.0.0.4), a range separated by a hyphen (10.0.0.1-10.0.0.255), and CIDR notation (10.0.0.0/24).

5. Click the **Save** button. The new address or range appears in the IP Address Management table:

   <img src="assets/image-20191115105415863.png" alt="image-20191115105415863" style="zoom:67%;" />

> **Note:** You can show or hide columns in the table by clicking the ![image-20191115105740992](assets/image-20191115105740992.png) button.

### Editing and Deleting IP Address Ranges

To edit an IP address range, go to the **IP Address Management** page, click on a range, and click **Edit**. To delete a range, click on the range and click the **Delete** button.

### Assigning an IP Address Range

1. To assign a range to a user:

2. Go to **Admin \> Users** page. The View User page appears:

   <img src="assets/image-20191115110201765.png" alt="image-20191115110201765" style="zoom:67%;" />

3. Scroll to the bottom of the page and click the **Change IP Restrictions** button. The Edit IP Address Restrictions Page appears:

   <img src="assets/image-20191115110512161.png" alt="image-20191115110512161" style="zoom:67%;" />

4. Click to select or deselect check boxes next to the ranges to choose which IP Addresses a user can use to access SS. If no boxes are checked, the user can access SS through any IP Address.

5. Click the **Save** button.

> **Note:** Regardless of the restrictions, users can always log in when accessing SS on the server using a local IP address (127.0.0.1). This prevents total lockout from SS.