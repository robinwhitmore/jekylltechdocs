## Use Cloud Admin to Create Sites

<div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> Using Cloud Admin to work with {{site.user}} and sites is not available to all Weebly installations. If you do not have this functionality and want more info, contact your Weebly representative.</div>


Once you've created a {{site.user}}, you can then use Cloud Admin to create a site for that {{site.user}}.
<!--TODO: add link -->
{% if site.project=="cloud" %}
{% include note.html content="You must create at least one [plan](cl_gs_plans.html) before you can create a site." %}
{% elsif site.project=="designer" %}
{% include note.html content="You must create at least one [plan](ds_gs_plans.html) before you can create a site." %}
{% endif %}
**To create a site:**
1. In the [Cloud Admin](https://weeblycloud.com/admin), from the {{site.user}}'s detail page, in the **Sites** area click **Add Site**.
2. In the Add Site dialog, you must provide a title and a unique domain, and select a plan to assign to the site.
3. In the **Site Template** area, select **New Site** to create a new site from scratch. Or use a template or copy an existing site (more in the next sections).
3. Optionally, provide site settings like timezone, date format, language, and more.
4. Click **Save**.

{% include image.html file="cl_site_create.png" %}<br>
{% if site.project=="cloud" %}
​The site is owned by the {{site.user}} - that is, they have complete access to all pages and settings for the site.
{% endif %}
You can create contributors for the site{% if site.project=="designer" %}, including the owner of the site{% endif %}. These are users that can either have complete access to the site or you can limit their access. Find more info here.
<!--TODO: Add link -->
<hr>
## Create a Site Using a Template

Instead of creating a site from scratch, you can start with a template. Templates are sites that you've created to use as a starting point for new sites. For example, you might create a template for an online store and one for a portfolio site.

You can create up to 30 templates.

**To create a template:**
<!--TODO: Find out how this works w/Designers who don't really have users. Would it be a team memeber? Add links to create user/team member -->
1. Optionally create a <span style="color: red">user</span> that will "own" the template sites, then create your template sites under this user. While you can create a template out of any user's site, this is a great way to organize and manage your templates.
2. Create a site following the instructions above. Add elements and design your site.
3. Optionally add apps from the Weebly App Center {% if site.project=="cloud" %}or your own custom apps{% endif %}. But remember that access to apps is {% if site.project=="cloud" %}[based on plans](cl_gs_plans) {% elsif site.project=="designer" %} [based on plans](ds_gs_plans){% endif %}, so you may be restricting the potential sites that can use the template by adding apps. To avoid this, when you use the template, you can temporarily change the plan the new site is on so that it allows access to the App Center. More below.
   {% include tip.html content="Remember that a template is a starting point. Don't add too many elements, or design too specifically. It may end up being more work to remove what isn't needed than it would have been to start from scratch." %}
4. In the Cloud Admin, from the details page for your template site, click **Add as Template**.
   {% include image.html file="cl_addTemplate.png" %}<br>

Once added, that site appears as a template available for use when you chose to copy a site. More in the next section.

**To remove a template:**<br>
If you want to stop using a site as a template, from the Site Details page, click **Remove as Template**.
{% include image.html file="cl_remove_template.png" %}<br>

<hr>
## Copy a Site

Instead of creating a site from scratch, you can copy an existing one. There are two common use cases for copying a site:
* You've created templates that you copy to create new sites
* A {{site.user}} wants to create a clone of one of their existing sites

When you copy a site, it copies the existing site and theme, and copies all pages and page content. Orders and members are not copied, and neither are blog posts. Products, membership settings, and any installed apps are copied. Apps{% if site.project=="cloud" %} from the App Center{% endif %} will appear in the new site as they do in the original, however they will be in a disconnected state. You {% if site.project=="cloud" %}or the site owner{% endif %} will need to explicitly grant permission to reconnect the app when logging into the Editor.
{% include image.html file="sh_reconnect.png" %}
​

**To copy a site:**

1. Following the steps above for creating a site in Cloud Admin.
2. In the Add Site dialog, scroll down to the **Site Template** section.
3. Choose to either copy a template that you've created or to copy an existing site for this {{site.user}}.
   {% include image.html file="cl_copysite.png" %}<br>
   If you choose to copy a template, a dropdown displays showin all templates that you have created. Select the one to use.
   {% include image.html file="cl_createfromtemplate.png" %}<br>
   If you choose to copy an existing site, select one of the existing sites from the dropdown.
   {% include image.html file="cl_copysite.png" %}<br>

If the new site is not on a plan that allows access to the App Center, the app will work, but you will need to temporarily change the plan to connect the app.

**To allow an app on a plan that doesn't support the App Center:**
1. Temporarily change the site's plan to one that has access to the App Center.
2. Log into the site from the Cloud Admin and in the Editor, grant the permissions for the app.
3. Change the plan back to the original one.

Anyone editing the site will be able to manage the app, but will not be able to visit the App Center.

{%if site.project=="cloud"%}
<hr>

## Use the API to Create Sites

Instead of using the Cloud Admin to create or copy a site, you can use the API directly.

When creating a Weebly site you must provide a domain name. Errors will be thrown if the `user_id` is invalid or the domain name is already assigned to a Weebly site. A site id (ex. `447410440673519990`) is returned upon successful creation of a site. ​

<p class="codeTitle">Create a Site for a User</p>
{% highlight shell %}
curl https://api.weeblycloud.com/user/USER_ID/site \
  -X POST \
  -d '{
        "domain": "mynewsite.com",
        "site_title": "My Amazing Website"
}' \
  -H "Content-type: application/json" \
  -H "X-Public-Key: YOURAPIKEY" \
  -H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

