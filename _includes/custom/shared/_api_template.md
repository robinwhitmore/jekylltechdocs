{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
## Fields

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, and those that are changeable using `PATCH`. All fields are returned when you retrieve a single item.
<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
        <td><strong>Changeable</strong></td>
    </tr>
    <tr>
        <td>​<code>user_id</code></td>
        <td>The unique ID of the authenticated user</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>description</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>description</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>description</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>description</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>

</table>
{% include note.html content = "Any fields returned that are not documented are currently unsupported and can be safely ignored."%}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of <span style ="color:red">Object</span>s for a Given Site</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/

{% else %}
GET /user/USER_ID/site/{SITE_ID}/
{% endif %}
{% endhighlight %}

<p>Returns all <span style="color:red">object</span>s for the given site. Only list fields are returned.
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>read:site</code>
    {% endif %}

### Query Paramters
Returned values are paginated. You can further filter results using these parameters:
<table>
    <tr>
        <td><strong>Parameter</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
    <tr>
        <td><code>page</code></td>
        <td>Which page of results to return. Start is <code>1</code>.
            {%include note.html content="Only the first 25 results are returned by default. If the result set is expected to be over 25, you must implement pagination." %}
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
        <td>Field name to set a filter on. Valid values are:<ul>
            <li style="color:red">_id</li>
        </ul>
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><div class="paragraph"><strong>filterfor</strong></div></td>
        <td><div class="paragraph">​Value to search the filterby field for. </div></td>
        <td><div class="paragraph">string</div></td>
    </tr>
    <tr>
        <td><div class="paragraph"><strong>sortby</strong></div></td>
        <td><div class="paragraph">Field name to sort by</div></td>
        <td><div class="paragraph">string</div></td>
    </tr>
    <tr>
        <td><div class="paragraph"><strong>sortdir</strong></div></td>
        <td><div class="paragraph">Sort direction. Valid values are:<ul>
            <li>asc</li>
            <li>desc</li>
        </ul>
        </div></td>
        <td><div class="paragraph">string</div></td>
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
curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID/page \
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
curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID/page?filterby=layout&filterfor=tall-header \
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

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Page</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/pages/{PAGE_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/page/{PAGE_ID}
{% endif %}
{% endhighlight %}

<p>Returns all fields for the given page.
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>read:site</code>
    {% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/pages/1234567890 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID/page/1234567890 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the page are returned.</p>
{% highlight json %}
[
{
"page_id": "1234567890",
"title": "Contact",
"hidden": false,
"membership_required": null,
"parent_id": null,
"layout": "short-header",
"updated_date": "2016-02-08 11:16:19"
"page_url": "new.html"
}
]
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">patch</span> Update a Page</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/pages/{PAGE_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/page/{PAGE_ID}
{% endif %}
{% endhighlight %}

<p>Updates the given page.
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>write:site</code>
    {% endif %}

<h3>Updateable Fields</h3>
<p>These fields can be updated</p>

<table>
    <tr>
        <td><div class="paragraph">Name</div></td>
        <td><div class="paragraph">Description</div></td>
        <td><div class="paragraph">Type</div></td>
    </tr>
    <tr>
        <td><div class="paragraph"><strong>title</strong></div></td>
        <td><div class="paragraph">The page's title.</div></td>
        <td><div class="paragraph">string</div></td>
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
curl https://api.weeblycloud.com/user/USER_ID/site/SITE_ID/page/1234567890 \
-X PATCH \
-d '{
"title": "My Title"
}' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the page are returned.</p>
{% highlight json %}
[
{
"page_id": "1234567890",
"title": "My Title",
"hidden": false,
"membership_required": null,
"parent_id": null,
"layout": "short-header",
"updated_date": "2016-02-08 11:16:19"
"page_url": "new.html"
}
]
{% endhighlight %}
<span style="color: red">[[Below is just for design purposes to show all possible API call labels]]</span>
<h2><span class="label label-put text-uppercase">put</span> Replace a Page</h2>
<p>Some placeholder text</p>

<h2><span class="label label-post text-uppercase">post</span> Create a Page</h2>
<p>Some placeholder text</p>

<h2><span class="label label-delete text-uppercase">delete</span> Delete a Page</h2>
<p>Some placeholder text</p>