Let's add a default color palette that will define the main and accent colors for the theme. When you add a palette, users can change the default colors that you define to anything they want to use, giving your theme ultimate color flexibility.

​You define the default colors for the palette in the manifest, and then use variables in the LESS files to denote where the colors should be used.

Let's use the following as the primary and accent colors:
* Primary: #35235D (purple)
* Accent: #DB2464 (dark pink)​

{% include note.html type="tip" content="If at any time  the colors or display in the preview seem incorrect , it may be because the manifest has invalid JSON. You can use a validator like [this one](https://jsonlint.com/) to make sure your code is correct." %}


1. With the Base theme applied to your site, click the **Theme** tab.

2. At the bottom left, click **Edit HTML/CSS** to open the Code Editor.

3. In the left panel under the `Assets` directory, click `manifest.json` to open it.

    The manifest opens in the top half of the editor. You can see a preview of the site below the code.
​
4. In the manifest, after the `variations` element, add support for a color palette by entering the following:
{% highlight json %}
"color-support": {
    "primary": true,
    "accent": true
    },
{% endhighlight %}
{% include image.html file="theme_color_support.gif" caption="Add color support" %}
{:start="5"}
5. Define the colors by entering the following:
{% highlight json %}
"color-presets": [
    {
        "primary": "#35235D",
        "accent": "#DB2464"
    }
]
{% endhighlight %}
{% include image.html file="themes_colorpresets.gif" caption="Add presets" %}
{:start="6"}
6. ​Click Save.
    
    The palette displays in the editor. Click on the first circle to apply that palette.
    
{% include note.html content="​Nothing will change in the preview because we need to now use the primary and accent colors in the theme." %}

{% include image.html file="theme_palette.png" caption="Color palette with two colors" %}

{% include note.html type="tip" content="If you don't see the palette, try refreshing your browser." %}


### What Just Happened?
You created a palette with a defined primary and accent color that allows the user to define their own palette colors. Next, you'll create light and dark variations of the theme.
