When you work in the Weebly Code Editor, you'll see your changes reflected on a web site as you make them. So let's create a test site that we can use for our theme.
{% if site.project=="cloud" or "designer" %}
1. Follow the instructions {%if site.project=="designer"%}[here](ds_cr_sites.html){%elsif site.project=="cloud"%}[here](cl_cr_sites.html){%elsif site.project=="platform"%}[here](pf_cr_sites.html){%endif%} to create your test site.
Don't use a template, or copy an existing site.
{% elsif site.project=="platform" %}
2. In the {{site.portal}}, click Edit Site.
1. Create a site.
{% include image.html file="theme_newSite.png" caption="Creating a new site " %}
{%endif%}

    Choose any theme as you create the site - we'll be changing it​

2. We'll be making changes to how blogs display, so you need to create a blog post. Be sure to give it a title. Follow the instructions [here](https://hc.weebly.com/hc/en-us/articles/201405086-Create-a-Blog-Post) and save the post (don't publish/post it).
​

Now let's apply the Base theme.

1. Click the **Theme** tab.

2. Click **Change Theme**.

3. At the top right, click **Import Theme**.

4. Click **Select a Theme** and upload the zip you created named `MyTheme.zip`.
​
5. In the Theme Gallery, click the **Choose** link to apply your theme.

{% include image.html file="importTheme.gif" caption="Apply theme" %}
### What Just Happened?
You imported a custom theme and applied it to a test site. Next you'll add a color palette.
