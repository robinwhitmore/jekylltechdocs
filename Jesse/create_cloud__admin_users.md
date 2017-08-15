## Create Team Members

​Team members are internal users that can use Cloud Admin. You create and manage team members from the Team tab of Cloud Admin.

{% include image.html file=”cl_members_2.png” %}

Team members must have a unique email as an identifier (and is the username for logging into the Cloud Admin), and are assigned a role that determines what they can access in the portal.

{% include image.html file=”cl_team_members.png” %}

When a team member is created, an email is sent with a link that allows them to create a password and log into the Cloud Admin (the email is the username). You can also create this login link using the Team Member API<span style="color: red">[[URL:team-member]]</span>.

***

## Team Member Roles

​When you create a team member, you must associate them with a role. Roles determine what they can and cannot do in Cloud Admin.

Here are the roles and their permissions:
* **Admin**: Can access all portal functionality. Can view, create, edit, and delete users and team members. Can view, create, edit, log into, and publish websites. Can access account settings and billing information.
* **Technical**: Can access all user and site functionality, as well as account settings. Does not have access to team member or billing functionality.
* **Support**: Can view and edit users. Has full access to site functionality. Cannot access team member, account settings or billing functionality.
* **Editor**: Can only view users and view and edit sites. Cannot access anything else.
* **Finance**: Can only access billing functionality. Cannot access anything else.