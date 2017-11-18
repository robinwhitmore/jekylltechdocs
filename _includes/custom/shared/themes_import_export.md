## Import a Theme Using the Weebly UI

Weebly themes must be provided as a ZIP file (directory structure {% if site.project=="designer" %}[here](ds_themes_directory.html){%elsif site.project=="cloud" %}[here](cl_themes_directory.html){%elsif site.project=="platform" %}[here](pf_themes_directory.html){%endif%}). Styles must live in `main_style.css` or `main.less` (if using LESS). Make sure you've included all images and other assets.

{% include note.html content="The zip file must contain the contents of the theme's root directory, and NOT the root directory folder itself. If you create your zip from a source control app like GitHub, the zip may include that root folder. You'll need to extract and then rezip only the contents (and not the root directory) before importing into Weebly." %}


**​To import a theme**:
1. Open your test site. In the Weebly editor, click the **Design** tab.

2. Click Change Theme, and at the bottom, click **Import Theme**.

3. To apply your theme to your site, go to **Design > Change Theme**, click **Custom Themes**, and click **Choose** to apply it, or **Edit** to edit the theme.


## Export a Theme

Once you've completed your theme, use the Weebly editor to zip it up for you.

1. Open your test site. In the Weebly editor, click the **Theme** tab.

2. At the bottom, click **Edit HTML/CSS**.

3. Click **Export Theme**.
    {% include image.html file="theme_export.png" caption="Export a theme" %}
    Your theme will be downloaded and is ready for distribution.
    {% include note.html content="All themes use the same default partials, which are available only in the Editor. Only customized partials are downloaded when you export a theme. So if you want to work in an external tool and want to change a partial, make a small change first in the Weebly editor, and then export the theme." %}
{% if site.project=="cloud" or "designer" %}
{:start="4"}
4. Use the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to make the theme available to your customers.
{% endif %}
