{% if site.project=="cloud" or "designer" %}
Sites are associated with a particular user and plans. Plans determine the level of functionality available to a site. For example, higher-level plans allow eCommerce functionality.
Every site has a unique domain. Each also has login credentials for users that have access to the site to edit and manage it.

Sites can be published, and you can also suspend and restore sites, as well as disable and enable them.
{% elsif site==platform %}
Every web site is given a title. It normally displays at the top of pages, however the site owner can choose to not display it, or display a logo in its place.
{% include image.html file="pf_api_siteTitle.png" caption="The Title can be either a text title or a logo." %}
​
Sites are associated with a Weebly plan that determines the level of functionality available to the site. For example, only sites on the Performance plan can use the Real Time Shipping feature.
​
The Sites API returns information about Weebly sites owned by the currently authenticated user. You can use the API to update a site's title.

{% endif %}

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, those that are required for `PUT` and `POST`, and those that are changeable using `PATCH` and `PUT`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
        <td><strong>Rqd for POST</strong></td>
        <td><strong>Rqd for PATCH</strong></td>
        <td><strong>Changeable</strong></td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>domain</code></td>
        <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>site_title</code></td>
        <td>Title given to a site.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>brand_name</code></td>
        <td>Your {% if site.project=="designer" %}<a href="ds_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% endif %}, as set in the Cloud Admin. If not set on the site level, the <code>brand_name</code> set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>brand_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_configure.html#email-url">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#email-url">URL</a>{% endif %} to your website, as set in the Cloud Admin. The link in the footer of a published site will go to this site. If not set on the site level, the brand_url set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
   {% if site.project=="cloud" %}
    <tr>
        <td><code>upgrade_url</code></td>
        <td>Full url to your upgrade manager. When a user is editing a site they may be prompted to upgrade their account to take advantage of more features. This url will be loaded into a popup window to prompt the user to upgrade their account. This upgrade url will be used on all sites in the Weebly Cloud account. If not set on the site level, the upgrade_url set at the account level will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
  {% endif %}
    <tr>
        <td><code>publish_upsell_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_market.html">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">URL</a>{% endif %} you set to display in the Publish Modal. This url will be loaded in an iframe (640px W by 200px H) upon site publish and can be used to advertise other services. If not set on the site level, the <code>publish_upsell_url</code> {% if site.project=="designer" %}<a href="ds_gs_market.html">set</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">set</a>{% endif %} in the Cloud Admin will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>publish_host</code></td>
        <td>The hostname of the remote host that hosts the published site.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>publish_username</code></td>
        <td>The username used to authenticate to the publish_host.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>publish_password</code></td>
        <td>The password used to authenticate to the publish_host.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>publish_path</code></td>
        <td>The absolute path of the remote host that hosts published site.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>platform</code></td>
        <td></td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>plan_id</code></td>
        <td>Unique ID for the {% if site.project=="designer" %}<a href="ds_api_plan.html">plan</a>{% elsif site.project=="cloud" %}<a href="cl_api_plan.html">plan</a>{% endif %} for this site.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>term</code></td>
        <td>Amount of time, in months, that the {% if site.project=="designer" %}<a href="ds_api_plan.html">plan</a>{% elsif site.project=="cloud" %}<a href="cl_api_plan.html">plan</a>{% endif %} is good for.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>allow_ssl</code></td>
        <td>Whether or not the SSL option has been enabled for this site.
            Any site use SSL. However, that option does not display in the General Settings area of the Editor unless <code>allow_ssl</code> is set to <code>true</code>. By default, this field is set to <code>false</code>.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>publish_state</code></td>
        <td>The current state of the site.<br> Valid values are:
            <ul>
                <li><code>not published</code></li>
                <li><code>published</code></li>
            </ul>
        </td>
        <td>string</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>suspended</code></td>
        <td>Whether or not a site is suspended. Set to true when the site is suspended (disabled). When a site is suspended, the site cannot be accessed from the editor. Set to false when the site is unsuspended (enabled).<br>Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>time_zone</code></td>
        <td>Timezone used on the site. Valid values can be found <a href="http://cloud-developer.weebly.com/uploads/3/0/3/1/30316827/timezones.json">here</a>.
        </td>
        <td>string</td>
        <td>X</td>
        <td><br>
        </td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>time_format</code></td>
        <td>Format used for time on the site. Values are <code>12</code> and <code>24</code>.
        </td>
        <td>string</td>
        <td>X</td>
        <td><br>
        </td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>date_format</code></td>
        <td>Format used for dates on the site. Values are <code>n/j/Y</code> for month/day/year and <code>j/n/Y</code> for day/month/year.
        </td>
        <td>string</td>
        <td>X</td>
        <td><br>
        </td>
        <td></td>
        <td>X</td>
    </tr>
     <tr>
        <td><code>access</code></td>
        <td>The type of access the given user has on this site.<br> Valid values are:
            <ul>
                <li><code>owner</code>: The user is the owner and has full access.</li>
                <li><code>admin</code>: The user has the same access as an owner but is not the owner</li>
                <li><code>limited</code>: The user can access only what has been explicitly assigned.</li>
                    </ul>
            Admin and limited access means the user is a site contributor.
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
         <td></td>
    </tr>

    <tr>
        <td><code>assigned_ip</code></td>
        <td>IP address of the site.</td>
        <td>string</td>
        <td></td>
        <td><br>
        </td>
        <td><br>
        </td>
        <td></td>
    </tr>

    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Sites
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites

