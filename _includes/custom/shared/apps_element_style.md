## Editor vs. Published Stylesheets

Your stylesheet files live in the {%if site.project=="designer"%}[`css` directory](ds_apps_element_folders.html){%elsif site.project=="cloud"%}[`css` directory](cl_apps_element_folders.html){%elsif site.project=="platform"%}[`css` directory](pf_apps_element_folders.html){%endif%} directory for your element. You need to create a file named `element.css`, which will be used for both the editor and the published site.  You can also provide an `editor_element.css` file, to be used only within the editor. This allows you to specify different styles when editing or configuring your element within the editor. This may be necessary when your element requires interactivity with the user on a published site, as the element placeholder in the editor cannot be interactive.

## Style Your Element to Work with Themes

How Weebly websites look - their colors, styles, layout - are determined by themes. Web site owners can change themes to change the look and feel of their website. Apps that you create need to look as though they belong, regardless of the theme that the owner chooses.

Weebly themes use Less and CSS to style the different elements on a web page, both when in the editor and on the published site. You need to make sure any HTML tags used in your app use correct classes and that you don't style these classes - you want them to inherit their style from the theme applied to the site. In fact, you should allow most of your HTML to be styled by the theme's CSS. The CSS for your app or element should style only those components that must appear the same in every site, no matter the theme.

These are the classes you must use and must **not** style:
* All input element used in forms: use `.wsite-form-input`
    These include text input as well as radios and checkboxes.
* Selects: use `.form-select`
* Buttons: Use `.wsite-button` and `.wsite-button-inner`
    These classes can be used on either link or button components.

## LESS CSS
Before rendering your CSS to the page, it is run through the [LESS CSS preprocessor](http://lesscss.org/), so you can use LESS CSS in your `element.css` and `editor_element.css` files. Your CSS is wrapped in a scoped selector, meaning the CSS affects the styling of only the contents within your elements.
Here's an example of a LESS variable used in a stylesheet:
{% highlight css %}
#color: ##FF0000;

.example {
    background-color: @color;
}
{% endhighlight %}

{% include note.html content="Because there may be multiple copies of one element on any given page, we strongly encourage you to use classes in your CSS or templates. Do not use IDs." %}

## Access Settings
All of your settings are available as LESS variables in your CSS files.  Simply access them as you would expect to in standard LESS fashion.
{% highlight css %}
.price-chart {
    @border: 1px solid @borderColor;
    width: 100%;
    background-color: @backgroundColor;
    border: @border;
    border-spacing: 0;
{% endhighlight %}

{% include note.html content="Some settings will be strings, including quotes.  In cases where LESS cannot properly set a variable, the variable is set as a string. You can \"un-stringify\" it with LESS String Interpolation." %}

## Access Additional Data
You can access the path to your elements' assets, similar to the way you access settings, using the `assets_path` variable. This is the HTTP accessible root path to your elements' assets folder, in protocol-agnostic form.  It is accessible as a property of your Element object:
{% highlight css%}
.example {
    background-image: url("@{assets_path}file.png");
}
{%endhighlight %}



