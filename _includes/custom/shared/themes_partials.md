Partials are {% if site.project=="designer" %}[Mustache](ds_themes_mustache.html){%elsif site.project=="cloud" %}[Mustache](cl_themes_mustache.html){%elsif site.project=="platform" %}[Mustache](pf_themes_mustache.html){%endif%} template files that are included in a page, similar to an include, import, or a nested template.

You don't determine where partials display in your templates. Your templates only determine the layout of the large blocks of content, like headers, banners, footer, and sections. Partials and their content automatically display based on the type of page being rendered, such as a product or a blog.

Partials can render some variables and even render each other. For example, in addition to its own content, the blog post partial can reference the date (a variable) as well as render the blog comment section's partial. You can change the order that sub-partials display on the parent page. For example, on the product page in some themes, the social icons display below the price. In other themes they display below the Add to Cart button.

## Editing a Weebly Partial

Partials are written in a template engine called {% if site.project=="designer" %}[Mustache](ds_themes_mustache.html){%elsif site.project=="cloud" %}[Mustache](cl_themes_mustache.html){%elsif site.project=="platform" %}[Mustache](pf_themes_mustache.html){%endif%}. They are a mix of regular text or HTML plus some Mustache-specific markup. Here's a simple example:

{% highlight html %}
{%raw%}
Hello {{name}}
You have just won <b>{{value}}</b> dollars!
{%endraw%}
{% endhighlight %}


Here, `{{name}}` and `{{value}}` are variables and at runtime are replaced by actual data (check out the {% if site.project=="designer" %}[About Mustache](ds_themes_mustache.html){%elsif site.project=="cloud" %}[About Mustache](cl_themes_mustache.html){%elsif site.project=="platform" %}[About Mustache](pf_themes_mustache.html){%endif%} topic for more info, or visit the [Mustache site](https://mustache.github.io/mustache.5.html)). Partials only support the variables currently used on them. Also note that not all partials are available to edit.

Weebly partials can be accessed from the Code Editor. There are partials for blogs, commerce, membership, navigation, and search. You can edit the partials directly and add HTML, styling, or even another partial.
{% include note.html content="Do not change any classes or IDs used in a partial, as changes may affect the behavior of the site." %}

​For example, say you want to change how the blog date is displayed. By default, the `blog/post.tpl` partial contains the blog date, as shown here:

{% highlight html %}
{%raw%}
<p class="blog-date">
    {{{date_html}}}
</p>
{% endraw %}
{% endhighlight %}

Say you want to change it so that it displays in red. You might add style="color: red;" to the <p> tag that contains the date:

{% highlight html %}
    {%raw%}
<p class="blog-date" style="color:red;">
    {{{date_html}}}
</p>

{%endraw%}
{% endhighlight %}

Now, wherever that partial is used, the blog date will display in red.
{% include note.html content="All themes use the same default partials. Only customized partials are downloaded when you export a theme. So if you want to work in an external tool and want to change a partial, make a small change first in the Weebly editor, and then export the theme to work externally." %}


## Partial Maps

Use these topics to understand where Weebly partials are used in a site. Each topic outlines the partial's display area in blue, with a brief description of what that partial displays.

Partials are used in these areas:​
* {% if site.project=="designer" %}[Blog](ds_themes_blogPartials.html){%elsif site.project=="cloud" %}[Blog](cl_themes_blogPartials.html){%elsif site.project=="platform" %}[Blog](pf_themes_blogPartials.html){%endif%}
* {% if site.project=="designer" %}[Commerce](ds_themes_comPartials.html){%elsif site.project=="cloud" %}[Commerce](cl_themes_comPartials.html){%elsif site.project=="platform" %}[Commerce](pf_themes_comPartials.html){%endif%}
* {% if site.project=="designer" %}[Membership](ds_themes_membershipPartials.html){%elsif site.project=="cloud" %}[Membership](cl_themes_membershipPartials.html){%elsif site.project=="platform" %}[Membership](pf_themes_membershipPartials.html){%endif%}
* {% if site.project=="designer" %}[Navigation](ds_themes_navPartial.html){%elsif site.project=="cloud" %}[Navigation](cl_themes_navPartial.html){%elsif site.project=="platform" %}[Navigation](pf_themes_navPartial.html){%endif%}
* {% if site.project=="designer" %}[Search](ds_themes_searchPartials.html){%elsif site.project=="cloud" %}[Search](cl_themes_searchPartials.html){%elsif site.project=="platform" %}[Search](pf_themes_searchPartials.html){%endif%}


## Creating a Custom Partial

You can create a custom partial for inclusion in a Weebly partial. Create your custom partial using HTML. You can use the same variables that the parent partial uses.

Save your partials using the `.tpl` extension. Once you create a custom partial, you include it in another partial using this syntax:
{%raw%}`{{> example_partial }}`{%endraw%}