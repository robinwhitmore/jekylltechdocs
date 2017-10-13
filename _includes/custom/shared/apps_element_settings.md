When a user interacts with your element in the editor (in most cases by clicking on it), Weebly uses the data in the manifest to generate a dialog that allows the user to update the settings.

{% include image.html file="settings.png" caption="Settings Dialog" max-width="400" %}

Before you configure your settings in the manifest, be sure that you've considered the {%if site.project=="designer"%}[guidelines](ds_apps_guides.html){%elsif site.project=="cloud"%}[guidelines](cl_apps_guides.html){%elsif site.project=="platform"%}[guidelines](pf_apps_guides.html){%endif%} and started the configuration of your element in the {%if site.project=="designer"%}[manifest](ds_apps_element_manifest.html){%elsif site.project=="cloud"%}[manifest](cl_apps_element_manifest.html){%elsif site.project=="platform"%}[manifest](pf_apps_element_manifest.html){%endif%}. Refer to the {% if site.project=="designer" %}[example](ds_apps_element_man_ex.html){%elsif site.project=="cloud" %}[example](cl_apps_element_man_ex.html){%elsif site.project=="platform" %}[example](pf_apps_element_man_ex.html){%endif%} manifest for help.

## Start the Settings Configuration
The parent `settings` property tells Weebly that this element has settings and needs a dialog to display them. It has two sub-properties: `config` and `properties`. `Config` determines how the dialog behaves. `Properties` holds the individual settings. As a child to the `settings` object you created in {%if site.project=="designer"%}[Add an element to the Manifest](ds_apps_element_manifest.html){%elsif site.project=="cloud"%}[Add an element to the Manifest](cl_apps_element_manifest.html){%elsif site.project=="platform"%}[Add an element to the Manifest](pf_apps_element_manifest.html){%endif%}, add the following:

