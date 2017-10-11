## What are Site Contributors?
{% if site.project=="cloud" %}
Site contributors are users that have access to edit and manage a site, but are not owners of the site. For example, a site owner might employ a blog post writer who should have access to blog pages and nothing else. Or they might have someone who does order fulfillment and should only be able to view orders.
{% elsif site.project=="designer" %}
Site contributors are users that have access to edit and manage a site, but are not owners of the site. For example, you might set up a client as a contributor to their site so that they can manage their store, but not edit or publish the site. Or you might provide access to certain pages to a team member at your company.
{% endif %}

Site contributors can have one of two levels of access:
* **Admin:** The contributor can do everything.
* **Limited:** The contributor can only access the specific functionality (like editing specific pages, ability to publish the site, ability to change settings) that is assigned to them.

## Create Site Contributors
You add site contributors in Cloud Admin, from the Site Detail page.

**To add a site contributor:**
1. In the Cloud Admin, from the {{site.user}}'s detail page, select a site.
2. On the site's detail page, click **Add Contributor**.
3. Choose to either create a new user or select an existing user. {% if site.project=="designer"%} If you want to add a client as a contributor, you need to create them as a new user. If you want to add a Team Member that has already been created in the Cloud Admin, then select **Existing User** and search for them by email.{% endif %}

   {% include image.html file="cl_contributorNew.png" caption="Adding a contributor" %}
​4. Click **Set Permissions** and either give them full permission to the site (by **not** selecting **Limit Editor Permissions**), or set explicit permissions by selecting that checkbox and then configuring access:
   {% include image.html file="cl_contributor_perms.png" caption="Contributor permissions" %}

The contributor is now listed on the site's detail page.
{% include image.html file="cl_contributor_site.png" caption="Contributor on the site's detail page" %}

## Manage Site Contributors
Once created, you can change a contributor's permissions or you can delete them as a contributor. Deleting a contributor only deletes that person's access to the site. .

**To manage a contributor:**
1. In the Cloud Admin, search for or browse to the site that they contribute to.
2. To change permissions, in the Contributors area, click the **Edit** icon for the contributor and edit the permissions.
3. To delete the contributor, click the **Delete** icon.


