## Deliver a Cloud​ Theme to All Customers

​You use the Cloud Admin to make your theme available from a tab in the Theme Gallery.
{% include image.html file="theme_gallery.png" caption="Your themes display on a tab that shows just your custom themes" %}
​
**To make your theme available from the gallery**:
1. In the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a>, click the **Themes** tab.
    Any current custom themes are displayed on the page.

2. Click **Create New Theme**.

3. Enter a theme name. This is what will be displayed to your customers.

4. Click **Upload Theme Zip**. Navigate to the directory where you exported your theme and upload your theme's zip.

5. Click **Create Theme**.
Your new theme displays in the Cloud Admin using the screenshot you created.
{% include image.html file="themes_adminCreate.png" caption="You add themes to the Gallery from the Cloud Admin" %}

​Once added, your theme displays on your company's theme tab in the Theme Gallery.
{% include image.html file="theme_gallery.png" caption="Your themes on your own tab in the Theme Gallery" %}


## Deliver Your Theme to One Customer

Instead of making your theme available in the gallery, you can {% if site.project=="cloud" %}provide a zip file to a single customer for them to upload directly to their site {elsif site.project=="designer" %} upload a theme directly to a single site.{%endif%}

**To provide a theme to a single site**:
1. {% if site.project=="designer" %}[Export](ds_themes_import_export.html){%elsif site.project=="cloud" %}[Export](cl_themes_import_export.html){%endif%} the theme to a zip file.

2. {% if site.project=="cloud" %}Deliver your zip file to any Weebly user and they can [import](cl_themes_import_export.html) it and use it in their site. {%elsif site.project=="designer" %}Open the site that will use the theme in the editor and [import](ds_themes_import_export.html) the theme. {%endif%}