When a user interacts with your element in the editor (in most cases by clicking on it), Weebly uses the data in the manifest to generate a dialog that allows the user to update the settings.

{% include image.html file="settings.png" caption="Settings Dialog" max-width="400" %}<!--todo: fix graphic size-->

Before you configure your settings in the manifest, be sure that you've considered the {%if site.project=="designer"%}[guidelines](ds_apps_guides.html){%elsif site.project=="cloud"%}[guidelines](cl_apps_guides.html){%elsif site.project=="platform"%}[guidelines](pf_apps_guides.html){%endif%} and started the configuration of your element in the {%if site.project=="designer"%}[manifest](ds_apps_element_manifest.html){%elsif site.project=="cloud"%}[manifest](cl_apps_element_manifest.html){%elsif site.project=="platform"%}[manifest](pf_apps_element_manifest.html){%endif%}. Refer to the example manifest<!--todo: link--> for help.

## Start the Settings Configuration
The parent `settings` property tells Weebly that this element has settings and needs a dialog to display them. It has two sub-properties: `config` and `properties`. `Config` determines how the dialog behaves. `Properties` holds the individual settings. As a child to the `settings` object you created in {%if site.project=="designer"%}[Add an element to the Manifest](ds_apps_element_manifest.html){%elsif site.project=="cloud"%}[Add an element to the Manifest](cl_apps_element_manifest.html){%elsif site.project=="platform"%}[Add an element to the Manifest](pf_apps_element_manifest.html){%endif%}, add the following

* `config` required: A configuration object which informs Weebly of how you want your element to behave when it's dropped onto the page.  Create the following subproperties:
* `autopop` required: Set to `true` to have the dialog launch immediately after it is dropped onto the page. Set to `false` to have it open only when the element is clicked on.
* `external`: Set to allow users to edit the settings outside of the Weebly ecosystem (more about external settings configuration, here <!--todo: link-->).
* `properties`: An array of objects.  Each object represents one setting for your element. Each instance of an element will have it's own values.  If your element requires settings, continue on to Create Settings for an Element<!--todo: link--> to complete the configuration of your element.

Next you create child `properties` objects that are the actual settings. But first, you need to group them in a parent `properties` object that represents a page (or group) in the dialog.