{% else %}
GET /user/USER_ID/site/
{% endif %}
{% endhighlight %}

Returns all sites for the given user. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

<h3>Query Parameters</h3>
Returned values are {% if site.project=="designer" %}[paginated](ds_api_about.html#pagination){%elsif site.project=="cloud" %}[paginated](cl_api_about.html#pagination.html){%elsif site.project=="platform" %}[paginated](pf_api_about.html#pagination.html){%endif%}. You can further filter results using these parameters:

<table>
    <tr>
        <td><strong>Parameter</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
    <tr>
        <td><code>page</code></td>
        <td>Which page of results to return. Start is <code>1</code>.
            {%include note.html content="Only the first 25 results are returned by default. If the result set is
            expected to be over 25, you must implement pagination." %}
        </td>
        <td>integer</td>
    </tr>

    <tr>
        <td><code>limit</code></td>
        <td>Number of results per page to return. Default is <code>25</code>. <br>Max is <code>200</code>.</td>
        <td>integer</td>
    </tr>

    <tr>
        <td><code>filterby</code></td>
        <td>Field name to set a filter on. Valid value is <code>role</code>.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​Value to search the filterby field for. <br>
            Valid values are:
            <ul>
                <li><code>owner</code>: Return only sites that the user owns.</li>
                <li><code>contributor</code>: Return only sites that the user is a {% if site.project=="designer" %}<a href="ds_gs_access_sites.html">contributor</a>{% elsif site.project=="cloud" %}<a href="cl_gs_access_sites.html">contributor</a>{% endif %} to</li>
                <li><code>null</code>: Return all sites the user owns and is a contributor to.</li>
            </ul>
        </td>
        <td>string</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request returning all sites:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/objects \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/pages?filterby=layout&filterfor=tall-header \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site?roll=owner \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "sites": [
        {
            "site_id":"1234567890",
            "domain": "www.website.com",
            "site_title": "My Great Site",
            "brand_name": "Not the default Brand",
            "brand_url": "http://www.notyourdefaultbrand.com/",
            "upgrade_url": null,
            "publish_upsell_url": null,
            "allow_ssl": false,
            "publish_state": "not published",
            "suspended": true,
            "time_zone": "America/Los_Angeles",
            "time_format": "12",
            "date_format": "n/j/Y",
            "access": "owner"
        },
        {
            "site_id":"1234567890",
            "domain": "www.anotherwebsite.com",
            "site_title": "Another Site",
            "brand_name": null,
            "brand_url": null,
            "upgrade_url": null,
            "publish_upsell_url": null,
            "allow_ssl": false,
            "publish_state": "not published",
            "suspended": true,
            "time_zone": "America/Los_Angeles",
            "time_format": "12",
            "date_format": "n/j/Y",
            "access": "limited"
        }
    ]
}
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Site
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/

{% else %}
GET /user/USER_ID/site/{SITE_ID}/
{% endif %}
{% endhighlight %}

Returns all fields for the given site.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/sites/1234567890 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}


<p class="codeTitle">Example response:</p>

