## About Color Variations

Color Variations allow you to create different versions of a theme, like a light version and a dark version. The light version might use a white header and dark text, while the dark version might use a black header and light text. For example, this theme has both a light and dark version that can be applied to the selected palette:
{% include image.html file="theme_paletteBlue.png" caption="Theme with light and dark variations" %}

The light version uses a light navigation area, as shown above, while the dark version uses black instead:
{% include image.html file="theme_paletteBlueDark.png" caption="Dark version of the same theme" %}
​
Additionally, some Weebly themes have color variations. However, unlike color palettes, the user can't select the colors to be used. For example, the theme shown below has four color options. In this example, the blue version is selected.
{% include image.html file="theme_variations.png" caption="Color variations in a theme" %}

And in this one, the dark red version is selected.
{% include image.html file="theme_variationsRed.png" caption="Red variation of the same theme" %}

​As a theme designer, you can create these variations and determine which parts of a site will change when the color is changed.

<div class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip:</b> Check out our {% if site.project=="designer" %}<a href="ds_themes_design_resources.html"> resources</a>{%elsif site.project=="cloud" %}<a href="cl_themes_design_resources.html"> resources</a>{%elsif site.project=="platform" %}<a href="pf_themes_design_resources.html"> resources</a>{%endif%} for help with color decisions. </div>
​
You configure variations in the manifest file and then implement styles for each variation. You can use either LESS or CSS.

## Create Color Variations in LESS

When using LESS, you configure the different color variations in the manifest file. The first one defined will be the one selected by default in the editor.
Use the following properties in the manifest to define the color variation:

* `value`: Name of the color. If you are creating light and dark versions for color palettes, then use `light` and `dark`, respectively.

* `sample`: The hex value that you want to display as the choice circle in the Theme tab. If you are creating light and dark versions for color palettes, then use  `#fff` and `#000`, respectively.

* `is dark`: ​Set to `true` if this variation is dark and needs the site to automatically adjust fonts and other styling where needed. See {% if site.project=="designer" %}[Create the Theme Manifest](ds_themes_manifest.html){%elsif site.project=="cloud" %}[Create the Theme Manifest](cl_themes_manifest.html){%elsif site.project=="platform" %}[Create the Theme Manifest](pf_themes_manifest.html){%endif%} for details. If you are creating light and dark versions for color palettes, then use `false` and `true`, respectively.

Here's what the manifest entries for a theme using light and dark variations for color palettes looks like:

{% highlight json %}
"variations": [
    {
        "value": "light",
        "sample": "#fff",
        "is-dark": false
    },
    {
        "value": "dark",
        "sample": "#000",
        "is-dark": true
    }
],

{% endhighlight %}

​Here's what the manifest entries for a theme that has a light blue and dark blue variation might look:

{% highlight json %}

"variations": [
    {
        "value" : "ltBlue";
        "sample": "#E0F5FF";
        "is-dark": false
    },

    {
        "value" : "dkBlue";
        "sample": "#336680";
        "is-dark": true
    }
],
{% endhighlight %}

You then create a stylesheet separate from the `main.less` file named `variables.less`. This stylesheet holds the properties that change with each color variation. Each property is defined as a variable with a default style.

For example, your default `variables.less` file might define these variables:

{% highlight css %}
@bg_color: #ffffff;
@text_color: #888888;
@border_color: #e1e1e1;
{% endhighlight %}


Next, you edit the `main.less` file to use those values, like this:

{% highlight css %}
body {
    width: 100%;
    background: @bg_color;
}

#footer {
    border-top: 2px solid @border_color;
}
{% endhighlight %}

You then need to create a variation stylesheet for each color variation. Named the file `variables_<variationName>.less`, and add the values for that color.
For example, the dark blue variation might have a file named `variables_dkBlue.less` that looks like this:
{% highlight css %}
@bg_color: #212121;
@text_color: #b1b1b1;
@border_color:#55555
{% endhighlight %}

{% include note.html content="The file loading order for LESS files is first `variables.less`, then `variables_<variationName>.less` (which allows the color options to override the default), and lastly `main.less`. Make sure you do not define values for any variables in your `main.less` file, or they will overwrite values in the variable files." %}

Also, if all your variable color files are overwriting *all* the variables in `variables.less`, then you don't need to create `variables.less`. Simply create a variables file for each color.


##  Create the Variation Styles in CSS

{% include note.html content="If your theme uses a color palette, then you must use LESS instead of CSS." %}

If your theme uses CSS, then your variations can live at the top of the `main_style.css` file. Create commented-out JSON that contains the different values for CSS properties for each variation.

You need to define at least the following properties, along with any style properties you want to override:

* `value`: The name of variable that will be used to identify this color. This needs to be unique.
* `sample`: The hex value for the color variation's main color. It is used for the circle in the Theme tab that the user clicks to select the variation.

You can use as many properties as you want, but each color variation must contain the same properties.

For example, the following example shows the color variations for a light variation and a dark variation.

{% highlight json %}        
/* Variables
{
    Color: [
    {
        value: 'ltblue',
        sample: '#E0F5FF',
        bg_color: '#E0F5FF',
        text_color: '#888888',
        accent_color: '#555555',
        border_color: '#e1e1e1',
        button_bg: '#888888',
        button_hover: '#cccccc',
        alt_button_bg: '#333333',
        alt_button_hover: '#555555'
    },
    {
        value: 'dkBlue',
        sample: '#336680',
        bg_color: '#336680',
        text_color: '#b1b1b1',
        accent_color: '#ffffff',
        border_color:'#55555',
        button_bg: '#b1b1b1',
        button_hover: '#cccccc',
        alt_button_bg: '#f1f1f1',
        alt_button_hover: '#ffffff'
    }
    ]
}
----------------------------------------------*/
/* Resets
----------------------------------------------*/
. . .
{% endhighlight %}

You can now refer to these in your stylesheet using a $, like this:

{% highlight css %}
body {
    width: 100%;
    background: $bg_color;
}

#footer {
    border-top: 2px solid $border_color;
}
{% endhighlight %}

The correct color will be applied to the variable based on the color selected on the Theme Tab.