You can also create a site by copying an existing site. You pass in a `copy_source object`, which is the `user_id` and `site_id` of the source site.
<p class="codeTitle">Copy a Site</p>
{% highlight shell %}
curl https://api.weeblycloud.com/user/USER_ID/site \
  -X POST \
  -d '{
        "domain": "mynewsite.com",
        "site_title": "My Amazing Website",
        "copy_source": {
          "site_id": "123456",
          "user_id": "987654321"
}' \
  -H "Content-type: application/json" \
  -H "X-Public-Key: YOURAPIKEY" \
  -H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

There are many optional parameters that can be passed when creating a site. More information can be found in the API doc, here.
<!-- TODO: Add link -->
{% include note.html content="If no `plan_id` is provided, then the site is assigned the default plan." %}

<hr>
## Use Plug-ins to Create Sites

If you use plug-ins with Weebly Cloud, then your users create sites using the plug-in's UI. This image shows the page in APS2 Weebly Cloud plug-in UI where you can create a site.
<!-- TODO: add link to plugins -->
{% include image.html file="cl_odin_createsite.png" %}<br>
{% endif %}

<hr>

## Edit a Site

Once a site is created, you can edit the site one of two ways:

From the {{site.user}}'s detail page of the Cloud Admin, click **Login**.
{% include image.html file="cl_site_detail_edit.png" %}<br>
Then click **Edit** from the portal.
{% include image.html file="cl_userPortal.png" %}<br>

Or, from the site's detail page in the Cloud Admin, click **Edit**.
{% include image.html file="cl_site_detail_edit.png" %}<br>

​The site opens in the Editor, where you can make any needed changes.
{% include image.html file="cl_editor2.png" %}<br>

<hr>

## Preview a Site Before Publishing

You can preview how a site will appear live without publishing, from the Editor. The site displays in a preview window with a temporary URL. You can send this URL to team members or site owners so they can view the site. The URL remains valid for 30 days.

**To preview a site:**

In the Editor, click **Preview**.
{% include note.html content="Only users accessing the Editor from Cloud Admin will see the Preview button. It is unavailable to users accessing the site from the User Portal." %}
{% include image.html file="cl_editor2.png" %}<br>
OR, in the Cloud Admin, from the site's detail page, click the **Site Preview** link.
{% include image.html file="cl_site_previewlink.png" %}<br>
The site displays in a preview window. Copy the URL from here and send to the {{site.user}} or team member.
{% include image.html file="cl_site_preview.png" %}<br>
{% include note.html content="Blogs, Commerce, Search, Forms, and Membership do not work in preview sites." %}

<hr>

## Publish a Site

When you publish a site, it goes live at the domain you've registered for the site and can be immediately accessed.

**To publish a site:**

From the Editor, click **Publish**.
{% include image.html file="cl_editor2.png" %}<br>

