{% if site.project=="cloud"%}
## What is Weebly Cloud?

Weebly for Cloud provides your customers a best-in-class website builder to enable them to create their own website, blog or online store in minutes. You maintain full control over billing, support, and the customer relationship. The Weebly Cloud platform allows you to easily integrate Weebly into your existing internal application, CMS or third party web application. You can use our <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to manage users and sites or you can use our RESTful API to programmatically integrate with existing systems. You can also use plug-ins that allow you to integrate Weebly with existing systems.

{% elsif site.project=="designer"%}
## What is Weebly Cloud for Designers?

Weebly is a best-in-class website builder that allows you to create websites, blogs and online stores for your clients in minutes. You use our <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to manage {{site.customer}}s and sites and you can use our RESTful API to create custom apps to further your clients' sites functionality.

{% endif %}

## Create a Weebly Cloud Account

Your first step is to get a Weebly Cloud account. This account gives you access to Cloud Admin where you can access your {{site.customer}}'s information, along with your API key and secret that gives you access to the the Cloud API. If you don't have a Weebly Cloud account, then email our team [here](mailto:bd@weebly.com).

Once your account is set up, head on over to {%if site.project=="designer"%}[Configure Weebly Cloud](ds_gs_configure.html) {%elsif site.project=="cloud"%}[Configure Weebly Cloud](cl_gs_configure.html){%endif%} to finish setting up your account.



## Test Mode

When first getting acquainted with the Weebly Cloud, your account will be in <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.test_mode}}">test mode</a>. There are no functional limitations while in test mode, it simply defaults any users and sites created to test so that you won't be charged for them. They will be periodically removed from the system, but only after your Weebly Cloud account is in production mode.
{% if site.project=="cloud" %}
Once in production mode you can still create a test user in the Cloud Admin or by passing the optional parameter of **test_mode**. Learn more about the {%if site.project=="designer"%}[User API](ds_api_user.html) {%elsif site.project=="cloud"%}[User API](cl_api_user).{%endif%}
{% endif %}

{% if site.project=="cloud"%}
## Decide Where to Host the Weebly Sites

As a Weebly Cloud partner, you can either host the published sites on Weebly's infrastructure or on your own. When hosted at Weebly, all files live on the Weebly server. When you choose to host, all requests are made to your server and all static files reside on your server. But some requests require a call to a Weebly endpoint to return certain dynamic content.

In both hosting cases, the Weebly Editor (where your site owners create their sites) is hosted on Weebly. More info about hosting options can be found here.
{%endif%}

## The Cloud Admin
{% include custom/cloud_des/inc_cloudAdmin.md %}

## The User Portal
{% include custom/cloud_des/inc_userPortal.md %}

## Use the Weebly Editor
{% include custom/cloud_des/inc_weeblyEditor.md %}

## Add Apps
{% if site.project=="cloud"%}Your customers {%elsif site.project=="designer"%}You {%endif%}can add more functionality to web sites by visiting the Weebly App Center and downloading and installing apps created by Weebly and by third-party partners. ​{% if site.project=="cloud"%}Site owners {%elsif site.project=="designer"%}You {%endif%}can browse through collections, categories and sub-categories, can filter based on ratings, popularity, freshness, or for free apps, and can search using keywords.
{% include image.html file="appCenter.png" caption="The Weebly App Center" %}
You can control whether or not you want your {{site.customer}} to be able to visit the App Center, and if you do, you can make the center available only to sites on certain plans.

Additionally you can create your own apps and have them automatically installed based on the plan a site is associated with. More on the App Center and custom apps {%if site.project=="designer"%}[here](ds_gs_apps.html) {%elsif site.project=="cloud"%}[here](cl_gs_apps.html){%endif%}.

{% include note.html content="The App Center is not white-labeled. That is, the Weebly brand appears throughout the center." %}

## Customize Themes

A Weebly theme provides a general structure and design palette for any website built using the Weebly editor. Weebly strives to provide ultimate flexibility for our users, so our themes don't dictate a template or a mandatory organization of content. Instead, they provide a beautiful backdrop for the site's content.

While we provide a number of themes, you may want to create your own. Because themes need to have very specific structures and files in order to work on the Weebly platform, instead of creating a custom theme from scratch, you can start with any theme and then customize it to meet your needs. We also provide a base theme that you can use as a start. More about customizing themes {% if site.project=="designer" %}[here](ds_themes_start.html){%elsif site.project=="cloud" %}[here](cl_themes_start.html){%endif%}, including a tutorial that walks you through the process.

You can customize a theme directly from the Weebly Editor. Click the Theme tab and then click
**Edit HTML/CSS** to open the built-in Code Editor.
{% include image.html file="theme_codeEditor.png" caption="The Weebly Code Editor"%}<br>

​​​You {% if site.project=="designer" %}[manage](ds_themes_deliver.html){%elsif site.project=="cloud" %}[manage](cl_themes_deliver.html){%endif%} your custom themes from the Theme tab of the Cloud Admin. Any themes you add here are available for{%if site.project=="designer"%} you and{%endif%} your {{site.customer}} when {%if site="cloud"%}creating or{%endif%} editing a site.
{% include image.html file="cl_theme_gallery.png" caption="The Weebly Theme Gallery"%}<br>

## Have Questions?

If you have any questions while you're building an app or customizing a theme, or suggestions for how we can improve the APIs, the Cloud Admin, or the documentation, use the **Submit Ticket** link in the Cloud Admin. Once submitted, a ticket is sent to the Cloud support team.
{% if site.project=="cloud" %}
{% include image.html file="cl_adminPortal_support.png" caption="Submit a Ticket from the Cloud Admin"%}
{% elsif site.project=="designer" %}
{% include image.html file="ds_cloudAdminSupport.png" caption="Submit a Ticket from the Cloud Admin"%}
{% endif %}