{% highlight json %}
{
    "site": {
        "site_id": "987654321",
        "domain": "mysite.designer.com",
        "site_title": "Mill Clothing",
        "brand_name": null,
        "brand_url": null,
        "upgrade_url": null,
        "publish_upsell_url": null,
        "allow_ssl": false,
        "publish_state": "published",
        "suspended": false,
        "time_zone": "America\/Los_Angeles",
        "time_format": "12",
        "date_format": "n\/j\/Y"
    }
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create or Copy a Site</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/

{% else %}
POST /user/USER_ID/site
{% endif %}
{% endhighlight %}

Creates a site for the given user. The domain must be unique. If non-required fields are not provided, values set in the Cloud Admin are used.
{% if site.project == "platform" %}
<br>
**scope:** `write:site`
{% endif %}


These fields can be created:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>domain</code></td>
        <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>site_title</code></td>
        <td>Title given to a site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>brand_name</code></td>
        <td>Your {% if site.project=="designer" %}<a href="ds_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% endif %}, as set in the Cloud Admin. If not set on the site level, the <code>brand_name</code> set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>brand_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_configure.html#email-url">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#email-url">URL</a>{% endif %} to your website, as set in the Cloud Admin. The link in the footer of a published site will go to this site. If not set on the site level, the brand_url set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td></td>
    </tr>
    {% if site.project=="cloud" %}
    <tr>
        <td><code>upgrade_url</code></td>
        <td>Full url to your upgrade manager. When a user is editing a site they may be prompted to upgrade their account to take advantage of more features. This url will be loaded into a popup window to prompt the user to upgrade their account. This upgrade url will be used on all sites in the Weebly Cloud account. If not set on the site level, the upgrade_url set at the account level will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td></td>
    </tr>
    {% endif %}
    <tr>
        <td><code>publish_upsell_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_market.html">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">URL</a>{% endif %} you set to display in the Publish Modal. This url will be loaded in an iframe (640px W by 200px H) upon site publish and can be used to advertise other services. If not set on the site level, the <code>publish_upsell_url</code> {% if site.project=="designer" %}<a href="ds_gs_market.html">set</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">set</a>{% endif %} in the Cloud Admin will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_host</code></td>
        <td>The hostname of the remote host that hosts the published site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_username</code></td>
        <td>The username used to authenticate to the publish_host.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_password</code></td>
        <td>The password used to authenticate to the publish_host.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_path</code></td>
        <td>The absolute path of the remote host that hosts published site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>platform</code></td>
        <td></td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>plan_id</code></td>
        <td>Unique ID for the {% if site.project=="designer" %}<a href="ds_api_plan.html">plan</a>{% elsif site.project=="cloud" %}<a href="cl_api_plan.html">plan</a>{% endif %} for this site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>term</code></td>
        <td>Amount of time, in months, that the {% if site.project=="designer" %}<a href="ds_api_plan.html">plan</a>{% elsif site.project=="cloud" %}<a href="cl_api_plan.html">plan</a>{% endif %} is good for.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>time_zone</code></td>
        <td>Timezone used on the site. Valid values can be found <a href="http://cloud-developer.weebly.com/uploads/3/0/3/1/30316827/timezones.json">here</a>.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>time_format</code></td>
        <td>Format used for time on the site. Values are <code>12</code> and <code>24</code>.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>date_format</code></td>
        <td>Format used for dates on the site. Values are <code>n/j/Y</code> for month/day/year and <code>j/n/Y</code> for day/month/year.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>copy_source</code></td>
        <td>The <code>user_id</code> and <code>site_id</code> to be used as the source when creating a new site by copying an existing site.
        </td>
        <td>JSON object</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/ \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
"title": "My Title"
}'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/page \
-X POST \
-d '{
        "domain": "test1234567890.com",
        "site_title": "My Amazing Website"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

{% if site.project=="cloud" or "platform" %}
<p class="codeTitle">Example Request to Copy an Existing Site:</p>
{% highlight shell %}
curl https://api.weeblycloud.com/user/USER_ID/site \
-X POST \
-d '{
        "domain": "test1234567890.com",
        "site_title": "My Amazing Website",
        "copy_source": {
            "site_id": "123456789",
            "user_id": "987654321"
        }
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}
{% endif %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "site": {
        "site_id": "987654321",
        "domain": "test1234567890.com",
        "site_title": "My Amazing Website",
        "brand_name": null,
        "brand_url": null,
        "upgrade_url": null,
        "publish_upsell_url": null,
        "allow_ssl": false,
        "publish_state": "not published",
        "suspended": false,
        "time_zone": "America\/Los_Angeles",
        "time_format": "12",
        "date_format": "n\/j\/Y",
        "assigned_ip": "192.0.2.0"
    }
}
{% endhighlight %}

<h2>{% include label.html content="put" %} Replace a Site</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PUT /v1/user/sites/{SITE_ID}

{% else %}
PUT /user/USER_ID/site/{SITE_ID}
{% endif %}
{% endhighlight %}

Replaces the entire given site.
{% if site.project == "platform" %}
<br>
**scope:** `write:site`
{% endif %}

