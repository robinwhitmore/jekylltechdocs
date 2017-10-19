By default, Weebly [blogs](https://hc.weebly.com/hc/en-us/articles/201405086-Create-a-Blog-Post) allow comments and use a native commenting system that allows moderation - comments need approval before displaying on the site. Site owners can elect to use Disqus or Facebook instead. Owners can also add custom code to the header and/or footer of their blog.

Use the Blog API to retrieve a list of blogs on the site or details about a given blog. For information about blog posts, use the {% if site.project=="designer" %}[Blog Post](ds_api_blog_post.html){%elsif site.project=="cloud" %}[Blog Post](cl_api_blog_post.html){%elsif site.project=="platform" %}[Blog Post](pf_api_blog_post.html){%endif%} API.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
## Fields
The following table shows all fields that exist for this API, noting those that are returned when you retrieve a list. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
    </tr>
    <tr>
        <td><code>user_id</code></td>
        <td>The unique ID of the authenticated user.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated
            user.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>blog_id</code></td>
        <td>Unique ID for this blog.<br>
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>page_id</code></td>
        <td>​​The unique ID of the page<!--todo: link--> that the blog is
            on.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>title</code></td>
        <td>The blog's title<br>
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td>
            <code>allow_comments</code>
        </td>
        <td>Whether or not the blog allows
            comments. Valid values are:
            <ul>
                <li><code>yes</code></li>
                <li><code>no​​</code></li>
            </ul>
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>date_format</code>
        </td>
        <td>Format used for dates on this
            site. Valid values are:<br>
            <ul>
                <li><code>n/j/Y</code>:
                    month/day/year</li>
                <li><code>j/n/Y</code>:
                    day/month/year</li>
            </ul>
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>time_format</code>
        </td>
        <td>Time format used for the blog.
            Valid values are:
            <ul>
                <li><code>12</code></li>
                <li><code>24</code></li>
            </ul>
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>page_blog_num</code>
        </td>
        <td>​The page number for pagination
            of the blog.
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>blog_link</code>
        </td>
        <td>A link to the blog, without the
            site URL. (example: <code>blog.html</code>)<br>
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>blog_slug</code>
        </td>
        <td>​​​The unique (within the site)
            slug for the blog.
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>require_approval</code>
        </td>
        <td>Whether or not comments require
            approval. Valid values:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean<br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td>
            <code>post_header_code</code>
        </td>
        <td>​​​The HTML code that goes in
            the post header.
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>post_footer_code</code>
        </td>
        <td>​​​​The HTML code that goes in
            the post footer.
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>time_zone</code>
        </td>
        <td>Time zone of the blog. ​Valid
            values can be found <a
                    href="http://cloud-developer.weebly.com/uploads/3/0/3/1/30316827/timezones.json"
                    target="_blank">here<!--todo: Need to repost this somewhere--></a>.<br>
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>commenting_system</code>
        </td>
        <td>How blog comments are selected.
            default uses Weebly. Valid values are:
            <ul>
                <li>​<code>default</code> (uses
                    Weebly)</li>
                <li><code>disqus</code></li>
                <li><code>facebook</code></li>
            </ul>
        </td>
        <td>string</td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <code>updated_date</code>
        </td>
        <td>​​Date the blog was last updated.
        </td>
        <td>​​Unix timestamp in GMT<br>
        </td>
        <td><br>
        </td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Blogs</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/blogs

{% else %}
GET /user/USER_ID/site/{SITE_ID}/blog
{% endif %}
{% endhighlight %}

Returns all blogs for the given site. Only `list` fields are returned.
    {% if site.project == "platform" %}

    **scope**: `read:blog`
    {% endif %}

<p class="codeTitle">Example CURL request returning all blogs:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/blogs \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/blog \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
    {
        "site_id": "987654321",
        "user_id": "123456",
        "blog_id": "442134315209084655",
        "page_id": "697954564875544555",
        "title": "My Personal Blog"
    }
    {
        "site_id": "987654321",
        "user_id": "123456",
        "blog_id": "546579684213136568",
        "page_id": "697954564875544557",
        "title": "My Work Blog"
    }
]
{% endhighlight %}



<h2>{% include label.html content="get" %} Retrieve Details for a Blog</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/blogs/{BLOG_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/blog/{BLOG_ID}
{% endif %}
{% endhighlight %}

<p>Returns all fields for the given blog.
    {% if site.project == "platform" %}
    <br>
    <b>scope:</b> <code>read:blog</code>
    {% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/blogs/1234567890 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/page/1234567890 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the blog are returned.</p>
{% highlight json %}
{
    "site_id": "987654321",
    "user_id": "123456",
    "blog_id": "1234567890",
    "page_id": "87654321098",
    "allow_comments": "yes",
    "date_format": "us",
    "time_format": "n/j/y",
    "page_blog_num": "1",
    "blog_link": "blog.html",
    "blog_slug": "blog",
    "require_approval": false,
    "post_header_code": null,
    "post_footer_code": null,
    "time_zone": "America\/Los_Angeles",
    "commenting_system": "default",
    "title": "My Work Blog",
    "updated_date": 1415318319
}
{% endhighlight %}

