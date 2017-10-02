Every template file must contain the foundation code and the mandatory theme tags used to insert content. We also provide optional tags to pull in other pre-defined content, and you can create custom tags to create additional areas where users can add content. Aside from adding tags, you can also optionally create a header area and sections that allow your users to change the background, the layout, and for sections, the ability to copy and move them.

You can use existing HTML from another theme, or you can create your own from scratch. Make sure that your {% if site.project=="designer" %}[stylesheets](ds_themes_implement_css.html){%elsif site.project=="cloud" %}[stylesheets](cl_themes_implement_css.html){%elsif site.project=="platform" %}[stylesheets](pf_themes_implement_css.html){%endif%} support all styles that you use in the HTML.

## Create an HTML Template File ​

You need to create one template for each of the following header types that you want to support:
{% include custom/partials/parts_headers.md %}

​You can either create a template file by modifying an existing template, or by creating a new one.

To modify an existing template, simply open it in the Code Editor. To create a template from scratch, in the Code Editor, click the **+** icon next to **HEADER TYPE** and choose **New Header Type**. A file opens in the editor with the mandatory theme tags. You must add the foundation code and the code to display the mandatory tags (below). Click the **Settings** icon to set the name of the file, or to delete it.

You can also work externally and upload your template. Click the **+** icon and choose **Upload Header Type(s)**.


## The Foundation ​

​Every page type needs the basic foundation code, shown below. Give the `body` tag the class that reflects that page's type:
* **Header**: header-page
* **No Header**: no-header-page
* **Splash Page**: splash-page

For example, the sample below shows the foundation for a header template.

{% highlight html %}
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0;">
</head>
<body class="header-page">
</body>

</html>
{% endhighlight %}

​If you are creating your theme using an existing theme as a base, be sure you don't remove any of the foundation code.


## Mandatory Theme Tags ​

​All Weebly themes need to include the following tags:
* **{title}** or **{logo)**: Use `{title}` to display only the title of the site. Use `{logo}` to allow the site owner to decide whether to use the title or a logo file that they will upload.
* **{menu}**: Displays the pages in the site
* **{content}**: Displays the main content on the page. Much of this content is handled by {% if site.project=="designer" %}[partials](ds_themes_partials.html){%elsif site.project=="cloud" %}[partials](cl_themes_partials.html){%elsif site.project=="platform" %}[partials](pf_themes_partials.html){%endif%}.
* **{footer}**: Displays footer content at the bottom of the page

