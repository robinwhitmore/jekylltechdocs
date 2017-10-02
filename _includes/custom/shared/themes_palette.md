## About Color Palettes

Color palettes allow you to provide pre-defined primary and accent color schemes for your theme, but also allow the user to create their own. You determine where the primary and accent colors are used (or variations of them), and provide default values for those colors. Users can't change where they are used, but can change the colors that are used.

For example, this theme offers two default palettes - a blue one and a pink one. On the page being shown, the primary color is used for the title and as a color overlay on the image.
{% include image.html file="theme_paletteBlue.png" caption="The blue palette colors the title and the color overlay" %}

Here's the same theme using the pink palette. Notice where the primary color is used hasn't changed, but the color itself has.
{% include image.html file="theme_paletteRose.png" caption="Now the primary color of dark rose is used in place of the blue" %}

Users can select their own primary and accent colors using the eyderopper.
{% include image.html file="theme_palettePrimaryAccent.png" caption="Users select colors by clicking the eyedropper and then using the dropdowns to choose colors" %}

You create palettes by defining variables in the theme's manifest that are used in the LESS stylesheets.
{% include note.html content="Color palettes are only supported using LESS. You cannot use color palettes with CSS." %}

## Create a Color Palette

You create a color palette by turning on the feature and then optionally defining colors in one or more palettes.

To allow a palette for your theme, add the color-support element to the theme's manifest and determine if you'll support a primary and an accent color or just a primary color.

{% highlight json %}
"color-support": {
    "primary": true,
    "accent": true
}
{% endhighlight %}

Adding this support creates the dropper icon that allows the user to create their own palette. Supporting just a primary color means the user can only choose one color. Supporting both allows the user to choose a color for both. This image shows support for just a primary color:
{% include image.html file="theme_palettePrimary.png" caption="You can define just a primary color in your palette" %}

​This theme allows both a primary and accent color:
{% include image.html file="theme_palettePrimaryAccent.png" caption="Or a primary and accent color can be configured" %}

Optionally create a default palette by defining a primary and/or an accent color within an array of palette colors (a palette must be in an array even if there is only one).

{% highlight json %}
"color-presets": [
    {
        "primary": "#171b6d",
        "accent": "#ad8d0c"
    }
],
{% endhighlight %}

You can create as many palettes in the array as you'd like.

{% highlight json %}
"color-presets": [
    {
        "primary": "#171b6d",
        "accent": "#ad8d0c"
    },
    {
        "primary": "#bc3089",
        "accent": "#a0d9e2"
    }
],
{% endhighlight %}

Once the palette(s) are defined, they display in the sidebar where the user can choose one or create their own. ​If you don't create a palette, (but do add the color-support element), then only the eyedropper icon displays, allowing the user to create their own palette.


## Using Color Palettes in LESS

Once you define a palette(s), then you determine where those colors are used in the theme. You use LESS variables in your stylesheet to represent the colors. That way, when the user selects one of the palettes, or creates their own, the right color is used:

* **Primary color**: `@site-primary-color`
* **Accent color**: `@site-accent-color`

​For example, if you want titles to use the primary color and buttons to use the accent color, you might add the following to your `main.less` file.

{% highlight css %}
h1 {
    color: @site-primary-color;
. . .
}

.wsite-button {
    background-color: @site-accent-color;
. . .
}
{% endhighlight %}

You can use LESS color operation functions to provide variations on the primary and accent colors, while still keeping within the palette. For example, you might set `h2` to be a slightly lighter shade of the primary color using the `tint` function:

{% highlight css %}
h2 {
    color: tint(@site-primary-color, 50%);
. . .
}
{% endhighlight %}

You can find more about using LESS color operations functions [here](http://lesscss.org/functions/#color-operations).

​​To provide more color flexibility for your palettes, you can create a dark and light version. Follow the procedures for creating {% if site.project=="designer" %}[color variations](ds_themes_variations.html){%elsif site.project=="cloud" %}[color variations](cl_themes_variations.html){%elsif site.project=="platform" %}[color variations](pf_themes_variations.html){%endif%}, using the palette variables in versions' LESS file. Name the light version `variables_light.less` and the dark `variables_dark.less`.