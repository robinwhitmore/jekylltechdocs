Now that we've changed the color up a bit, let's change the layout. The Base theme has three header templates: `Header`, `No-Header`, and `Splash`. Users can select which header template to use when they create a page.

{% include image.html file="theme_header_choice.png" caption="Users select the header type when creating a page." %}

Let's change the `Header` template by changing the navigation area so that the Title/Logo and Menu areas are on one line and have the Title area aligned to the left and the menu area aligned to the right.

1. {% include custom/notes/code_editor.md %}

2. From the `HEADER TYPE` directory, select `header.html`.

3. Find the `div` whose `id="header"` and delete everything in that div.

4. Since we want to have the logo and menu display on one line, we'll need to wrap them in a single `div`. The logo and menu are displayed using tags. If you use the `{title}` tag, only the title displays. If you use the `{logo}` tag, the user can choose whether to use the title or a logo file that they upload. Let's use the `{logo}` tag.​ And we'll use the `{menu}` tag to display the menu. The `nav-wrap` div is the wrapper div.

​Add the following code (excluding the header div):
    {% highlight html %}
<div id="header">
    <div class="nav-wrap">
        <div class="container">
            {logo}
            {menu}
        </div>
    </div>
</div>
    {% endhighlight %}

{% include image.html file="theme_header_edit.gif" caption="Replace the header content" %}

In the next step, we'll style the Title/Logo and Menu areas using the `.wsite-logo` and `.wsite-menu-default` classes, respectively.

### What Just Happened?
You edited the header template so that the title and navigation appear on one line. You now need to style the classes in the `main.less` file.
