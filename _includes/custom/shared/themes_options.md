## About Theme Options

When a Weebly theme includes options, users can configure them from the sidebar of the Theme tab in the editor. For example, the theme shown below allows the user to change aspects of the header.
{% include image.html file="theme_options.png" caption="Users can turn Search on and off or collapse the navigation bar in the header using options" %}

You can create the following types of options:

* **Toggle** (as shown in the Full Width Body option, above): Turns the option on or off for the site.
* **Dropdown** (as shown in the Header Style option): Choices are provided from a dropdown list.
* **Color**(as shown in the Header Overlay option): Choose a color to change some color aspect on a page. You must use LESS for your styles if you use this option.
* **Pixel**(as shown in the Header Spacing option):  Change the size of something on a page. You must use LESS for your styles if you use this option.

When you create a toggle option, a body class with the toggle's value gets added. The class name is the name you give the option, with `-on` or `-off` appended. You then can style those classes in your stylesheet. For example, say you create an option that allows the user to turn the search bar off and on and you name the option `search-bar`. Two classes will be created: one for when search is turned on called `search-bar-on`, and one for when it's off, called `search-bar-off`.

When you create a dropdown option with a number of values, then the classes will be the name of your option followed by the value. For example, if you create an option named `header-style` that determines the header style to use, and you define the choices to be `full-width` and `boxed`, you'd end up with two classes to be styled: `header-style-full-width`, and `header-style-boxed`.

The color and a pixel options are controlled with LESS variables whose name is created based on your option name. For example, if you created a color option named `header-overlay`, you will have a variable named `@header-overlay` to hold the chosen value. A pixel option named `header-spacing` will have the `@header-spacing` variable available to hold the value of the height. You must use LESS for your theme styles if you want to use these options.

## Create Options

You configure theme options in the {% if site.project=="designer" %}[manifest](ds_themes_manifest.html){%elsif site.project=="cloud" %}[manifest](cl_themes_manifest.html){%elsif site.project=="platform" %}[manifest](pf_themes_manifest.html){%endif%} file where you declare the option, it's type, default value, and if a dropdown type, the allowable values (including the default). The name that you give the option, along with the value of any choices, are used to create CSS classes or variables that can be styled.

Define the following properties for each option:

* `name`: Name of CSS class or variable that will be used to reference this option. The name cannot have spaces.
* `title`: The name that displays to the user in the editor.
* `type`: Specifies the option type. Choose from one of the following:
    * `toggle`: The option is either `on` or `off`
    * `dropdown`: The user makes a choice from a list. If you use this, then you must also create choices properties.
    * `color`: The user chooses a color.
    * `pixel`: The user sets a pixel size.
* `default`: The default value. Each type has a different type of default:
    * `toggle`: Either true or false. If no default is set, true will be used.
    * `dropdown`: One of the values configured in the choices property.  If no default is set, the first choice will be used.
    * `color`: A hex value
    * `pixel`: Don't use default. Instead, you can optionally set `min` and `max` properties to define a default size.
* `choices`: Only needed for dropdown types - create an array of value/title pairs for each choice. `value` is used to create the CSS class/variable to represent this choice, while `title` is displayed in the editor.
* `is-body-class`: Set to `true` for toggle and dropdown types. Set to `false` for color and pixel types.
    Creates a class based on the option name and attaches it to the body tags used in the site. This class allows you to style based on the selection.
* `is-less-var`: Set to `true` for color and pixel types. Set to `false` for toggle and dropdown types.
    Creates a LESS variable based on the option name, allowing you to style any selector that includes the variable.

## Option Examples

Say you want to create an option that turns the nav bar on and off.
Here's what the manifest entry might look like:

{% highlight json %} 
{
    "custom-options" : [
    . . .
        {
            "name" : "hide-nav",
            "title": "Collapse Navigation",
            "type" : "toggle",
            "default" : true,
            "is-body-class" : true,
            "is-less-var" : false
        }
    ]
}
    {% endhighlight %}

Here's what the entry in the `main_style.css` or `main.less` might be:

{% highlight css %}    
#navigation-bar {
/* navigation bar styling.
Don't need to style the "off" class, as we
want the nav bar to display....*/
body.hide-nav-on #navigation-bar {
    display: none; // hide nav bar
}
{% endhighlight %}

And here's how it displays in the editor:
{% include image.html file="theme_optionNav.png" caption="Option to hide (collapse) the navigation bar" %}

Here's a manifest example showing one of each type of option:

{% highlight json %}
"custom-options": [
{
    "name": "navbar-toggle",
    "title": "Toggle Nav Bar",
    "type": "toggle",
    "default": true,
    "is-body-class" : true,
    "is-less-var" : false
},
{
    "name": "banner-color",
    "title": "Banner Color",
    "type": "color",
    "default": "#000",
    "is-body-class" : false,
    "is-less-var" : true
},
{
    "name": "banner-height",
    "title": "Banner Height in pixels",
    "type": "pixel",
    "min": 100,
    "max": 500,
    "is-body-class" : false,
    "is-less-var" : true
},
{
    "name": "banner-location",
    "title": "Location of banner",
    "type": "dropdown",
    "default": "left",
    "choices": [
        {
            "value": "left",
            "title": "Left"
        },
        {
            "value": "right",
            "title": "Right"
        }
    ],
    "is-body-class" : true,
    "is-less-var" : false
 }
]
{% endhighlight %}

Your LESS stylesheet might then contain the following entries using the classes and variables created for the options.

For another example, check out our {% if site.project=="designer" %}[Base LESS](ds_themes_sample.html){%elsif site.project=="cloud" %}[Base LESS](cl_themes_sample.html){%elsif site.project=="platform" %}[Base LESS](pf_themes_sample.html){%endif%} theme example.

{% highlight css %}
body.banner-location-left {
    content: '';
    ...
    left: 0;
    height: @banner-height;
    background-color: @banner-color;
    ...
}

body.banner-location-right {
    content: '';
    ...
    right: 0;
    height: @banner-height;
    background-color: @banner-color;
    ...
}

body.navbar-toggle-off {
    display: none;
}
{% endhighlight %}