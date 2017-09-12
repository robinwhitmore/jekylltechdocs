## Define the Element

An element is defined using the `elements` property that lives at the root of `manifest.json`.
Each element must contain the following properties (see the example<!-- todo: link--> for additional help):
* `path` (required): A file path to the root directory of the element within the bundle.  For example, if you place the element files within the `elements/ExampleElement` directory, the path property would simply be `elements/ExampleElement`.
* `name` (required): The name of the element.  This is what will appear in the element tray in the editor, and will be used as the title in any setting dialogs shown to users.
* `version` (required): The version of the element, provided as a string following [Semantic Versioning](http://semver.org/) guidelines (`Major.Minor.Patch`: for example `1.5.13`). Elements do not need to use the same version number as the parent app.
* `settings`: These are the configurable settings that the user can change. If you're element doesn't have settings, then you don't need to include this property, and you're done configuring the manifest. If you do want to add settings, continue on to {%if site.project=="designer"%}[Create Element Settings](ds_apps_element_settings.html) {%elsif site.project=="cloud"%}[Create Element Settings](cl_apps_element_settings.html){%elsif site.project=="platform"%}[Create Element Settings](pf_apps_element_settings.html){%endif%}

Here's an example of this first part of the manifest:
{% highlight json %}
{
    "manifest": "1",
    "version": "1.2.4",
    "elements": [
        {
            "name": "Price Chart",
            "path": "files",
            "version": "1.2.4",
            "settings": [
            ...
            ]
        }
    ]
}
{% endhighlight %}