* `config` (required): A configuration object which informs Weebly of how you want your element to behave when it's dropped onto the page.  Create the following subproperties:
* `autopop` (required): Set to `true` to have the dialog launch immediately after it is dropped onto the page. Set to `false` to have it open only when the element is clicked on.
* `external`: Set to allow users to edit the settings outside of the Weebly ecosystem (more about external settings configuration, [here](#create-external-settings).
* `properties`: An array of objects.  Each object represents one setting for your element. Each instance of an element will have it's own values.

Next you create child `properties` objects that are the actual settings. But first, you need to group them in a parent `properties` object that represents a group in the dialog. The next section explain the structure of the `properties` object.

## Properties Structure

`Properties` are the objects that hold the settings information. A parent `properties` must be of type `group`. A `group` is used to structure how the properties are displayed on the first page of the dialog. Members of a group are displayed together on the dialog page, using the group's name as the heading for that section.

For example, in the Price Chart sample element, the `settings` group holds the plans and features settings, the button position, and the text alignment. The `advanced` group holds the currency and color settings.
{% include image.html file="priceChartSettings.png" max-width="400" %}{% include image.html file="priceChartSettingsAdv.png" max-width="400" %}

Settings that rely on a selection (like color) take the user to another page in the dialog.

## Create a Group

You must create at least one group.

To create a group, set the following:
* `name`: The internal name of your group.  This name will be used to access the group from within your element code.
* `label`: The label for the group displayed as the group heading in the settings dialog.
* `type`: Set to `group`.
* `properties`: Create the array of settings for your element.

{% highlight json %}
"properties": [
    {
        "name": "settings",
        "label": "Settings",
        "type": "group",
        "properties": [
            {
                ...
            }
        ]
    }
]
{% endhighlight %}

## Add the Settings
To create the element's setting properties, you define the following:
* `name`: The internal name of your setting.  This name will be used to access the setting from within your element code.
* `label`: The label for the setting displayed in the dialog.
* `type`: The type of the setting.  This dictates how the setting will appear in the dialog, and what validations can be applied to it. See Setting Types, [below](#setting-types), for allowed options.
* `default`: The default value for this setting.
   {% include note.html type="tip" content="Use `default: \" \"`  for null." %}
* `hidden`: Set to `true` if you don't want this setting to display in the dialog. When set to `true`, you must supply a value for `default`. Default is `false.`
    {% include note.html content="If you want to have all of your settings managed from an external URL (see [below](#create-external-settings)), you can set `hidden` to `true` on all settings.  When the dialog displays, it will simply contain a button to open the iframe." %}
* `private`: Set to `true` to make the setting unavailable to the published site (default is `false`).  In some cases, settings may contain private information (such as API Keys).  This ensure that the data is not available to visitors of the site, and can only be used within the editor.
* `tooltip`: A string that displays when the user hovers over the setting in the dialog. Max length is 100 characters. No HTML is allowed.

## Setting Types
Each setting must specify one of the following types. Each type creates a specific UI control in the dialog. Some types allow additional data.
* `string`: A single-line text input.  You may specify both `min` and `max` properties to indicate minimum and maximum string length.
* `text`: A multi-line text input.  You may specify both `min` and `max` properties to indicate minimum and maximum string length.
* `int`: A single-line text input, validated to allow only numeric input.  You may specify both `min` and `max` properties to indicate minimum and maximum values.  You may also specify a `step` property, which adds up and down buttons, and auto-round any input to an appropriate step value. `Default`, `step`, `min`, and `max` properties are all integers.
* `slider`: A slider selection.  You may specify both `min` and `max` properties to indicate minimum and maximum values.  You may also specify a `step` property, which will cause the slider to move in steps of that size. `Default`, `step`, `min`, and `max` properties are all integers.
* `toggle`: A toggle selection of on/off. The value will be returned as a boolean `true`/`false`, respectively.
* `radio`: A radio group selection. You must specify a `values` array.  This array can either be a simple array of strings as values, or an array of objects that provide both `name` and `value` properties.
* `select`: A separate dialog page that allows the user to select an option.  You must specify a `values` array.  This array can either be a simple array of strings as values, or an array of objects that provide both `name` and `value` properties.
* `color`: A color picker input.
* `align`: A series of buttons, indicating left, center, and right.
* `group`: Don't use for settings - use only when creating a group.
{% highlight json %}
"properties": [
    {
        "name": "settings",
        "label": "Settings",
        "type": "group",
        "properties": [
            {
                "name": "plans",
                "label": "Plans",
                "type": "int",
                "default": 3,
                "step": 1,
                "min": 1,
                "tooltip": "Select the number of plans to display."
            },
            {
                "name": "features",
                "label": "Features",
                "type": "int",
                "default": 3,
                "step": 1,
                "min": 1,
                "tooltip": "Select the number of features per plan."
            },
            {
                "name": "location",
                "label": "Sign Up Button",
                "type": "select",
                "values": [
                    "Top",
                    "Bottom"
                ],
                "default": "Top"
            },
            . . .
            ]
        }
    ]
}
{% endhighlight %}

## Create External Settings

If your application or element requires external data, or you feel that your customized settings panel will provide a better experience for users, you can provide some configuration options in an iframe that allows users to edit certain settings directly on your site, while others are kept in the Weebly dialog. We'll provide a button in the dialog to open your site in an iframe.
{% include note.html content="Your server must be appropriately configured to send the right headers to allow us to load up the iframe. Please read the documentation about the [`X-Frame-Options HTTP header`](https://developer.mozilla.org/en-US/docs/Web/HTTP/X-Frame-Options) for more information." %}
​By default, the dialog that is opened for editing settings is an 800x600 modal.  You can change this with the `height` and `width` properties. The modal that we generate will never grow beyond the page bounds, regardless of the size specified in your manifest. You can instead choose it to be set to be `fullscreen`.
{% include note.html content="Your iframe settings panel should be constructed to expect requests from differently sized clients, as many users may not have the screen real estate expected." %}
​If your element does not have any visible settings or settings that use the Weebly dialog (they are all in the iframe), then only the iframe is displayed.

Set the following to create external settings:

* `url`: A URL that contains a self-hosted page for editing settings.  The URL must use the `HTTPS` protocol.
    {% include note.html content="All URLs must use the `HTTPS` protocol. You will not be able to upload an app that uses `HTTP`." %}
    We use a JSON web token (JWT) to inject information, including their `user_id`, `site_id`, `element_id`, `element_uuid`, `iat` (issued-at timestamp - i.e. the time the token was generated), and the `jti` (JWT token ID).
    {% include note.html content="Weebly automatically appends the JWT string to the end of the URL, including any necessary operands (like `?` and `&`). If you want the JWT to be placed in a specific part of the URL, you can use `:jwt`, and Weebly will replace that with the JWT (without adding any operands - you'll need to include those)." %}

    Below is an example of how to decode the JWT hash:

    `$decoded = JWT::decode($_GET['jwt'], $client_secret, array('HS256'));`
* `label`: This string will be used as the label for button displayed in the dialog to open the iframe. Below shows what might be displayed if you set this to "Edit Your Map."
    {% include image.html file="externalButton2.png" caption="Button using the label property to open an iframe" %}
* `height`: The height the modal should be set to. Your iframe will be placed inside this modal size. Do not set if you want the modal to be fullscreen.
* `width`: The width the modal should be set to. Your iframe will be placed inside this modal size. Do not set if you want the modal to be fullscreen.
* `modal`: Set to `true` to have your iframe display in a modal. Set to `false` to allow the user to interact with the Weebly editor in the background.
* `fullscreen`: Set to `true` to have your iframe display in the entire screen area.
    {% include note.html content="`Fullscreen` should be used only when absolutely necessary, as it breaks the design flow for the user." %}

The following shows an external setting using a modal:
{% highlight json %}
"elements": [
    {
        "path": "elements/ExampleElement",
        "name": "Example Element",
        "settings": {
            "config": {
                "external": {
                    "url": "https://example.com/:jwt",
                    "label": "Configure Advanced Settings",
                    "height": 250,
                    "width": 400,
                    "modal": true,
                    "fullscreen": false
                }
            },
        "properties": [...]
        }
    }]
}
{% endhighlight %}

## Combine External and Native Settings

Your element can use both external and native settings. Simply create the external settings as children to the config element and create native settings as children to the properties element, as shown in the following example.
{% highlight json %}
"elements": [{
    "path": "files",
    "name": "Example Element",
    "version": "1.0.1",
    "settings": {
        "config": {
            "external": {
                "url": "https://example.com/:jwt"
                "label": "Edit Your External Settings",
                "height":800,
                "width":1024,
                "modal": true,
                "fullscreen": true
            },
            "autopop": false
        },
    "properties": [{
            "type": "group",
            "name": "settings",
            "label": "Settings",
            "properties": [
            {
                "name": "height",
                "label": "Height",
                "default": "medium",
                "type": "select",
                "values": [
                    "small",
                    "medium",
                    "large"
                ]
            },
            {
                "name": "zoom",
                "label": "Zoom",
                "default": 5,
                "type": "slider",
                "step": 1,
                "min": 0,
                "max": 10
            },
            ]
        }]
    }
}]
{% endhighlight %}

## Pass Data to Weebly

To pass data between your external settings page and our system, we leverage the [`postMessage`](https://developer.mozilla.org/en-US/docs/Web/API/Window.postMessage) API.  All messages are in the form of objects containing `action` and `data` keys.
{%  highlight json %}
{
    "action": "ACTION_NAME",
    "data": {}
}
{% endhighlight %}

We support these actions:

* `settings:load`: This event is sent to your iframe once it is loaded and initialized.  The `data` key has two sub-keys.  First, `config`, which contains information about the current configuration of the element (such as `user_id`, `site_id`, and `element_id`). The second is `settings`, which is an object that contains key/value pairs of settings.  We do not pass the entire settings structure (including minimums, maximums, etc.).
* `settings:update`: This is an event you send to us. The `data` key should be a key/value hash of the settings and the value you hope to set them to.  This object is a modified copy of the `data.settings` key provided to you by `settings:load`.  If the settings are invalid, you will receive a `settings:invalid` `postMessage` back.  If the settings are successfully saved, you will receive the `settings:updated` event.
* `settings:invalid`: If you try to save settings but they are invalid, we `postMessage` back an action of `settings:invalid`.  The `data` key will contain setting names as keys, each having an array of errors as the value.  Only invalid settings will appear in this object.
* `settings:updated`: This is returned to your external frame after your settings are successfully saved after a `settings:update` call.  This event should be used to auto-close the settings dialog if you would like to to disappear after a successfull save.
* `dialog:close`: You may trigger this action at any time to tell our system to close the settings dialog.

When sending messages to us, you must ensure that you are sending them to the correct domain endpoint.  The easiest way to do this is to listen for the initial `settings:load` event and store the origin URL for later use:
{% highlight js %}
window.addEventListener("message", function(evt))
{
    window.frameOrigin = evt.origin;
    var message = evt.data;

    if(message.action == “settings:load”){
        console.log(“Got settings!”);
        console.log(message.data);
        parent.postMessage({action: “dialog:close”}, window.frameOrigin);
    }
});
{% endhighlight %}

{% include note.html content="You **must** remain on the same host/domain that you specify in `manifest.json`.  Any redirects will cause the `postMessage` protocol to fail. Additionally, all URLS must use the `HTTPS` protocol." %}

## Access Settings from Your App
You can access your settings from anywhere within your application code, including JavaScript, CSS, and templates. Please see the various sections for {% if site.project=="designer" %}[templates](ds_apps_element_temp.html){%elsif site.project=="cloud" %}[template](cl_apps_element_temp.html){%elsif site.project=="platform" %}[template](pf_apps_element_temp.html){%endif%}, {% if site.project=="designer" %}[JavaScript](ds_apps_element_js.html){%elsif site.project=="cloud" %}[JavaScript](cl_apps_element_js.html){%elsif site.project=="platform" %}[JavaScript](pf_apps_element_js.html){%endif%}, and {% if site.project=="designer" %}[CSS](ds_apps_element_style.html){%elsif site.project=="cloud" %}[CSS](cl_apps_element_style.html){%elsif site.project=="platform" %}[CSS](pf_apps_element_style.html){%endif%} for information on how to access them from each location.
