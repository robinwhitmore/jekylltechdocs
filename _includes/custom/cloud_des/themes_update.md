You update a theme in the same way as customizing an existing theme, and your changes can be as small as changing the name (done in the Cloud Admin) or changing the screenshot, to changing styles, templates, or partials. Once you make your changes to the theme's files, you zip them up and upload the new zip using the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a>. Any site that is using the theme will receive the updates, though the changes won't be on the live site until it is republished.

## Change the Theme's Name

You can change the theme's name in the Cloud Admin - no need to edit any of the files in the zip.

1. From the **Themes** tab In the Cloud Admin, click the theme's **Manage** link.

2. In the dialog, change the name and click **Update Theme**.
​   The name changes for the theme and is also changed in the Theme Gallery where your users select themes.

## ​Update a Theme's Files

Changes other than to the theme's name require you to edit the theme's files, create a new zip, and upload it to the Cloud Admin.
​
**​To update a theme**:
1. Follow the steps in {% if site.project=="designer" %}[How to Create a Theme](ds_themes_create.html){%elsif site.project=="cloud" %}[How to Create a Theme](cl_themes_create.html){%endif%} to make your changes.

2. Once you've tested your changes, {% if site.project=="designer" %}[export](ds_themes_import_export.html){%elsif site.project=="cloud" %}[export](cl_themes_import_export.html){%endif%} the theme to a local directory.

3. From the **Themes** tab In the Cloud Admin, click the theme's **Manage** link.

4. In the dialog, click **Upload Theme Zip**.

Any sites using the theme will get your updates, including sites that were created as a copy from another site or from a template that used the theme. The changes won't be active until the site is published again but users will see your changes in the Editor. If your theme contains color palettes, variations, or options, previous selections made by the user will be retained after the update.

<div class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip: </b>If you want to force theme updates to live sites, use the {% if site.project=="designer" %}<a href="ds_api_site.html">Site API</a>{% elsif site.project=="cloud" %}<a href="cl_api_site.html">Site API</a>{% elsif site.project=="platform" %}<a href="pf_api_site.html">Site API</a>{% endif %} to republish sites after you upload the new zip."</div>

If you are updating a theme for a single user (that is, you don't want to make it available to all users via the Cloud Admin), then simply deliver the updated zip file. The user can {% if site.project=="designer" %}[import](ds_themes_import_export.html){%elsif site.project=="cloud" %}[import](cl_themes_import_export.html){%endif%} the new zip and apply the update as though it were a new theme. The theme's name will have a number appended to it to indicate that it's a version of the original. For example, if you had originally provided a zip named `MyTheme.zip` and then provided a new zip with the same name, when the user imports it, Weebly changes the name to `MyTheme_1.zip`, keeping the original intact.
