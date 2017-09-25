We're done with the customizations and we've taken the screenshot, so now it's time to package up the theme so other sites can use it.

1. {% include custom/notes/code_editor.md %}

2. At the bottom left, click **Export Theme**.
    {% include image.html file="theme_export.png" %}

3. Save the zip file to a local directory.

3. Move the screenshot taken in {%if site.project=="designer"%}[Step 9](ds_themes_9.html){%elsif site.project=="cloud"%}[Step 9](cl_themes_9.html){%elsif site.project=="platform"%}[Step 9](pf_themes_9.html){%endif%} into the root of the theme's directory. It should be at the same level as the manifest file.

5. Select all the contents of the directory and zip it up.
    {% include note.html content="Be sure to zip up the contents of the directory, and not the directory itself." %}


{% if site.project=="cloud" or "designer" %}
Now let's make our theme available to the Theme Gallery using the Cloud Admin.

1. Open the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a>,  and click the **Themes** tab.

2. Click **Create New Theme**.

3. Enter **My Theme** for the theme's name.

4. Click **Upload Theme Zip**. Navigate to the directory where you exported your theme and upload your theme's zip.

5. Click **Create Theme**.
    Your new theme displays in the Cloud Admin using the screenshot you created in the previous step. You can delete the theme by clicking the **Manage** link.

### What Just Happened?
You exported your customized theme and added the screenshot. You then used the Cloud Admin to upload it to the Weebly Theme Gallery, where any user can choose it.

{%elsif site.project=="platform" %}
You can now give the theme to anyone who wants to use it. They'll need to follow these instructions to apply the theme to their site.


### What Just Happened?
You exported your customized theme and added the screenshot. When a user imports it, it appears as a choice in the Weebly Theme Gallery.
{% endif %}