These fields can be replaced:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>domain</code></td>
        <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
        <td>string</td>
        <td>Required. Must be unique.</td>
    </tr>
    <tr>
        <td><code>site_title</code></td>
        <td>Title given to a site.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>brand_name</code></td>
        <td>Your {% if site.project=="designer" %}<a href="ds_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% endif %}, as set in the Cloud Admin. If not set on the site level, the <code>brand_name</code> set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>brand_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_configure.html#email-url">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#email-url">URL</a>{% endif %} to your website, as set in the Cloud Admin. The link in the footer of a published site will go to this site. If not set on the site level, the brand_url set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    {% if site.project=="cloud" %}
    <tr>
        <td><code>upgrade_url</code></td>
        <td>Full url to your upgrade manager. When a user is editing a site they may be prompted to upgrade their account to take advantage of more features. This url will be loaded into a popup window to prompt the user to upgrade their account. This upgrade url will be used on all sites in the Weebly Cloud account. If not set on the site level, the upgrade_url set at the account level will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    {% endif %}
    <tr>
        <td><code>publish_upsell_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_market.html">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">URL</a>{% endif %} you set to display in the Publish Modal. This url will be loaded in an iframe (640px W by 200px H) upon site publish and can be used to advertise other services. If not set on the site level, the <code>publish_upsell_url</code> {% if site.project=="designer" %}<a href="ds_gs_market.html">set</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">set</a>{% endif %} in the Cloud Admin will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>time_zone</code></td>
        <td>Timezone used on the site. Valid values can be found <a href="http://cloud-developer.weebly.com/uploads/3/0/3/1/30316827/timezones.json">here</a>.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>time_format</code></td>
        <td>Format used for time on the site. Values are <code>12</code> and <code>24</code>.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>date_format</code></td>
        <td>Format used for dates on the site. Values are <code>n/j/Y</code> for month/day/year and <code>j/n/Y</code> for day/month/year.
        </td>
        <td>string</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PUT \
--url https://api.weebly.com/v1/user/sites/987654321 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
"title": "New Title"
}'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321 \
-X PUT \
-d '{
        "domain": "www.test-site.com",
        "site_title": "Sample Site",
        "brand_name": "Test Brand",
        "brand_url": "http:\/\/www.brand.com\/",
        "upgrade_url": null,
        "publish_upsell_url": "http:\/\/www.brand.com\/upsell.html",
        "allow_ssl": false
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "site": {
        "site_id": "987654321",
        "domain": "www.test-site.com",
        "site_title": "Sample Site",
        "brand_name": "Test Brand",
        "brand_url": "http://www.brand.com/",
        "upgrade_url": null,
        "publish_upsell_url": "http://www.brand.com/upsell.html",
        "allow_ssl": false,
        "publish_state": "not published",
        "suspended": false,
        "time_zone": "America/Los_Angeles",
        "time_format": "12",
        "date_format": "n/j/Y"
    }
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Site</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}
{% endif %}
{% endhighlight %}

Updates the given site. The domain must be unique.
{% if site.project == "platform" %}
<br>
**scope:** `write:site`
{% endif %}


These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>domain</code></td>
        <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
        <td>string</td>
        <td>Must be unique</td>
    </tr>
    <tr>
        <td><code>site_title</code></td>
        <td>Title given to a site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>brand_name</code></td>
        <td>Your {% if site.project=="designer" %}<a href="ds_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#brand-your-sites-and-the-cloud-admin">brand name</a>{% endif %}, as set in the Cloud Admin. If not set on the site level, the <code>brand_name</code> set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>brand_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_configure.html#email-url">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_configure.html#email-url">URL</a>{% endif %} to your website, as set in the Cloud Admin. The link in the footer of a published site will go to this site. If not set on the site level, the brand_url set in the Cloud Admin is used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td></td>
    </tr>
    {% if site.project=="cloud" %}
    <tr>
        <td><code>upgrade_url</code></td>
        <td>Full url to your upgrade manager. When a user is editing a site they may be prompted to upgrade their account to take advantage of more features. This url will be loaded into a popup window to prompt the user to upgrade their account. This upgrade url will be used on all sites in the Weebly Cloud account. If not set on the site level, the upgrade_url set at the account level will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td></td>
    </tr>
    {% endif %}
    <tr>
        <td><code>publish_upsell_url</code></td>
        <td>Full {% if site.project=="designer" %}<a href="ds_gs_market.html">URL</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">URL</a>{% endif %} you set to display in the Publish Modal. This url will be loaded in an iframe (640px W by 200px H) upon site publish and can be used to advertise other services. If not set on the site level, the <code>publish_upsell_url</code> {% if site.project=="designer" %}<a href="ds_gs_market.html">set</a>{% elsif site.project=="cloud" %}<a href="cl_gs_market.html">set</a>{% endif %} in the Cloud Admin will be used. Passing a <code>NULL</code> value will ensure the site uses the value defined in the Cloud Admin.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_host</code></td>
        <td>The hostname of the remote host that hosts the published site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_username</code></td>
        <td>The username used to authenticate to the publish_host.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_password</code></td>
        <td>The password used to authenticate to the publish_host.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>publish_path</code></td>
        <td>The absolute path of the remote host that hosts published site.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>platform</code></td>
        <td></td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>allow_ssl</code></td>
        <td>Whether or not the SSL option has been enabled for this site.
            Any site use SSL. However, that option does not display in the General Settings area of the Editor unless <code>allow_ssl</code> is set to <code>true</code>. By default, this field is set to <code>false</code>.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td></td>
    </tr>
    <tr>
        <td><code>time_zone</code></td>
        <td>Timezone used on the site. Valid values can be found <a href="http://cloud-developer.weebly.com/uploads/3/0/3/1/30316827/timezones.json">here</a>.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>time_format</code></td>
        <td>Format used for time on the site. Values are <code>12</code> and <code>24</code>.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>date_format</code></td>
        <td>Format used for dates on the site. Values are <code>n/j/Y</code> for month/day/year and <code>j/n/Y</code> for day/month/year.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>allow_ssl</code></td>
        <td>Whether or not the SSL option has been enabled for this site.
            Any site use SSL. However, that option does not display in the General Settings area of the Editor unless <code>allow_ssl</code> is set to <code>true</code>. By default, this field is set to <code>false</code>.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
