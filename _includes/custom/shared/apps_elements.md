## Element Basics

An element is made up of the following:
* **{% if site.project=="designer" %}[Manifest](ds_apps_manifest.html){%elsif site.project=="cloud" %}[Manifest](cl_apps_manifest.html){%elsif site.project=="platform" %}[Manifest](pf_apps_manifest.html){%endif%} file entries** (`manifest.json`): These entries describe the element and define the settings used to display the element. For example, your element might need color, size, or quantity properties to be set. You set default values for those properties in the manifest, and then a modal displays the properties and the user can change the defaults. Settings are not mandatory (think the Weebly Spacer element), can be displayed in the native Weebly settings modal or from an external web page displayed in an iframe.

    You can also configure tooltips for the settings or even a fully-functional tutorial for your element, including a video. The tutorial can be configured to automatically open when the element is first used, and can always be accessed from the Settings dialog.

* **Template** (`element.tpl`): This file creates the HTML to render the element. Templates can include text, images, and buttons that are directly editable by the user of the web site (called *content fields*). You can access settings from the manifest file and other data using mustache tags.

* **JavaScript library** (`element.js`): You can include JavaScript functions to add events, interactions, and effects to your element. You can access and update settings and other data from JavaScript using the Backbone Model. We include the jQuery and UnderscoreJS libraries for your use.
    {%include note.html content="If your app also needs to use these libraries, do not expose any global variables, including jQuery or Underscore, as conflicts may arise." %}

* ​**Stylesheet** (`element.css`): You style your element using CSS. We use the LESS CSS pre-processor, so you can write your stylesheet using LESS. You can access settings and other data in your stylesheet.

* **Assets**: You can include things like graphic files, snippets, etc. to complete your element. You must include the `.svg` icon that displays your element in the element tray. See the {% if site.project=="designer" %}[design guidelines](ds_apps_guides.html){%elsif site.project=="cloud" %}[design guidelines](cl_apps_guides.html){%elsif site.project=="platform" %}[design guidelines](pf_apps_guides.html){%endif%} for details.

If your element needs to behave differently in the editor than at runtime, you can include editor-specific versions of your stylesheet, JavaScript, and template.

As an example, here's the manifest for the sample Price Chart element. The `plans` property is defined as an integer that determines the number of price plans. The `features` property is defined as an integer that determines the number of features per plan. Both of these have a tooltip. The `alignment` property is set to default to the left.

The value of the `type` property in the settings determines the widgets that display the property. For example, a `type` of `text` displays a text box. A `type` of `int` displays a text box that validates for an integer. `Color` displays a color picker. You can find the complete list of types {% if site.project=="designer" %}[here](ds_apps_element_settings.html#setting-types){%elsif site.project=="cloud" %}[here](cl_apps_element_settings.html#setting-types){%elsif site.project=="platform" %}[here](pf_apps_element_settings.html#setting-types){%endif%}.




{%highlight json%}
    "properties": [{
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
        "tooltip": "Select the number of features for each plan."
    },
    {
        "name": "alignment",
        "label": "Align",
        "type": "align",
        "default": "center"
    }
}]
{%endhighlight%}

The `property` type group is used to group properties together. All properties must belong to a group, which is the top level property (there can be a single group). In the editor, each group displays in its own section in the modal.
​


The element’s HTML template uses a table to display the plans and features by retrieving the values of the `plans` and `features` settings in the manifest. The `plans` setting determines the number of columns to display, and the `features` setting determines the number of the rows.

{%highlight html%}
<table class="price-chart {{theme}} buttonLocation-{{location}}">
    <tr class="name">
        {{#plans_each}}
        <td class="cell">{name_{{plans_index}}:text default="Name #{{plans_index}}"}</td>
        {{/plans_each}}
    </tr>
    <tr class="price">
        {{#plans_each}}
        <td class="cell">{price_{{plans_index}}:text default="10"}</td>
        {{/plans_each}}
    </tr>
    . . .
    {{#features_each}}
    <tr class="metric">
        {{#plans_each}}
        <td class="cell">{metric_{{plans_index}}_{{features_index}}:text default="Metric #{{features_index}}"}</td>
        {{/plans_each}}
    </tr>
    {{/features_each}}
    <tr class="buttons-bottom">
        {{#plans_each}}
        <td class="cell">{buttonText_bottom_{{plans_index}}:button}</td>
        {{/plans_each}}
    </tr>
</table>
{%endhighlight%}

When the element is dropped on to a page, the following displays:
{%include image.html file="sh_priceChart.png" caption="The Weebly Price Chart"%}

The user can edit the **Plan** and **Feature** names directly, as well as the button text.

Here’s an illustration to help map the template and manifest code to what is displayed in the Settings dialog and the page:
{%include image.html file="elementDropMap2.png" caption="Settings in the manifest and template"%}

In addition to defining the properties for settings, you also use the manifest to configure how the element will function. When `autopop` is set to `true`, a dialog displays when the element is dropped from the tray. When set to `false`, the dialog displays only when the user interacts with (most usually clicks) the element once it’s  dropped on the page. You can create a tutorial for your element cand configure it to automatically display only the first time the element is dragged onto a page.

You can make a property private so that the data is not available to visitors of the site, and can only be used within the editor. This might be useful if the property contains private information (such as API Keys).

If you need the element properties to be set at an external site, you provide a URL to that site and the requested page displays in a modal, using JSON Web tokens (JWT) to pass in user information. You can use the `PostMessage` API to pass data between your page and Weebly. We add an invisible overlay div to your iframe so that users can click the element to access its settings. Once the settings panel is opened, the overlay is removed so that users can interact with your iframe.

Click {% if site.project=="designer" %}[here](ds_apps_element_manifest.html){%elsif site.project=="cloud" %}[here](cl_apps_element_manifest.html){%elsif site.project=="platform" %}[here](pf_apps_element_manifest.html){%endif%} to find out how to create the element and settings.

## Element Tutorials

When your element has a tricky configuration or might need some explaining to use properly, you can create a tutorial. You create it in the manifest, along with the settings. You can configure your tutorial to automatically open the first time the user drags the element onto the page. After that (or if you don't want it to automatically open), users access the tutorial from the Settings dialog.
{%include image.html file="tutorialModal.png" caption="Tutorial button in settings dialog"%}

Element tutorials include introductory text followed by these different types of content:
* **Steps**: You can include up to five numbered steps.
    {% include image.html file="tutorialSteps.png" caption="Tutorial steps" %}

* **Video**: You can provide a URL to a YouTube video that opens in a takeover window.
    {% include image.html file="tutorialVideo.png" caption="Tutorial video" %}

* **Nested topics**: If you want your tutorial to have more than one topic, you nest topics under a parent. You can create a full help set with up to 8 topics of step and/or video content. The name of each topic displays as a link on the main tutorial page. The resulting topics display within the dialog, with a link to go back to the main page.
    {% include image.html file="tutorialNested.png" caption="Main tutorial page with nested topics" %}

Click {% if site.project=="designer" %}[here](ds_apps_element_manifest.html#create-a-tutorial){%elsif site.project=="cloud" %}[here](cl_apps_element_manifest.html#create-a-tutorial){%elsif site.project=="platform" %}[here](pf_apps_element_manifest.html#create-a-tutorial){%endif%} to find out how to create an element tutorial.



