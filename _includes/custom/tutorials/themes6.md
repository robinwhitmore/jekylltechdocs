Let's style the title and menu.​ We'll use the accent color we added for the title and menu. And we'll also use the `float` CSS property to move the title and menu.

1. {% include custom/notes/code_editor.md %}

2. Under the **Styles** area, click `main.less` to open it.​
​
3. Scroll down to the **Header** area to find the `.wsite-logo` class. You'll notice that there is styling for the link color (logos by default are a link to the home page), an image height (for when a user uploads a logo graphic to use instead of the title text), and styling for the title text. The link style uses the accent color we created:
{% highlight css %}
.wsite-logo {
    display: block;
    margin: 20px auto 0;

    a {
        color: @accent_color;
    }

    img {
        max-height: 150px;
    }

    #wsite-title {
        font-family: "Raleway";
        font-size: 2em;
        font-weight: bold;
    }
}
{% endhighlight %}

Let's float the entire logo area to the left. Let's also make the title bigger. ​​
    For the `.wsite-logo` class, add a `float` property and set it to `left`.
    For the `#wsite-title` element, change the `font-size` property to `5em`.

{% highlight css %}
.wsite-logo {
    display: block;
    margin: 20px auto 0;
    float: left;

    a {
        color: @accent_color;
    }

    img {
        max-height: 150px;
    }

    #wsite-title {
        font-family: "Raleway";
        font-size: 5em;
        font-weight: bold;
    }
}
{% endhighlight %}

{% include image.html file="theme_float_left.gif" caption="Change the styles pf title to use our accent color and change the size to be larger" %}

{:start="4"}
5. Now let's float the menu to the right. Scroll down to the **Navigation** area until you find the `.wsite-menu-default` class. Like the `.wsite-logo` class, this menu class includes styles for multiple aspects of the menu, including active and hover link styles, font styles and padding. Since the link color uses the `@text_color` variable, it will use the primary color set by the user (remember we set the `@text_color` variable to use the `@site-primary-color` variable in {%if site.project=="designer"%}[Step 5](ds_themes_5.html){%elsif site.project=="cloud"%}[Step 5](cl_themes_5.html){%elsif site.project=="platform"%}[Step 5](pf_themes_5.html){%endif%}). And the link hover style will use the accent color.

{% highlight css %}
.wsite-menu-default {
    margin: 0 auto;

    li {
        list-style: none;
        display: inline-block;
    }

    a {
        display: block;
        font-size: 15px;
        padding: 20px 10px;
        color: @text_color;
    }

    a:hover,
    #active a {
        color: @accent_color;
    }
}
{% endhighlight %}

Let's float the menu to the right by adding the `float` property, and change the text so that it's all uppercase by adding the `text-transform` property.

{% highlight css %}
.wsite-menu-default {
    margin: 0 auto;
    float: right;

    li {
        list-style: none;
        display: inline-block;
    }

    a {
        display: block;
        font-size: 15px;
        padding: 20px 10px;
        color: @text_color;
        text-transform: uppercase;
    }

    a:hover,
    #active a {
        color: @accent_color;
    }
}
{% endhighlight %}

{% include image.html file="theme_float_right.gif" caption="Float the menu to the right and change the text to uppercase" %}

{:start="5"}
7. Click **Save**.

The layout of the header has changed. If the title doesn't seem to be lining up correctly, it's because the editor window is too small.
​
{% include image.html file="theme_header_new.png" caption="Changed header layout" %}
Ok! We're done changing the styling of the header template. Pages using the `Header` template reflect the changes we made. Now let's change how blog pages look.

### What Just Happened?
You edited the `main.less` stylesheet and used CSS properties to change the display of the title and the menu.