</table>

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
curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID \
-X PATCH \
-d '{
        "domain": "www.test-site-secured.com",
        "site_title": "Sample SSL Site",
        "allow_ssl": true
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "site": {
        "site_id": "987654321",
        "domain": "www.test-site-secured.comm",
        "site_title": "Sample SSL Site",
        "brand_name": null,
        "brand_url": null,
        "upgrade_url": null,
        "publish_upsell_url": null,
        "allow_ssl": false,
        "publish_state": "published",
        "suspended": false,
        "time_zone": "America\/Los_Angeles",
        "time_format": "12",
        "date_format": "n\/j\/Y"
    }
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Publish a Site</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/publish
{% endhighlight %}

Publishes the given site.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/123456/site/987654321/publish \
-X POST \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Unpublish a Site</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/unpublish
{% endhighlight %}

Unpublishes the given site.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/123456/site/987654321/unpublish \
-X POST \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Generate a Login Link</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/loginLink
{% endhighlight %}

Generates a one-time link that will direct users to the site specified. This method requires that the account is enabled.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/123456/site/987654321/loginLink \
-X POST \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "link": "http://www.weebly.com/editor/login.php?t=55ac062cfdba5a7c7ae5fe8c228d1635&redirect=toSite.php%3Fsite=895826994839270359"
}
{% endhighlight %}

{% if site.project=="cloud" %}
{% include label.html content="post" %} Set Publish Credentials</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/setPublishCredentials
{% endhighlight %}

Sets publish credentials for a given site. If a user's site will not be hosted by Weebly, publish credentials can be provided.  When these values are set, the site will be published to the location specified.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID/setPublishCredentials \
-X POST \
-d '{
    "publish_host": "ftp.myhost.com",
    "publish_username": "ftpuser",
    "publish_password": "password1234",
    "publish_path": "\/home\/ftpuser\/html\/"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}
{% endif %}

{% include label.html content="post" %} Restore a Site</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/restore
{% endhighlight %}

When a site is restored the owner of the site is granted access to it in the exact state it was when it was deleted, including the Weebly plan assigned. Restoring a site does not issue an automatic publish.

These fields can be posted:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>domain</code></td>
        <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
        <td>string</td>
        <td>Required. Must be unique</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/USER_ID/site/987654321/restore \
-X POST \
-d '{
        "domain": "www.test-site.com"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Disable a Site</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/disable
{% endhighlight %}

Suspends access to the given user's site in the editor by setting the suspended parameter to `true`. If a user attempts to access the site in the editor, an error is thrown.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/123456/site/987654321/disable \
-X POST \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Enable a Site</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/enable
{% endhighlight %}

Re-enables a suspended site by setting the suspended parameter to `false`. Users can access the editor for the site. Sites are enabled by default when created.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/123456/site/987654321/enable \
-X POST \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}

<h2>{% include label.html content="delete" %} Delete a Site</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}
{% endif %}
{% endhighlight %}

Deletes the given site.
{% if site.project == "platform" %}
<br>
**scope:** `write:site`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/pages/1234567890 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.
