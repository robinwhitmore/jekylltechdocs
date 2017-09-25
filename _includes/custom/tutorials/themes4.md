{%if site.project=="designer"%}[Variations](ds_themes_variations.html){%elsif site.project=="cloud"%}[Variations](cl_themes_variations.html){%elsif site.project=="platform"%}[Variations](pf_themes_variations.html){%endif%} allow you to control certain color aspects of a theme (unlike palette colors, users can't pick their own colors). The Base theme has a light and a dark variation. The light variation uses a white background in the header and the dark variation uses black.
{% include image.html file="themeLightDark.png" caption="Light and dark variations of a theme" %}

Each variation uses it's own LESS file to define color variables, which are then used in the `main.less` file. For example, the Base theme's variation LESS files have variables for the background color (`@bg_color`), the text color (`@text_color`), and an accent color (`@accent_color`). Here's what's in the `variables_light.less` file:

{% highlight css %}
@bg_color: #ffffff;
@text_color: #888888;
@accent_color: #555555;
@border_color: #e1e1e1;
@button_bg: #888888;
@button_hover: #cccccc;
@alt_button_bg: #333333;
@alt_button_hover: #555555;
{% endhighlight %}

In the `main.less` file, those variables are used to style HTML elements. For example, the body element is styled using the `@bg_color` variable:

{% highlight css %}
body {
    width: 100%;
    background: @bg_color;
}
{% endhighlight %}

When a user selects a variation, the body element uses the background color defined for that variation. Because background color in the `variables_light` file is `@bg_color: #ffffff;`, when a user chooses that variation, the background color is white.

Let's use the primary and accent color we just created in the variations. Let's have text use the primary color and let's change the color currently defined for the accent color to use our palette's accent color instead.

1. {% include custom/notes/code_editor.md %}

2. Under the `STYLES` directory, open the `variables_light.less` file.
​
3. Change the `@accent_color` variable definition to be `@site-accent-color`.

    {% highlight css %}
    @bg_color: #ffffff;
    @text_color: #888888;
    @accent_color: @site-accent-color;
    @border_color: #e1e1e1;
    . . .
    {%endhighlight%}

{:start="4"}
4. Change the `@text_color` variable to be `@site-primary-color`.
    {% highlight css %}
    @bg_color: #ffffff;
    @text_color: @site-primary-color;
    @accent_color: @site-accent-color;
    @border_color: #e1e1e1;
    {% endhighlight %}

{% include image.html file="theme_variables.gif" caption="Setting variations in styles" %}

{:start="5"}
5. Open `variables_dark.less` file and make the same edits.
​
6. Click **Save**.
​
​7. In the **Theme** tab, click on the **Dark** variation.

It's really hard to see the dark purple text when using the dark variation, so let's lighten it up. Instead of using a different color, let's just lighten the variable by 50%. That way, if the user changes the primary color in the palette, the new color will still be used, but it will be light enough to see on a dark background.

1. Open the `variables_dark.less` file and replace the value for the `@text_color` variable with `lighten(@site-primary-color, 50%);`.

2. Click **Save** and note that the color is now lighter.

3. Go ahead and create another palette as a user might, by clicking in the blank circle and using the dropdowns to create different primary and accent colors and notice how the theme changes.


### What Just Happened?
You created a light and dark variation of the theme. The title and navigation links are now using the palette colors. Let's see why.
​
Reopen the editor (click **Edit HTML/CSS**) and open the `main.less` file. This file holds the styles for the theme. Scroll down to the **Text and type** area and note that body text color is using the `@text_color` variable, so now it will use our primary color. And links are using the `@accent_color` variable, so they will now use the accent color from the palette.



