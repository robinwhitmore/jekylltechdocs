When a site enables {% if site.project=="designer" %}[membership](ds_api_member.html){%elsif site.project=="cloud" %}[membership](cl_api_member.html){%elsif site.project=="platform" %}[membership](pf_api_member.html){%endif%}, members can be placed in ﻿groups﻿. Entire groups can be granted privileges to pages, rather than granting access to every member individually.

Use the Group API to view, create, update and delete groups.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, those that are required for `POST`, and those that are changeable using `PATCH`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Type</th>
        <th>List</th>
        <th>Required</th>
        <th>Changeable</th>
    </tr>
    <tr>
        <td>​<code>user_id</code></td>
        <td>The unique ID of the authenticated user</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td><code>group_id</code></td>
        <td>​The unique ID (within the site) of this group.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>Name for the group.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>member_ids</code></td>
        <td>An array of ids for {% if site.project=="designer" %}<a href="ds_api_member.html">members</a>{% elsif site.project=="cloud" %}<a href="cl_api_member.html">members</a>{% elsif site.project=="platform" %}<a href="pf_api_member.html">members</a>{% endif %} that belong to this group.</td>
        <td>array of strings</td>
        <td>X</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>page_ids</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_page.html">pages</a>{% elsif site.project=="cloud" %}<a href="cl_api_page.html">pages</a>{% elsif site.project=="platform" %}<a href="pf_api_page.html">pages</a>{% endif %} that this group has access to.</td>
        <td>array of strings</td>
        <td>X</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the group was created.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the group was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Groups
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/groups

{% else %}
GET /user/USER_ID/site/{SITE_ID}/group
{% endif %}
{% endhighlight %}

Returns all groups for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:membership`
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
        <td>Field name to set a filter on.
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
        <td>Field name to sort by. Valid values are:
            <ul>
                <li><code>user_id</code></li>
                <li><code>group_id</code></li>
                <li><code>name</code></li>
            </ul>
        </td>
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

<p class="codeTitle">Example CURL request returning all groups:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/groups \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/group \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/groups?sortby=group_id&sortdir=asc \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/groups?sortby=group_id&sortdir=asc \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
    {
        "user_id": "123456",
        "site_id": "987654321",
        "group_id": "1",
        "name": "VIP Group",
        "member_ids": [
            "1",
            "2"
        ],
        "page_ids": [
            "346734821280013000",
            "497271811349360000"
        ],
        "updated_date": 1487027583,
        "created_date": 1487027583
    }
    {
        "user_id": "123456",
        "site_id": "987654321",
        "group_id": "2",
        "name": "Gold Group",
        "member_ids": [
            "3",
            "4"
        ],
        "page_ids": [
        "3543213546541",
        "3543513513543"
        ],
        "updated_date": 1490132044,
        "created_date": 1490131779
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Group
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/groups/{GROUP_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/group/{GROUP_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given group.
{% if site.project == "platform" %}
<br>
**scope:** `read:membership`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/groups/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/group/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the group are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "group_id": "1",
    "name": "VIP Group",
    "member_ids": [
        "1",
        "2"
    ],
    "page_ids": [
        "346734821280013000",
        "497271811349360000"
    ],
    "updated_date": 1490132044,
    "created_date": 1490131779
}
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">post</span> Create a Group</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/groups

{% else %}
POST /user/USER_ID/site/{SITE_ID}/group
{% endif %}
{% endhighlight %}

Creates a group. To assign members to the group and to give the group permission to view a set of pages, first create the group using `POST` and then use `PATCH` to update with member and page IDs.
{% if site.project == "platform" %}
<br>
**scope:** `write:membership`
{% endif %}


These fields can be created:

<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Type</th>
        <th>Notes</th>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>The name for the group.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/groups \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "Silver Group"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/group \
-X POST \
-d '{
"name": "Silver Group"
}' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "group_id": "3",
    "name": "Silver Group",
    "member_ids": [],
    "page_ids": []
    "updated_date": 1490131779,
    "created_date": 1490131779
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Group</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/groups/{GROUP_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/group/{GROUP_ID}
{% endif %}
{% endhighlight %}

Updates the given group.
{% if site.project == "platform" %}
<br>
**scope:** `write:membership`
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
        <td><code>name</code></td>
        <td>Name for the group.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>member_ids</code></td>
        <td>An array of ids for {% if site.project=="designer" %}<a href="ds_api_member.html">members</a>{% elsif site.project=="cloud" %}<a href="cl_api_member.html">members</a>{% elsif site.project=="platform" %}<a href="pf_api_member.html">members</a>{% endif %} that belong to this group.</td>
        <td>array of strings</td>
        <td></td>
    </tr>
    <tr>
        <td><code>page_ids</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_page.html">pages</a>{% elsif site.project=="cloud" %}<a href="cl_api_page.html">pages</a>{% elsif site.project=="platform" %}<a href="pf_api_page.html">pages</a>{% endif %} that this group has access to.</td>
        <td>array of strings</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/groups/3 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name":"Silver
            "member_ids": ["1","2"]
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site/123456/page/1234567890 \
-X PATCH \
-d '{
        "name":"Silver
        "member_ids": ["1","2"]
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the <span style="color:red">object</span> are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "group_id": "3",
    "name": "Silver",
    "member_ids": [
        "1",
        "2"
    ],
    "page_ids": []
    "updated_date": 1490131779,
    "created_date": 1490131779
}
{% endhighlight %}

<h2>{% include label.html content="delete" %} Delete a Group</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/groups/{GROUP_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/group/{GROUP_ID}
{% endif %}
{% endhighlight %}

Deletes the given group.
{% if site.project == "platform" %}
<br>
**scope:** `write:membership`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/groups/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/group/2 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.
