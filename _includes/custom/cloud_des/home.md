{% if site.project=="cloud"%}
## What is Weebly Cloud?

Weebly for Cloud provides your customers a best-in-class website builder to enable them to create their own website, blog or online store in minutes. You maintain full control over billing, support, and the customer relationship. The Weebly Cloud platform allows you to easily integrate Weebly into your existing internal application, CMS or third party web application. You can use our <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to manage users and sites or you can use our RESTful API to programmatically integrate with existing systems. You can also use plug-ins that allow you to integrate Weebly with existing systems.

{% elsif site.project=="designer"%}
## What is Weebly Cloud for Designers?

Weebly is a best-in-class website builder that allows you to create websites, blogs and online stores for your clients in minutes. You maintain full control over billing, support, and the customer relationship. You can use our <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to manage users and sites and you can use our RESTful API to create custom apps to further your clients' sites functionality.

{% endif %}

## Create a Weebly Cloud Account

The first step in using the Weebly Cloud API is to create a Weebly Cloud account. This account gives you access to Cloud Admin where you can access your API key and secret, and download plug-ins. If you don't have a Weebly Cloud account, then email our team [here](mailto:bd@weebly.com).

Once your account is set up, head on over to Configure Weebly Cloud to finish setting up your account.

## Test Mode

When first getting acquainted with the Weebly Cloud API your Weebly Cloud account will be in <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.test_mode}}">test mode</a>. There are no functional limitations while in test mode, it simply defaults any users and sites created to test so that you won't be charged for them. They will be periodically removed from the system, but only after your Weebly Cloud account is in production mode.

Once in production mode you can still create a test user by passing the optional parameter of **test_mode**. Learn more about the [User API](cl_api_user).

## Decide Where to Host the Weebly Sites

As a Weebly Cloud partner, you can either host the published sites on Weebly's infrastructure or on your own. When hosted at Weebly, all files live on the Weebly server. When you choose to host, all requests are made to your server and all static files reside on your server. But some requests require a call to a Weebly endpoint to return certain dynamic content.

In both hosting cases, the Weebly Editor (where your site owners create their sites) is hosted on Weebly. More info about hosting options can be found here.

## Use the Weebly Editor

Your customers use the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.page_editor}}">Weebly editor</a> to design their websites. It's as easy as dragging <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.element}}">elements</a> from the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.element_tray}}">element tray</a> and dropping them onto a page.
{% include image.html file="cl_editorBranded.png" caption="The Weebly Editor" %}
