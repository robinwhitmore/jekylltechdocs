Sites are made up of [pages](https://hc.weebly.com/hc/en-us/articles/201994638-Manage-Pages) that can be rearranged as needed. Each page has a title and a [layout](https://hc.weebly.com/hc/en-us/articles/227027928-Adding-Sections-to-Your-Pages). Site owners can hide pages and can also make pages restricted to {% if site.project=="designer" %}[members](ds_api_member.html){%elsif site.project=="cloud" %}[members](cl_api_member.html){%elsif site.project=="platform" %}[members](pf_api_member.html){%endif%} of the site.

The Pages API provides methods for reading and updating information about the pages for a site.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list and those that are changeable using `PATCH`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Type</th>
        <th>List</th>
        <th>Changeable</th>
    </tr>
    <tr>
        <td>​<code>page_id</code></td>
        <td>The unique ID of a page</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>title</code></td>
        <td>The title of a given page ​</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>page_order</code></td>
        <td>
            Where this page appears in its of pages, as configured on the Pages tab of the editor. For example: ​
            <pre>
Home - page_order 1
    HomeSubPage - page_order 1
    HomeSubPage - page_order 2
About - page_order 2
    AboutSubPage - page_order 1
Contact - page_order 3
    ContactSubPage - page_order 1
        </pre>You can determine the hierarchy using the parent_id for the page.
        </td>
        <td>integer</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>hidden</code></td>
        <td>
            Whether or not the page is hidden from the site's navigation.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>membership_required</code></td>
        <td>
            Whether or not the page requires site {% if site.project=="designer" %}<a href="ds_api_member.html">membership</a>{% elsif site.project=="cloud" %}<a href="cl_api_member.html">membership</a>{% elsif site.project=="platform" %}<a href="pf_api_member.html">membership</a>{% endif %} in order to be viewed.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>parent_id</code></td>
        <td>The <code>page_id</code> of the page one level up in the navigation hierarchy. If there is no parent, nothing is returned.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>layout</code></td>
        <td>
            The layout header used for the page.<br>
            Valid values are:
            <ul>
                <li><code>short-header</code></li>
                <li><code>tall-header</code></li>
                <li><code>no-header</code></li>
            </ul>
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>page_url</code></td>
        <td>
            Relative URL for the page. You can get the domain from {% if site.project=="designer" %}<a href="ds_api_site.html"><code>GET /user/sites/SITEID</code></a>{% elsif site.project=="cloud" %}<a href="cl_api_site.html"><code>GET /user/sites/SITEID</code></a>{% elsif site.project=="platform" %}<a href="pf_api_site.html"><code>GET /user/sites/SITEID</code></a>{% endif %}
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the page was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Pages
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/pages

{% else %}
GET /user/USER_ID/site/{SITE_ID}/page
{% endif %}
{% endhighlight %}

Returns all pages for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

<h3>Query Parameters</h3>
Returned values are {% if site.project=="designer" %}[paginated](ds_api_about.html#pagination){%elsif site.project=="cloud" %}[paginated](cl_api_about.html#pagination.html){%elsif site.project=="platform" %}[paginated](pf_api_about.html#pagination.html){%endif%}. You can further filter results using these parameters:

<table>
    <tr>
        <th>Parameter</th>
        <th>Description</th>
        <th>Type</th>
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
        <td><code>query</code></td>
        <td>Use to retrieve only pages that have a full-text match with the query string.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterby</code></td>
        <td>Field name to set a filter on. Valid values are:
            <ul>
                <li><code>page_id</code></li>
                <li><code>title</code></li>
                <li><code>layout</code></li>
            </ul>
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​Value to search the filterby field for.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>sortby</code></td>
        <td>Field name to sort by</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>sortdir</code></td>
        <td>Sort direction. Valid values are:
            <ul>
                <li><code>asc</code></li>
                <li><code>desc</code></li>
            </ul>
        </td>
        <td>string</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request returning all pages:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/pages \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/page \
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
curl https://api.weeblycloud.com/user/123456/site/987654321/page?filterby=layout&filterfor=tall-header \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
    {
        "page_id": "131221993403487092",
        "title": "new",
        "page_order": 2,
        "parent_id": "205694454183612584",
        "layout": "tall-header",
        "page_url": "new.html"
    },
    {
        "page_id": "205694454183612584",
        "title": "Blog",
        "page_order": 2,
        "parent_id": null,
        "layout": "tall-header",
        "page_url": "blog1.html"
    },
    {
        "page_id": "267240304658043510",
        "title": "members only",
        "page_order": 4,
        "parent_id": null,
        "layout": "tall-header",
        "page_url": "members-only.html"
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Page
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/pages/{PAGE_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/page/{PAGE_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given page.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/pages/131221993403487092 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/page/131221993403487092 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the page are returned.</p>
{% highlight json %}
{
    "page_id": "131221993403487092",
    "title": "new",
    "hidden": false,
    "membership_required": null,
    "parent_id": "205694454183612584",
    "layout": "tall-header",
    "updated_date": "2014-11-06 15:57:56",
    "page_url": "new.html"
}
{% endhighlight %}


<h2>{% include label.html content="patch" %} Update a Page</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/pages/{PAGE_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/page/{PAGE_ID}
{% endif %}
{% endhighlight %}

Updates the given page.
{% if site.project == "platform" %}
<br>
**scope:** `write:site`
{% endif %}


These fields can be updated:

<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Type</th>
        <th>Notes</th>
    </tr>
    <tr>
        <td><code>title</code></td>
        <td>The page's title.</td>
        <td>string</td>
        <td>Required</td>
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
curl https://api.weeblycloud.com/user/987654321/site/123456/page/1234567890 \
-X PATCH \
-d '{
        "title": "New Title"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the page are returned.
{% highlight json %}
{
    "page_id": "1234567890",
    "title": "New Title",
    "hidden": false,
    "membership_required": null,
    "parent_id": null,
    "layout": "short-header",
    "updated_date": "2016-02-08 11:16:19",
    "page_url": "new.html"
}
{% endhighlight %}
