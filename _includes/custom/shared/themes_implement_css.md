For CSS, there is one main stylesheet, `main_style.css`. If your theme uses {% if site.project=="designer" %}[color variations](ds_themes_variations.html){%elsif site.project=="cloud" %}[color variations](cl_themes_variations.html){%elsif site.project=="platform" %}[color variations](pf_themes_variations.html){%endif%}, then those different variations are declared in JSON at the beginning of the stylesheet. For LESS, there is one main stylesheet, `main.less`, and if using color variations, there will be a stylesheet for each color.

{% include tip.html content="Start with the stylesheet from an existing theme so that you're sure to have all necessary classes and IDs styled." %}

## Reset Styles

Every theme stylesheet should include a `Reset` at the beginning. This clears all browser default styles and prepares a blank slate to style.

{%highlight css %}
ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, body, html, p, blockquote, fieldset, input, iframe, img {
    margin: 0;
    padding: 0;
    border:0;
}

a img {
    border: 0;
}

a {
    text-decoration: none;
}

body {
    -webkit-font-smoothing: antialiased;
    -moz-font-smoothing: antialiased;
    -o-font-smoothing: antialiased;
}

input:focus, select:focus, textarea:focus, button:focus {
    outline: none;
}
{%endhighlight%}

## Reference an Image

To reference an image in your stylesheet, use the image name and extension (`.jpg`, `.png`, etc.) as the URL path. Make sure to reference your images using the physical {% if site.project=="designer" %}[directory](ds_themes_directory.html){%elsif site.project=="cloud" %}[directory](cl_themes_directory.html){%elsif site.project=="platform" %}[directory](pf_themes_directory.html){%endif%} path, and not the logical path shown in the editor.

Here's an example CSS property that references the image file `pattern.jpg` in the root directory:
{% highlight css %}
background: transparent url(pattern.jpg) repeat-x center top;
{% endhighlight %}

## Page and Element Styles

When you create your styles, be sure to pay attention to the {% if site.project=="designer" %}[design guidelines](ds_themes_guidelines.html){%elsif site.project=="cloud" %}[design guidelines](cl_themes_guidelines.html){%elsif site.project=="platform" %}[design guidelines](pf_themes_guidelines.html){%endif%}, including the different {% if site.project=="designer" %}[pages](ds_themes_page.html){%elsif site.project=="cloud" %}[pages](cl_themes_page.html){%elsif site.project=="platform" %}[pages](pf_themes_page.html){%endif%} and {% if site.project=="designer" %}[elements](ds_themes_element_guidelines.html){%elsif site.project=="cloud" %}[elements](cl_themes_element_guidelines.html){%elsif site.project=="platform" %}[elements](pf_themes_element_guidelines.html){%endif%}. There are particular components and functionality on pages that your theme's styling must support. For example, the blog index page needs to support a sidebar and blog title and a blog title link. The Base theme styles those like this:

{%highlight css %}
.blog-sidebar {
    width: 250px;
}
.blog-title .blog-title-link {
    margin-bottom: .5em;
    display: block;
}
{% endhighlight %}

Additionally, certain Weebly elements allow configuration, and your theme must be able to support those. Feel free to review other themes' stylesheets for ideas!


## Layout Styles
The different layouts for the header types are the only CSS difference between the {% if site.project=="designer" %}[theme template types](ds_themes_anatomy.html#html-template-pages-and-layout){%elsif site.project=="cloud" %}[theme template types](cl_themes_anatomy.html#html-template-pages-and-layout){%elsif site.project=="platform" %}[theme template types](pf_themes_anatomy.html#html-template-pages-and-layout){%endif%}: `Header`, `No Header`, and `Splash`. You need to create styles for each header type that has a template.

{% highlight css %}
/* Header page */
.header-page .banner-wrap .banner h2 {
    font-size: 3em;
    line-height: 1.5em;
}

/* No header page */
.no-header-page .header-wrap {
    height: 50px;
}

.no-header-page .main-wrap > .container {
    padding-top: 3em;
}

/* Splash page */
.splash-page .main-wrap > .container {
    padding: 70px 1.5em;
    width: 100%;
}

.splash-page .content-wrap h2 {
    font-size: 3em;
    line-height: 1.5em;
}
{% endhighlight %}


## Color Variables in LESS

If you're using LESS, and you're creating color palettes or variations, then you'll use color variables to represent the colors that can be changed. In the `main.less` file, instead of defining a color for something like a header, you can use a variable whose value gets replaced based on the color choice made by the user.

For color palettes, the `@site-primary-color` and `@site-accent-color` variables represent the primary and accent color. The correct color displays based on which palette is in use. More info about creating color palettes {% if site.project=="designer" %}[here](ds_themes_palette.html){%elsif site.project=="cloud" %}[here](cl_themes_palette.html){%elsif site.project=="platform" %}[here](pf_themes_palette.html){%endif%}.

For color variations, you define variables in the main LESS file (for example you might define `background: @bg;` ), and then you provide the color values in each of the variations' LESS files. For example, a red variation file might have `@bg: #f44242` and a blue variation file might have `@bg: #4277f4`. More info about creating color variations {% if site.project=="designer" %}[here](ds_themes_variations.html){%elsif site.project=="cloud" %}[here](cl_themes_variations.html){%elsif site.project=="platform" %}[here](pf_themes_variations.html){%endif%}.

You can find more info about using color variables in LESS [here](http://lesscss.org/features/#variables-feature).