## About Team Members

​Team members are internal users that can use <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to help create and manage your client and sites. You create and manage team members from the Team tab of Cloud Admin.
{% if site.project=="cloud" %}
{% include image.html file="cl_members.png" caption="Team member list"%}
{% elsif site.project=="designer" %}
{% include image.html file="ds_team.png" caption="Team member list" %}
{%endif%}

Team members must have a unique email as an identifier (and is the username for logging into the Cloud Admin), and are assigned a role that determines what they can access in Cloud Admin.
{% if site.project=="cloud" %}
{% include image.html file="cl_memberCreate.png" caption="Creating a team member"%}
{% elsif site.project=="designer" %}
{% include image.html file="ds_memberCreate.png" caption="Creating a team member" %}
{%endif%}

## Team Member Roles
When you create a team member, you must associate them with a role. Roles determine what they can and can't do in Cloud Admin.

{% capture contributor %}
If you want an employee to {%if site.project=="designer"%}[have access](ds_gs_access_sites.html) {%elsif site.project=="cloud"%}[have access](cl_gs_access_sites.html){%endif%} to just one site instead of having access to all sites, then instead of creating them as a team member, create them as a <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.site_contributor}}">contributor</a> for that site. Contributors can have full or limited access to a site.
{% endcapture %}

{% include note.html type="tip" content=contributor %}

Here are the roles and their permissions:

* **Admin**: Can access all portal functionality. Can view, create, edit, and delete {{site.customer}} and team members. Can view, create, edit, log into, and publish all websites. Can access account settings and billing information

* **Technical**: Can access all {{site.customer}} and site functionality, as well as account settings. Does not have access to team member or billing functionality.
* **Support**: Can view and edit {{site.customer}}s. Has full access to site functionality. Cannot access team member, account settings or billing functionality.
* **Editor**: Can only view {{site.customer}}s and view and edit sites. Cannot access anything else.
* **Finance**: Can only access billing functionality. Cannot access anything else.
<hr>
## Create a Team Member
You create team members from the Cloud Admin.

**To create a team member:**
1. In Cloud Admin, click the **TEAM** tab.
2. Click **Add Member**.
3. Enter a name and an email address. The address is used to log into the Cloud Admin.
4. Select a role.
5. Click **Save**.
{% if site.project=="cloud" %}
{% include image.html file="cl_memberCreate.png" caption="Creating a team member"%}
{% elsif site.project=="designer" %}
{% include image.html file="ds_memberCreate.png" caption="Creating a team member" %}
{%endif%}
When a team member is created, an email is sent with a link that allows them to create a password and log into the Cloud Admin (the email is the username). {%if site.project=="cloud"%}You can also create this login link using the <span style="color: red">Team Member API</span>.{% endif %}
<!--TODO: Cloud: add link-->
