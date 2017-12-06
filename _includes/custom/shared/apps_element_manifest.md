## Define the Element

An element is defined using the `elements` property that lives at the root of `manifest.json`.
Each element must contain the following properties (see the {% if site.project=="designer" %}[example](ds_apps_element_man_ex.html){%elsif site.project=="cloud" %}[example](cl_apps_element_man_ex.html){%elsif site.project=="platform" %}[example](pf_apps_element_man_ex.html){%endif%} for additional help):
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

## Create a Tutorial

You create a tutorial in the manifest. You can configure it so that it opens the first time a user drags your element to the page. Otherwise, the tutorial is accessed from a Tutorial button in the settings dialog. Tutorial topics can be either stepped content or embedded videos, and you can nest one level of up to 8 topics.

{% include note.html content="Use HTML only for links. These must open in a new tab/window." %}

Use the following properties to create your tutorial in the manifest:

* `tutorial`: Property used to group the tutorial content. This is placed at the same level as the `settings` property.
* `label`: Required when nesting topics, this is the name of the nested topic. It displays as the title in the parent topic. Use only for nested topics.
* `introduction`: The text that appears at the top of the dialog. If you are nesting topics, each has its own introduction.
* `type`: The type of content in this topic. Valid values are:
    * `steps`: Creates a numbered procedure list.
    * `video`: Embeds a YouTube video.
    * `topics`: Denotes this as the parent topic to nested child topics
* `content`: Holds the actual content to display. Valid values depend on the type.
    * `steps`: An array of strings, one for each step. The maximum number of steps is 5.
    * `video`: Enter the YouTube ID as a string (for example, as29f83)
* `autopop`: Set to `true` to have the tutorial automatically open the first time the user drags the element onto the page. The default is `false`. If you also set `autopop=true` on your element, the tutorial opens first and then the settings dialog.

​Here's an example of a tutorial consisting of one stepped topic:

{% highlight json %}
"tutorial": {
    "introduction": "The price chart is a simple way to visually compare different plans with their features and prices.",
    "type": "steps",
    "content": [
        "Choose the number of plans you would like. Each plan will add a new column to the chart.",
        "Choose the number of features for each plan. Each feature will add a row to the chart.",
        "Modify the currency setting to ensure the price of each plan is in the correct currency.",
        "Fill out each plan's name, price, and list of features.",
        "Choose where to put your sign up button. It can be place at the end of the features list or at the top with the plan's price.",
    ],
    "autopop": true
}
. . .
{% endhighlight %}

You create more than one topic by nesting an array of topics as content for the parent, being sure to set the parent to `type=topics`.  Use the `label` property for each child topic to set the title bar of the dialog. You can have a maximum of 8 nested topics.

​Here's a tutorial with nested topics - the first one is a stepped topic and the second is a video.

{% highlight json %}
"tutorial": {
    "introduction": "The price chart is a simple way to visually compare different plans with their features and prices.",
    "type": "topics",
    "content": [
        {
            "label": "Setup instructions",
            "introduction": "Follow these simple steps to help you get started!",
            "type": "steps",
            "content": [
                "Choose the number of plans you would like. Each plan will add a new column to the chart.",
                "Choose the number of features for each plan. Each feature will add a row to the chart.",
                "Modify the currency setting to ensure the price of each plan is in the correct currency.",
                "Fill out each plan's name, price, and list of features.",
                "Choose where to put your sign up button. It can be place at the end of the features list or at the top with the plan's price.",
            ]
        },
        {
            "label": "Build an online store",
            "introduction": "View an in-depth webinar about building an online store with Weebly.",
            "type": "video",
            "content": "6clKBa8x1qk"
        }
    ],
    "autopop": true
}
{% endhighlight %}
