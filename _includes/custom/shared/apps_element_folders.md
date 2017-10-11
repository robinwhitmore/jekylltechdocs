Directly below the root folder for your app, you add an element directory for each element you create. Within that directory, you can add the following directories and files (required files are noted):
* **html:** holds the templates for your element.
  The `element.tpl` file is required. This file is the main template for your element. If you need a different template for your element when it is in the editor, then you can also create the `editor_element.tpl` file.
* **js:** holds JavaScript files.
  The `element.js` file is required. This file is the main JavaScript for your element. If you need different JavaScript for your element when it is in the editor, then you can also create the `editor.js` file.
* **css:** holds the CSS (stylesheet) files.
  The `element.css` file is required. This file is the main stylesheet for your element. If you need different styles for your element when it is in the editor, then you can also create the `editor.css` file.
* **assets:** holds `.png`, `.jpg`, or other assets needed by your element
* `icon.svg:` This is the required icon used to display your element in the editor's element tray.
  The `icon.svg` file must live in the root folder for your element (not the root folder for your app).  The icon should be provided in a greyscale format that matches the Weebly UI. Follow our {% if site.project=="designer" %}[icon guidelines](ds_apps_icon.html){%elsif site.project=="cloud" %}[icon guidelines](cl_apps_icon.html){%elsif site.project=="platform" %}[icon guidelines](pf_apps_icon.html){%endif%} when creating your icon.

The following shows the file structure for an app that contains one element.
{% highlight sh %}
MyAp
|--manifest.json
|--MyElement
|   |--assets
|   |   |--logo.png
|   |--css
|   |   |--element.css
|   |   |--editor.css
|   |--html
|   |   |--element.tpl
|   |   |--editor_element.tpl
|   |--icon.svg
|   |--js
|   |   |--element.js
|   |   |--editor.js
{%endhighlight%}