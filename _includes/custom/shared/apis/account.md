{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, those that are required for `PUT`, and those that are changeable using `PATCH`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
        <td><strong>Required</strong></td>
        <td><strong>Changeable</strong></td>
    </tr>
    <tr>
        <td><code>brand_name</code><br>
        </td>
        <td>Your {% if site.project=="designer" %}<a href="ds_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand</a> {%elsif site.project=="cloud" %}<a href="ds_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand</a> {%endif%} name. Displays in the footer of any free sites.
            You may override this setting at the site level.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    {% if site.project=="cloud" %}
    <tr>
        <td><code>brand_url</code></td>
        <td>Full url to your website. The link in the {% if site.project=="designer" %}[footer](ds_page.html){%elsif site.project=="cloud" %}[footer](cl_page.html){%endif%} of a
            published site will go to this site. You may override this setting at
            the site level. (ex: "http://www.mybrand.com/")</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>

    <tr>
        <td><code>upgrade_url</code></td>
        <td>Full url to your <a href="cl_gs_upgrade.html"> upgrade management page</a>. When a user is editing a
            site they may be prompted to upgrade their account to take advantage of
            more features. This url will be loaded into a popup window to prompt
            the user to upgrade their account. This upgrade url will be used on all
            sites in the Weebly Cloud account. You may override this setting at the
            site level (See the Site API<!--todo: cloud link--> for the <code>setUpgradeUrl</code> method description).
            (ex: "http://www.mybrand.com/upgrade.php")</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    {%endif%}
    <tr>
        <td><code>publish_upsell_url</code></td>
        <td>Full url to your {% if site.project=="designer" %}<a href="ds_gs_market.html">publish</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">publish</a>{% endif %} promotion page. This url will be loaded
            in an iframe (640px W by 200px H) upon site publish and can be used to
            advertise other services. You may override this setting at the site
            level (using this Site API <!--todo: api link--> call).
        </td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    {% if site.project=="cloud" %}
    <tr>
        <td><code>billing_url<br>
        </code></td>
        <td>This url is only used with the cPanel plugin<!--todo: cloud link-->. The user
            is directed to this url while trying to provision a new Weebly site
            through cPanel.
        </td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    {% endif %}
    </tbody>
</table>
{% include note.html content = "Any fields returned that are not documented are currently unsupported and can be safely ignored."%}

<h2><span class="label label-get text-uppercase">get</span> Retrieve Account Details</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /account

{% else %}
GET /account
{% endif %}
{% endhighlight %}

<p>Returns details for the account authorized in this API call
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>read:site</code>
    {% endif %}


<p class="codeTitle">Example CURL request returning details:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/objects \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/account \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{% if site.project=="designer" %}
{
"account": {
    "brand_name": "My Brand",
    "publish_upsell_url": "http:\/\/www.mybrand.com\/upsell.html"
    }
}
{% elsif site.project=="cloud" %}
{
    "account": {
    "brand_name": "My Brand",
    "brand_url": "http:\/\/www.mybrand.com\/",
    "publish_upsell_url": "http:\/\/www.mybrand.com\/upsell.html",
    "upgrade_url": "http:\/\/www.mybrand.com\/upgrade.html",
    "billing_url": "http:\/\/www.mybrand.com\/whmcs.php"
    }
}
{% endif %}
{% endhighlight %}

<h2><span class="label label-put text-uppercase">put</span> Update the Given Fields for an Account</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/pages/{PAGE_ID}

{% else %}
PUT /account
{% endif %}
{% endhighlight %}

<p>Updates the given account. All fields are required.
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>write:site</code>
    {% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/pages/1234567890 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
"title": "New Title"
}'

{% elsif site.project=="designer" %}
curl https://api.weeblycloud.com/account \
-X PUT \
-d '{
        "brand_name": "My New Brand",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
}' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% elsif site.project=="cloud" %}
curl https://api.weeblycloud.com/account \
-X PUT \
-d '{
        "brand_name": "My New Brand",
        "brand_url": "http:\/\/www.mynewbrand.com\/",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
        "upgrade_url": "http:\/\/www.mynewbrand.com\/upgrade.html",
        "billing_url": "http:\/\/www.mynewbrand.com\/whmcs.php"
}' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the account are returned.</p>
{% highlight json %}
{% if site.project=="designer" %}
{
    "account": {
        "brand_name": "My Brand",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
    }
}
{% elsif site.project=="cloud" %}
{
    "account": {
        "brand_name": "My Brand",
        "brand_url": "http:\/\/www.mybrand.com\/",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
        "upgrade_url": "http:\/\/www.mynewbrand.com\/upgrade.html",
        "billing_url": "http:\/\/www.mynewbrand.com\/whmcs.php"
    }
}
{% endif %}
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">patch</span> Update an Account</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/pages/{PAGE_ID}

{% else %}
PATCH /account
{% endif %}
{% endhighlight %}

<p>Updates the given account. All fields are updateable.
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>write:site</code>
    {% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/pages/1234567890 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
"title": "New Title"
}'

{% else %}
curl https://api.weeblycloud.com/account \
-X PATCH \
-d '{
        "brand_name": "My Brand",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the account are returned.</p>
{% highlight json %}
{% if site.project=="designer" %}
{
    "account": {
        "brand_name": "My Brand",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
    }
}
{% elsif site.project=="cloud" %}
{
    "account": {
        "brand_name": "My Brand",
        "brand_url": "http:\/\/www.mybrand.com\/",
        "publish_upsell_url": "http:\/\/www.mynewbrand.com\/upsell.html",
        "upgrade_url": "http:\/\/www.mynewbrand.com\/upgrade.html",
        "billing_url": "http:\/\/www.mynewbrand.com\/whmcs.php"
    }
}
{% endif %}
{% endhighlight %}

