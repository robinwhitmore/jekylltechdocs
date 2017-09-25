You can create options for your theme so users can change some aspect of your theme just for their site. Let's create an option that allows users to set the header to 100% or to a fixed width of 1024px. Options are implemented in the manifest. You can read more about options {%if site.project=="designer"%}[here](ds_themes_options.html){%elsif site.project=="cloud"%}[here](cl_themes_options.html){%elsif site.project=="platform"%}[here](pf_themes_options.html){%endif%}.

1. {% include custom/notes/code_editor.md %}

2. Open the `manifest.json` file.
​
3. After the `color-presets` entry, enter the following (don't forget to add a comma to the end of the preceding line):

{% highlight json %}
"custom-options" : [
    {
    "name" : "banner-full-width",
    "title": "Full Width Banner",
    "type" : "toggle",
    "default" : true,
    "is-body-class" : true,
    "is-less-var" : false
    }
]
{% endhighlight %}

This code gives the name `banner-full-width` to the option and will be used to create classes that set the banner to full width or a set width. The title **Full Width Banner** will display in the editor. The type of `toggle` means that a switch will be used to turn the option on and off.

We've set the default to `true`, which means the option will be turned on by default. We've set the `is-body-class` to `true`, which allows us to use the `body.full-width-banner-off` and `body.full-width-banner-on` classes in the LESS stylesheet to change the banner

{:start="4"}
4. Let's use the `body.full-width-banner-on` class to make the header full width.
​    Open the `main.less` file, scroll down to the `header` area, and enter the following:
{% highlight css %}
body.banner-full-width-on{
    width: 100%;
    max-width: none;
    padding: 0;
}
{% endhighlight %}
{:start="5"}
5. Let's use the `body.full-width-banner-off` class to give the header a max width, instead of full width.
{% highlight css %}
body.banner-full-width-off {
    max-width: 1024px;
    margin: 0 auto;
}
{% endhighlight %}
{:start="6"}
6. Click **Save**.

In the editor, you'll now see a **Theme Options** menu. Click it and you'll see that the **Full Width Banner** option now appears. Click it to **Off** and note that header displays at a 1024px width.
{% include image.html file="theme_option_onoff.gif" caption="Turning the option on and off changes the display width of the header" %}

{% include note.html content="If the option doesn't display, refresh the browser window." %}

### What Just Happened?
You used the manifest to create options that the user can turn on and off for their site. These manifest entries create new style classes that allow you to control the display in the LESS file.