Instead of creating directories and files, {%if site.project=="designer"%}[download the Base theme](ds_themes_sample.html) {%elsif site.project=="cloud"%}[download the Base theme](cl_themes_sample.html){%elsif site.project=="platform"%}[download the Base theme](pf_themes_sample.html){%endif%} and unzip it to create the proper directory structure. Or, {%if site.project=="designer"%}[export](ds_themes_import_export.html){%elsif site.project=="cloud"%}[export](cl_themes_import_export.html){%elsif site.project=="platform"%}[export](pf_themes_import_export.html){%endif%} any other theme to start.

When you unzip the archive, you'll see that the theme's root directory contains the following:
* `manifest.json` file.  This file provides {%if site.project=="designer"%}[configuration](ds_themes_manifest.html){%elsif site.project=="cloud"%}[configuration](cl_themes_manifest.html){%elsif site.project=="platform"%}[configuration](pf_themes_manifest.html){%endif%} for the theme, including optional functionality.
* `main_style.css` file. This is the stylesheet for the theme, when using CSS.
    {% include note.html content="If your theme uses LESS rather than CSS, the LESS stylesheet(s) is in the `/styles` directory. Your theme should use either CSS or LESS, not both. If both exist, the CSS file will be ignored." %}
* HTML template files for each of the different header types
* JavaScript files (these may be in the assets directory).
* assets (optional directory): Contains images, fonts, and Javascript files. If there are only a few of these files, they may be at the root instead.
* `partials` (directory): Contains custom partials used on the pages.
    {% include note.html content="If you do not edit the default partials using the Weebly Code Editor, then they are not included in the Zip file. Only customized partials are included. So if you want to edit a partial, make a small edit to it in the editor and then export it." %}
* `images` (optional directory): You can either place your images in this directory, or keep them at the root. Just be sure to refer to them correctly.
* `styles` (if using LESS): Contains the stylesheet(s) for the theme. If you use color variations, your theme will have more than one stylesheet.
* `screenshot.jpg` file (once you {%if site.project=="designer"%}[create](ds_themes_screenshot.html){%elsif site.project=="cloud"%}[create](cl_themes_screenshot.html){%elsif site.project=="platform"%}[create](pf_themes_screenshot.html){%endif%} it): This file is used to display your theme in the Theme chooser, shown when a user creates a site or changes the theme{% if site.project=="cloud" or "designer" %} and in the Cloud Admin{%endif%}.

If you are working in an external editor, once you make your changes and need to test in Weebly, zip up the contents of the directory (and not the directory itself) and {%if site.project=="designer"%}[import](ds_themes_import_export.html){%elsif site.project=="cloud"%}[import](cl_themes_import_export.html){%elsif site.project=="platform"%}[import](pf_themes_import_export.html){%endif%} it into Weebly.
{% include note.html content="When zipping your theme, be sure to zip the contents of your root folder, and not the root folder itself.  Your theme will be invalid if it includes the root folder!" %}

The Code Editor displays a logical structure of the directories, which is different from the actual physical structure. Header type templates are shown in the `Header Type` directory. Partials are shown in the `Partials` directory. Every other file type is shown in the `Assets` directory. If you created any sub-directories, those also display in the `Assets` directory.

This screenshot shows how the Base theme's files appear in the editor. Note that this theme contains an images sub-directory displayed in the `Assets` directory.
{% include image.html file="themeDirectory.png" caption="Logical directory structure in the Editor" %}
{% include note.html content="Always use the physical path when you refer to assets in your code.  For example, to refer to images in the Base theme, you would use `/images/dark-background.jpg` and not `/assets/images/dark-background.jpg`." %}
