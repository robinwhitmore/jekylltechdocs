## Use Cloud Admin to Create Sites

{% if site.project=="cloud" %}
<div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> Using Cloud Admin to work with {{site.user}} and sites is not available to all Weebly installations. If you do not have this functionality and want more info, contact your Weebly representative.</div>
{% endif %}
Once you've {%if site.project=="designer"%}[created](ds_gs_clients.html) {%elsif site.project=="cloud"%}[created](cl_gs_users.html){%endif%}
 a {{site.user}}, you can then use Cloud Admin to create a site for that {{site.user}}.
{% if site.project=="cloud" %}
{% include note.html content="You must create at least one [plan](cl_gs_plans.html) before you can create a site." %}
{% elsif site.project=="designer" %}
{% include note.html content="You must create at least one [plan](ds_gs_plans.html) before you can create a site." %}
{% endif %}
**To create a site:**
1. In the [Cloud Admin](https://weeblycloud.com/admin), from the {{site.user}}'s detail page, in the **Sites** area click **Add Site**.
2. In the Add Site dialog, you must provide a title and a unique domain, and select a plan to assign to the site.
   {% include note.html content="Domain names must be unique and must not contain `weebly`." %}
3. In the **Site Template** area, select **New Site** to create a new site from scratch. Or use a template or copy an existing site (more in the next sections).
3. Optionally, provide site settings like timezone, date format, language, and more.
    {% if site.project=="cloud" % }
   {% include image.html file="cl_site_create.png" %}
    {% elsif site.project=="designer" %}
    {% include image.html file="ds_site_create.png" %}
    {% endif %}
4. In the Theme Gallery, choose the theme for the site. If you've created {% if site.project=="designer" %}[custom themes](ds_themes_start.html){%elsif site.project=="cloud" %}[custom themes](cl_themes_start.html){%endif%} they display on the tab with your company name.
   {% include image.html file="cl_theme_gallery.png" caption="caption text" %}
4. Click **Save**.

{% if site.project=="designer" %}
When you create a site for a client, they don't have any access to it, other than visiting the published site. If you want them to be able to access the site so they do things like manage orders, view blog comments, or even edit the site, you need to set them up as a [site contributor](ds_gs_access_sites.html). Once that's done, they'll be able to access the site from the User Portal.
{% elsif site.project=="cloud" %}

Unless you set [contributor permissions](cl_gs_access_sites.html), the user has complete access to all pages and settings for the site, including the ability to edit and publish. You can restrict that access by setting their [Site Contributor permissions](cl_gs_access_sites.html).
{%endif%}


## Create a Site Using a Template

Instead of creating a site from scratch, you can start with a template. Templates are sites that you've created to use as a starting point for new sites. For example, you might create a template for an online store and one for a portfolio site.

You can create up to 30 templates.

**To create a template:**

1. Optionally create a {{site.user}} that will "own" the template sites, then create your template sites under this {{site.user}}. While you can create a template out of any {{site.user}}'s site, this is a great way to organize and manage your templates.
2. Create a site following the instructions above. Add elements and design your site.
3. Optionally add apps from the Weebly App Center {% if site.project=="cloud" %}or your own custom apps{% endif %}. But remember that access to apps is {% if site.project=="cloud" %}[based on plans](cl_gs_plans.html) {% elsif site.project=="designer" %} [based on plans](ds_gs_plans.html){% endif %}, so you may be restricting the potential sites that can use the template by adding apps. To avoid this, when you use the template, you can temporarily change the plan the new site is on so that it allows access to the App Center. More below.
   {% include note.html type="tip" content="Remember that a template is a starting point. Don't add too many elements, or design too specifically. It may end up being more work to remove what isn't needed than it would have been to start from scratch." %}
4. In the Cloud Admin, from the details page for your template site, click **Add as Template**.
    {% if site.project=="cloud" %}
   {% include image.html file="cl_addTemplate.png" %}
    {% elsif site.project=="designer" %}
    {% include image.html file="ds_siteDetailTemplate.png" caption="Create a template" %}
    {%endif%}

Once added, that site appears as a template available for use when you chose to copy a site. More in the next section.

**To remove a template:**<br>
If you want to stop using a site as a template, from the Site Details page, click **Remove as Template**.
{% if site.project=="cloud" %}
{% include image.html file="cl_remove_template.png" %}
{% elsif site.project=="designer" %}
{% include image.html file="ds_siteRemoveTemplate.png" caption="Remove a template" %}
{%endif%}

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
3. Choose to either copy a template that you've created or to copy an existing site.
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

There are many optional parameters that can be passed when creating a site. More information can be found in the API doc, [here](cl_apis_site.html).
{% include note.html content="If no `plan_id` is provided, then the site is assigned the default plan." %}

<hr>
## Use Plug-ins to Create Sites

If you use plug-ins with Weebly Cloud, then your users create sites using the plug-in's UI. This image shows the page in APS2 Weebly Cloud plug-in UI where you can create a site.
<!-- TODO: add CLOUD link to plugins -->
{% include image.html file="cl_odin_createsite.png" %}<br>
{% endif %}

## Edit a Site
{% if site.project=="cloud" %}
Once a site is created, you can edit the site one of two ways:

From the {{site.user}}'s detail page of the Cloud Admin, click **Login**.
<!--todo: cloud: add image from user detail-->
Then click **Edit** from the portal.
{% include image.html file="cl_userPortal.png" %}<br>

Or, from the site's detail page in the Cloud Admin, click **Edit Site**.
{% include image.html file="cl_site_detail_edit.png" %}

{% elsif site.project=="designer" %}
From the site's detail page in the Cloud Admin, click **Edit Site**.
{% include image.html file="ds_siteDetailEdit.png" caption="Edit a Site from the Cloud Admin" %}
{%endif%}

​The site opens in the Editor, where you can make any needed changes.
{% include image.html file="cl_editor2.png" %}<br>

## Preview a Site Before Publishing

You can preview how a site will appear live without publishing, from the Editor. The site displays in a preview window with a temporary URL. You can send this URL to team members or {{site.user}}s so they can view the site. The URL remains valid for 30 days.

**To preview a site:**

In the Editor, click **Preview**.
{% include note.html content="Only users accessing the Editor from Cloud Admin will see the Preview button. It is unavailable to users accessing the site from the User Portal." %}
{% include image.html file="cl_editor2.png" %}<br>
OR, in the Cloud Admin, from the site's detail page, click the **Site Preview** link.
{% if site.project=="cloud" %}
{% include image.html file="cl_site_previewlink.png" %}
{% elsif site.project=="designer" %}
{% include image.html file="ds_sitePreview.png" caption="Preview a site from the Cloud Admin" %}
{%endif%}
The site displays in a preview window. Copy the URL from here and send to the {{site.user}} or team member.
{% include image.html file="cl_site_preview.png" %}<br>
{% include note.html content="Blogs, Commerce, Search, Forms, and Membership do not work in preview sites." %}

## Publish a Site

When you publish a site, it goes live at the domain you've registered for the site and can be immediately accessed.

**To publish a site:**

From the Editor, click **Publish**.
{% include image.html file="cl_editor2.png" %}

## Change a Site's Domain
You can change a site's domain when needed.

From the site's detail page, click **Set Domain** and enter the new domain.
{% include note.html content="Domain names must be unique and must not contain `weebly`." %}
{% if site.project=="cloud" %}
{% include image.html file="cl_site_detail_domain.png" caption="Change the site's domain" %}
{% elsif site.project=="designer" %}
{% include image.html file="ds_siteDomain.png" caption="Change the site's domain" %}
{%endif%}

{% if site.project=="designer" %}
## Move a Site to Another Client

You can move a site to another client from the Cloud Admin.

From the site's detail page, click **Move to Client**.
{% include image.html file="ds_siteMove.png" caption="Move a site to another client" %}

Use the dropdown to select the client to move to and click **Move Site**.
{% include image.html file="ds_siteMove2.png" caption="Select the target client" %}
{%endif%}

## Suspend Access to a Site
To temporarily prevent a user from updating their site in the event they are delinquent on their payment, their access to a site can be suspended using the {% if site.project=="designer" %}[`Site::disable`](ds_api_site.html#postdisable-a-site){%elsif site.project=="cloud" %}[`Site::disable`](cl_api_site.html#postdisable-a-site){%elsif site.project=="platform" %}[`Site::disable`](pf_api_site.html#postdisable-a-site){%endif%} endpoint. When a site is suspended, access to the Weebly editor is disabled (the published site remains unchanged and active).
{% if site.project=="cloud"%}
SSO loginLinks<!--todo: Cloud: add link--> can still be generated for a suspended site. Clicking on a loginLink will inform the user that access to the site is disabled and will point them to contact their administrator.
{%endif%}
Use the {% if site.project=="designer" %}[`GET /site`](ds_api_site.html#getretrieve-details-for-a-site){%elsif site.project=="cloud" %}[`GET /site`](cl_api_site.html#getretrieve-details-for-a-site){%elsif site.project=="platform" %}[`GET /site`](pf_api_site.html#getretrieve-details-for-a-site){%endif%} API which returns a `suspended` parameter with a value of `true` or `false` to determine if a site is suspended (the Cloud Admin also shows you if a site is suspended).  A site can be taken out of a suspended state by making a call to {% if site.project=="designer" %}[`Site::enable`](ds_api_site.html#postenable-a-site){%elsif site.project=="cloud" %}[`Site::enable`](cl_api_site.html#postenable-a-site){%elsif site.project=="platform" %}[`Site::enable`](pf_api_site.html#postenable-a-site){%endif%}.​
{% if site.project=="cloud"%}
If you use the WHMCS plug-in, you can use that to suspend and reactivate accounts.<!--todo: Cloud: add link-->
{%endif%}

## Unpublish a Site
In the event you want to unpublish a site you can use the {% if site.project=="designer" %}[`Site::unpublish`](ds_api_site.html#postunpublish-a-site){%elsif site.project=="cloud" %}[`Site::unpublish`](cl_api_site.html#postunpublish-a-site){%elsif site.project=="platform" %}[`Site::unpublish`](pf_api_site.html#postunpublish-a-site){%endif%} endpoint. This will unpublish the site, but not prevent the user from republishing, if they have access to do so. This API method should not be taken lightly. Unpublishing a user's site should be communicated far in advance so the user can take the appropriate steps to remedy the situation.

{% if site.project=="designer"%}
You'll no longer be billed for the unpublished site.
{%endif%}

## Delete a Site
If a user cancels their subscription you can delete their site(s). This completely prevents the user from accessing the site {%if site.project=="cloud"%}by SSO loginLink or login credentials. Weebly will no longer bill the partner for the site once it is deleted{%endif%}. You can delete a site from the site detail page in the Cloud Admin.
{% if site.project=="cloud" %}
{% include image.html file="cl_site_detail_delete.png" caption="Delete a site from the Cloud Admin" %}
{% elsif site.project=="designer" %}
{% include image.html file="ds_siteDelete.png" caption="Delete a site from the Cloud Admin" %}
{%endif%}
You can also delete a site by making a call to the {% if site.project=="designer" %}[DELETE /site API](ds_api_site.html#deletedelete-a-site){%elsif site.project=="cloud" %}[DELETE /site API](cl_api_site.html#deletedelete-a-site){%elsif site.project=="platform" %}[DELETE /site API](pf_api_site.html#deletedelete-a-site){%endif%}.