Where you place these tags and how you style the generated content is up to you. If you create a new file (and aren't editing one from an existing theme), then these are added for you.
{% include note.html content="The editor adds the {title} tag, but you can replace that with the {logo} tag if you want." %}
​​This graphic shows where these tags are used in the Base theme:
​{% include image.html file="themesHTML.png"  %}

​Here's the code from the Base theme showing the mandatory tags:

{%highlight html%}
<body class="header-page">
<div id="wrapper">
    <div id="header">
        <div class="container">
            . . .
            {logo}
            <div id="nav">{menu}</div>
        </div>
        <div id="mobile-nav">
            <input type="checkbox" id="mobile-input">
            {menu}
        </div>
    </div>
    . . .

    <div id="main">
        <div class="container">{content}</div>
    </div>
    <div id="footer">{footer}</div>
</div>
. . .
</body>
{% endhighlight %}


## Optional Tags

​If your theme supports social icons, search, and phone number/text using {% if site.project=="designer" %}[options](ds_themes_options.html){%elsif site.project=="cloud" %}[options](cl_themes_options.html){%elsif site.project=="platform" %}[options](pf_themes_options.html){%endif%}, then you need to add these tags:

* **{phone:text}**: Displays the text "Add Text" that the user can click to edit.
* **{social}**: Adds the ability to display social icons. The user can click the area to configure the icons to display.
* **{search}**: Displays the search icon.

If you want your theme to display a headline and supporting paragraph text (for example, on a landing page), then you can use these headline tags:

* **{headline:text}**: Displays placeholder text in a headline font that the user can edit/replace.
* **{headline-paragraph:text}**: Displays placeholder paragraph text.

This graphic shows where these tags are used in the Impact theme.
{% include note.html content="Site owners need to explicitly turn options (phone, social, search) on using Options. Search is only available in paid sites" %}

{% include image.html file="themesSocial.png" caption="Optional tags to display contact, social media, and search links" %}

​Here's code showing how these tags are used in the Impact theme.

{% highlight html %}
<div class="menu-controls-wrap">
    <div class="container">
        <div class="search">{search}</div>
        <div class="social">{social}</div>
        <div class="phone-number">{phone:text}</div>
    </div><!-- .menu-controls-wrap -->
    <div class="banner-wrap">
        <div class="container">
            <div class="banner">
                <h2>{headline:text global="false"}</h2>
                <p>{headline-paragraph:text global="false"}</p>
            </div>
        </div>
    </div><!-- banner-wrap -->
</div><!-- .menu-controls-wrap -->
{% endhighlight %}

​We also provide these predefined tags for you to use:

* **{action:button}**: Adds a button. The user can edit the button text and set the link, spacing, and button style.
* **{minicart}**: Relocates existing store minicart element from its default placement in the navigation bar. A wrapper populates with the class name `wsite-custom-minicart-wrapper`.
* **{membership}**: Relocates existing log in/log out element from its default placement in the navigation bar. A wrapper populates with the class name `wsite-custom-membership-wrapper`.
* **{subtitle:text}**: Adds a subtitle text/slogan.
* **{sidebar:content}**: Adds a sidebar to the website.
* **{address:text}**: Adds address fields.

By default, all tags show the same content on every page that uses this template's header type. However, you can allow unique content on each page by specifying the `global="false"` attribute. For example, if you use the `{subtitle:text}` tag, by default whatever the user enters for that text on one page appears on all pages that use that same header type. Instead, if you set it to `global="false"`, then they can set different text on each page.


## Custom Tags

​You can use the tags below to create custom-named areas where users can add content not covered by the predefined tags. Substitute area-name with a more meaningful word.

* **{area-name:text}**: An area that holds text
* **{area-name:content}**: An area to drag content elements into
* **{area-name:image}**: An area that holds an image

    Be sure to include size constraints, for example `{area-name:image max-width="200" max-height="200"}`.

For example, you might create an area for content specifically meant for information about the web site owner. You could create the tag `{user-info:text}`, and the user will see **Click here to edit**.

For example:

{% highlight html %}
<div class="user-info">
    <div class="user-name">{user-info:text}</div>
    <div class="user-address">{address:text}</div>
</div>
{% endhighlight %}

​You can also use the `global="false"` attribute for these tags. Don't forget to update your stylesheet to style these tags.


## Add a Header Area

​A header area is an optional area in the header that a user can configure as needed. When a user clicks into a header area, a popup menu displays and they can change the background image, color, and optionally add a video (if on a premium plan).
​
{% include image.html file="themeHeader.png" caption="Theme header area" %}

​​To add a header area, add the {%raw%}`{{#header}}`{%endraw%} tag at the end of the main `banner-wrap` `div`, as shown in the following code:

{% highlight html %}
{%raw%}
<div id="banner-wrap">
    <div id="header-wrap">
        <div id="header" class="container">
            <label id="nav-trigger" class="hamburger" for="mobile-input"><span></span></label>
            <h1 id="logo">{logo}</h1>
            <div id="nav">{menu}</div>
        </div>
        <div id="mobile-nav" class="container">
            {menu}
        </div>
    </div>
    {{#header}}
    <div id="banner" class="container">{content}</div>
    {{/header}}
</div>
{%endraw%}
{% endhighlight %}

​Use the `container` class to style as needed.


## Add a Section

Sections are optional areas where a user can drag content, allowing pages that use the same template to appear quite different, just by adding and designing sections. With sections, when the user clicks on the main content area, a popup menu displays showing options for designing the section. The user can also drag the blue outline to change the height of the section. ​
​
{% include image.html file="themesSectionChange.png" caption="Sections allow users to add content in different areas" %}

​To add a section to a template, add the `{{#sections}}` tag shown in the following code where you want the content to appear. The `container` class can be used to style the section, for example to set `max-width` and centering of the sections.

{% highlight html %}{%raw%}
[HEADER BLOCK]
<div id=“main-wrap”>
    {{#sections}}
    <div class="container">
        {content}
    </div>
    {{/sections}}
</div>
[FOOTER BLOCK]
{%endraw%}
{% endhighlight %}


## Design for Mobile ​

Most Weebly customers will want their website to work on desktop and mobile devices. Make sure that you handle displays on these smaller screens appropriately.