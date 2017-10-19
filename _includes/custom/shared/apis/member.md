Site owners can enable membership for their site, which allows them to restrict specified pages to members or {% if site.project=="designer" %}[groups](ds_api_group.html){%elsif site.project=="cloud" %}[groups](cl_api_group.html){%elsif site.project=="platform" %}[groups](pf_api_group.html){%endif%} of members only. Use the Member API to return information about members, as well as to create, update, and delete members.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, those that are required for `POST` and those that are changeable using `PATCH`. All fields are returned when you retrieve a single item.
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
        <td><code>member_id</code></td>
        <td>​The unique ID (within the site) of the member.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>​The member's full name.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>​The member's email address.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>last_login</code></td>
        <td>​An array of IDs for pages the member has access to.</td>
        <td>Unix timestamp in GMT</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>approved</code></td>
        <td>
            Whether or not a member has been approved.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>list</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>password_set</code></td>
        <td>
            Whether or not the member has set a password.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>group_ids</code></td>
        <td>
            An array of IDs for all {% if site.project=="designer" %}<a href="ds_api_group.html">groups</a>{% elsif site.project=="cloud" %}<a href="cl_api_group.html">groups</a>{% elsif site.project=="platform" %}<a href="pf_api_group.html">groups</a>{% endif %} the member belongs to.​
        </td>
        <td>array of strings</td>
        <td>X</td>
        <td><br></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>page_ids</code></td>
        <td>​An array of IDs for pages the member has access to.</td>
        <td>array of strings</td>
        <td>X<br></td>
        <td><br></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>send_welcome_message</code></td>
        <td>
            ​Whether or not a welcome message should be sent when the user is first created. ​This is never returned, but can be set using POST.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>welcome_message</code></td>
        <td>​The welcome message to be sent. ​This is never returned, but can be set using POST.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the member was created.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br></td>
        <td><br></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the member was last updated</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br></td>
        <td><br></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Members
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/members

{% else %}
GET /user/USER_ID/site/{SITE_ID}/member
{% endif %}
{% endhighlight %}

Returns all members for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:membership`
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

<p class="codeTitle">Example CURL request returning all members:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/members \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/member \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321//members?sortby=name&sortdir=asc \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321//member?sortby=name&sortdir=asc \
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
        "member_id": "1",
        "name": "Member One",
        "email": "memberone@example.com",
        "last_login": null,
        "group_ids": [],
        "page_ids": [],
        "updated_date": 1458752636,
        "created_date": 1458752636
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "member_id": "2",
        "name": "Member Two",
        "email": "membertwo@example.com",
        "last_login": null,
        "group_ids": [],
        "page_ids": [
            "267240304658043510"
        ],
        "updated_date": 1458752643,
        "created_date": 1458752643
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "member_id": "3",
        "name": "Member Three",
        "email": "memberthree@example.com",
        "last_login": null,
        "group_ids": [],
        "page_ids": [],
        "updated_date": 1458752646,
        "created_date": 1458752646
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Member</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/members/{MEMBER_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/member/{MEMBER_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given member.
{% if site.project == "platform" %}
<br>
**scope:** `read:membership`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/members/3 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/member/3 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields (except <code>password</code> for the member are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "member_id": "3",
    "name": "Member Three",
    "email": "memberthree@example.com",
    "last_login": 1415318631,
    "approved": true,
    "password_set": true,
    "group_ids": ["1"],
    "page_ids": ["676764642912660801"],
    "updated_date": 1458752646,
    "created_date": 1458752646
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create a Member</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/members

{% else %}
POST /user/USER_ID/site/{SITE_ID}/member
{% endif %}
{% endhighlight %}

Creates a member. You can choose to send a custom welcome message to the member using the `send_welcome_message` and `welcome_message` fields. To assign the member to a set of groups and give them permission to view a set of pages, first create the member using `POST` and then use `PATCH` to update with group and page IDs.
{% if site.project == "platform" %}
<br>
**scope:** `write:membership`
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
        <td><code>name</code></td>
        <td>​The member's full name.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>​The member's email address.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>password</code></td>
        <td>​The member's password.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>send_welcome_message</code></td>
        <td>​Whether or not a welcome message should be sent when the user is first created. ​This is never returned, but can be set using POST.<br>
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
        <td><code>welcome_message</code></td>
        <td>​The welcome message to be sent. ​This is never returned, but can be set using POST.
        </td>
        <td>string</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/members \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "John Doe",
            "email": "memberfour@example.com",
            "password": "my_password"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/page \
-X POST \
-d '{
        "name": "John Doe",
        "email": "memberfour@example.com",
        "password": "my_password"
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
    "member_id": "4",
    "name": "John Doe",
    "email": "memberfour@example.com",
    "last_login": null,
    "approved": false,
    "password_set": true,
    "group_ids": [],
    "page_ids": [],
    "updated_date": 1458789000,
    "created_date": 1458789000
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Member</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/members/{MEMBER_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/member/{MEMBER_ID}
{% endif %}
{% endhighlight %}

Updates the given member.
{% if site.project == "platform" %}
<br>
**scope:** `write:membership`
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
        <td><code>member_id</code></td>
        <td>​The unique ID (within the site) of the member.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>​The member's full name.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>​The member's email address.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>group_ids</code></td>
        <td>An array of IDs for all {% if site.project=="designer" %}<a href="ds_api_group.html">groups</a>{% elsif site.project=="cloud" %}<a href="cl_api_group.html">groups</a>{% elsif site.project=="platform" %}<a href="pf_api_group.html">groups</a>{% endif %}</a> the member belongs to.​</td>
        <td>array of strings</td>
        <td></td>
    </tr>
    <tr>
        <td><code>page_ids</code></td>
        <td>​An array of IDs for pages the member has access to.</td>
        <td>array of strings</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/members/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "John Doe 2",
            "email": "memberfive@example.com"
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site/123456/member/2 \
-X PATCH \
-d '{
        "name": "John Doe 2",
        "email": "memberfive@example.com"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the <span style="color:red">object</span> are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "member_id": "2",
    "name": "John Doe 2",
    "email": "memberfive@example.com",
    "last_login": 1415318631,
    "approved": true,
    "password_set": true,
    "group_ids": [],
    "page_ids": [],
    "updated_date": 1458789081,
    "created_date": 1458789000
}
{% endhighlight %}

<h2>{% include label.html content="delete" %} Delete a Member</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/members/{MEMBER_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/member/{MEMBER_ID}
{% endif %}
{% endhighlight %}

Deletes the given member.
{% if site.project == "platform" %}
<br>
**scope:** `write:membership`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/members/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/member/2 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.
