To begin customizing a theme, you can download our {% if site.project=="designer" %}[Base theme](ds_themes_sample.html){%elsif site.project=="cloud" %}[Base theme](cl_themes_sample.html){%elsif site.project=="platform" %}[Base theme](pf_themes_sample.html){%endif%} and {% if site.project=="designer" %}[import](ds_themes_import_export.html){%elsif site.project=="cloud" %}[import](cl_themes_import_export.html){%elsif site.project=="platform" %}[import](pf_themes_import_export.html){%endif%} it as a starting point. Or open any theme in the Code Editor and begin editing its files. As you open a theme in the editor, the theme is cloned and Weebly saves it as `MyTheme`, so you won't overwrite the original. When you click **Save**, you can change the name to something more appropriate.
{% include note.html content="When you import a theme that you've already edited, you can overwrite the contents. Files get forked only when first editing a Weebly theme." %}

Here's an overview on how to create a theme. Click on the links for detailed instructions.

1. Find a theme that you want to start with and open it in the editor (don't try to create a theme from scratch). Or import our {% if site.project=="designer" %}[Base theme](ds_themes_sample.html){%elsif site.project=="cloud" %}[Base theme](cl_themes_sample.html){%elsif site.project=="platform" %}[Base theme](pf_themes_sample.html){%endif%}, and start from there.

2. If you want to use external tools, {% if site.project=="designer" %}[export](ds_themes_import_export.html){%elsif site.project=="cloud" %}[export](cl_themes_import_export.html){%elsif site.project=="platform" %}[export](pf_themes_import_export.html){%endif%} the theme you want to use as a base.
    {% capture partials %}
    {% if site.project=="designer" %}[Partials](ds_themes_partials.html){%elsif site.project=="cloud" %}[Partials](cl_themes_partials.html){%elsif site.project=="platform" %}[Partials](pf_themes_partials.html){%endif%} are not exported unless they've been customized. So if you want to edit any partials, make a small change to them before exporting.
    {% endcapture %}
    {% include note.html content=partials %}

{:start="3"}
3. {% if site.project=="designer" %}[Implement the CSS or LESS](ds_themes_implement_css.html){%elsif site.project=="cloud" %}[Implement the CSS or LESS](cl_themes_implement_css.html){%elsif site.project=="platform" %}[Implement the CSS or LESS](pf_themes_implement_css.html){%endif%}. The quickest way to start seeing changes in your theme is to start editing or adding styles. You can look at the styles from other themes for ideas and inspiration.

4. Optionally edit or create the {% if site.project=="designer" %}[HTML template](ds_themes_create_templates.html){%elsif site.project=="cloud" %}[HTML template](cl_themes_create_templates.html){%elsif site.project=="platform" %}[HTML template](pf_themes_create_templates.html){%endif%} files. You'll need a template for each header type that you want your theme to use. Add optional header areas or sections.

5. Edit and/or create {% if site.project=="designer" %}[partials](ds_themes_partials.html){%elsif site.project=="cloud" %}[partials](cl_themes_partials.html){%elsif site.project=="platform" %}[partials](pf_themes_partials.html){%endif%}. You can edit the partials to change parts of a page and you can create your own partials to include in other pages.

6. Optionally add {% if site.project=="designer" %}[color variations](ds_themes_variations.html){%elsif site.project=="cloud" %}[color variations](cl_themes_variations.html){%elsif site.project=="platform" %}[color variations](pf_themes_variations.html){%endif%}, {% if site.project=="designer" %}[color palettes](ds_themes_palette.html){%elsif site.project=="cloud" %}[color palettes](cl_themes_palette.html){%elsif site.project=="platform" %}[color palettes](pf_themes_palette.html){%endif%}, and {% if site.project=="designer" %}[user options](ds_themes_options.html){%elsif site.project=="cloud" %}[user options](cl_themes_options.html){%elsif site.project=="platform" %}[user options](pf_themes_options.html){%endif%} for your theme.
​
7. If working externally, zip up the theme, {% if site.project=="designer" %}[import](ds_themes_import_export.html){%elsif site.project=="cloud" %}[import](cl_themes_import_export.html){%elsif site.project=="platform" %}[import](pf_themes_import_export.html){%endif%} it, and test.
​
8. Create the theme's {% if site.project=="designer" %}[screenshot](ds_themes_screenshot.html){%elsif site.project=="cloud" %}[screenshot](cl_themes_screenshot.html){%elsif site.project=="platform" %}[screenshot](pf_themes_screenshot.html){%endif%}.
​
9. Repeat Steps 3-7 until you're done!

{% if site.project=="cloud" or "designer" %}
​Once you're done creating and testing your theme, you use the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to make it available to your customers. See {% if site.project=="designer" %}[Deliver Your Theme](ds_themes_deliver.html){%elsif site.project=="cloud" %}[Deliver Your Theme](cl_themes_deliver.html){%elsif site.project=="platform" %}[Deliver Your Theme](pf_themes_deliver.html){%endif%} for details.
{%endif%}
