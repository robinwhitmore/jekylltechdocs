{% if site.project=="cloud" or "designer" %}
You can customize a theme for just one site (as can any owner of a site or a {%if site.project=="designer"%}[contributor](ds_gs_access_sites.html) {%elsif site.project=="cloud"%}[contributor](cl_gs_access_sites.html){%endif%}with correct permissions), or you can create global Cloud themes that all of your customers can use. Cloud themes are managed and made available using the Cloud Admin.
{%endif%}

## Get Started with Themes
A Weebly theme provides a general structure and design palette for any website built using the Weebly editor. Weebly strives to provide ultimate flexibility for our users, so our themes don't dictate a template or a mandatory organization of content. Instead, they provide a beautiful backdrop for the site's content.

To get started, create a web site that you can use to test your theme. Then download our {% if site.project=="designer" %}[Base theme](ds_themes_sample.html){%elsif site.project=="cloud" %}[Base theme](cl_themes_sample.html){%elsif site.project=="platform" %}[Base theme](pf_themes_sample.html){%endif%} as a starting point, and start building from there! Or find a theme you mostly like and then change the things you don't.
​

Weebly themes can offer quite a degree of flexibility, like allowing the site owner to change colors to match their branding, or adding search functionality, or hiding areas of the site. Site owners can also change the fonts used throughout the site. Site owners make these changes from the **Theme** tab of the editor.
{% include image.html file="theme_lightHeader.png" caption="Theme design page in the editor" %}

As a theme developer, you decide what aspects of your theme you want to be changeable and what you want to remain fixed.


<div markdown="span" class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip:</b> If you want to get a quick understanding of how to customize and create themes, check out our {%if site.project=="designer"%}[theme tutorial](ds_themes_1.html) {%elsif site.project=="cloud"%}[theme tutorial](cl_themes_1.html){%endif%}.</div>

You use the Code Editor in Weebly to customize and create themes, accessed by clicking **Edit HTML/CSS** at the bottom of the Theme page.

All the files that you’ll need to edit to create your theme are listed in the left panel. You can edit HTML, CSS, and JSON files here, or you can export all the files and use any external editor. Once done, you can import your new theme back into the editor for testing.
{% include image.html file="theme_codeEditor.png" caption="Weebly Code Editor" %}

You can upload files or create new files by clicking the **+** icon to the right of the associated file type. For example, you might create a new header HTML page by clicking the **+** icon to the right of **HEADER TYPE**. Uploaded and new files are automatically put in the correct directory for you. You can rename (or delete) a file by clicking the gear icon next to it (mandatory files cannot be renamed or deleted).


{% if site.project=="cloud" or "designer" %}
## Manage Themes
You manage Cloud themes from the **Theme** tab of the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a>. Any theme that you create from here are available to all your users and their sites.
{% include image.html file="cl_themes_admin.png" caption="Manage themes in the Cloud Admin" %}

From here, you can {%if site.project=="designer"%}[upload](ds_themes_deliver.html) {%elsif site.project=="cloud"%}[upload](cl_themes_deliver.html){%endif%}new themes that you've created and {%if site.project=="designer"%}[update](ds_themes_update.html) {%elsif site.project=="cloud"%}[update](cl_themes_update.html){%endif%}existing themes by either uploading a new zip or changing the name.

<div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If you want to create a theme for just one user or site, you can deliver as a Zip file that they can then {%if site.project=="designer"%}[import](ds_themes_import_export.html) {%elsif site.project=="cloud"%}[import](cl_themes_import_export.html){%endif%}.</div>

## How Your Customers Use Your Themes
Any themes you've uploaded using the Cloud Admin are displayed on your company's theme tab (displays your {%if site.project=="designer"%}[brand](ds_gs_configure.html#brand-your-sites-and-the-cloud-admin){%elsif site.project=="cloud"%}[brand](cl_gs_configure.html#brand-your-sites-and-the-cloud-admin){%endif%} name) of the theme picker, shown when your customers go to create a site or change their site's theme (if you haven't customized any themes, then the tab doesn't display).
{%endif%}
{% if site.project=="cloud"%}
<div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If you have {%if site.project=="designer"%}[sub-resellers](ds_gs_configure.html) {%elsif site.project=="cloud"%}[sub-resellers](cl_gs_configure.html){%endif%}, they will not have access to your custom themes from their Cloud Admin, and their users will not see your custom themes in the Theme Gallery. If you want them to have your custom themes, you can send them the zip file and they can make it available through their Cloud Admin.</div>
{% include image.html file="cl_theme_gallery.png" caption="Theme Gallery in the Weebly Editor" %}
{%endif%}
{% if site.project=="designer" %}
{% include image.html file="ds_theme_gallery.png" caption="Theme Gallery in the Weebly Editor" %}
{% endif %}
{% if site.project=="cloud" or "designer" %}
When they use one of your themes and you {%if site.project=="designer"%}[update](ds_themes_update.html) {%elsif site.project=="cloud"%}[update](cl_themes_update.html){%endif%} it, all their configurations for that theme (like {%if site.project=="designer"%}[palettes](ds_themes_palette.html){%elsif site.project=="cloud"%}[palettes](cl_themes_palette.html){%endif%} or {%if site.project=="designer"%}[options](ds_themes_options.html){%elsif site.project=="cloud"%}[options](cl_themes_options.html){%endif%}) remain.
​
If you deliver the theme as a zip file, then you can't really update it. However, you can deliver a zip with an updated version and the user can import and apply it as though it was a new theme. All existing settings will remain.

Whether you create a Cloud theme for all users, or a theme for one user, any user that is an owner of a site can customize that theme. However when they do, they must rename it as a different theme and so cannot override the original.
<div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If you want to restrict access to themes, add the user as a {%if site.project=="designer"%}[contributor](ds_gs_access_sites.html) {%elsif site.project=="cloud"%}[contributor](cl_gs_access_sites.html){%endif%} to the site (instead of as the site's owner) and disallow access to the Theme tab.</div>
{%endif%}