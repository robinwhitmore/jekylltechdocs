---
title: Allow Sites to Use SSL
keywords: ssl, sites
t_type: [task]
tags: [configuration, sites]
sidebar: ds_gs_sidebar
permalink: ds_gs_ssl.html
summary: Weebly sites can use SSL, as long as they are on the Weebly Business plan. However, you'll need to use the Weebly Cloud API to enable the SSL option to display in the Site's settings so that the site owner can enable it.
---
Sites built on the Weebly Business plan can optionally use SSL outside of the checkout flow (pages in the checkout flow always use `HTTPS`). Site owners can turn this setting on and off in the General settings section of the editor. They can use SSL only for the checkout flow or for the entire site.
{% include image.html file="cl_ssl.png" caption="SSL setting in the Weebly Editor" %}

{% include note.html content="If the site contains a store, the checkout flow always uses HTTPs, regardless of how SSL is configured for the site. If the SSL option is not selected for the site or for checkout, the URL for the checkout flow is `checkout.weebly.com`. If the SSL option is selected, the site's own domain is used." %}
However, by default the SSL option does not display on the General settings page. You need to make a call to the [Site](ds_api_site.html) API and update a site's record to enable the SSL option. You use the `PATCH` endpoint and set `allow_ssl` to `true`.
​Here's an example:
<p class="codeTitle">Enable the SSL Option in the Editor:</p>

{% highlight shell %}
curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID \
-X PATCH \
-d '{
"allow_ssl": true
}' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

More info on using the Site API [here](ds_api_site.html).
