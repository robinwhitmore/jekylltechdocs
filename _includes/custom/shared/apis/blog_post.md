Site owners create [blog posts](https://hc.weebly.com/hc/en-us/articles/201405086-Create-a-Blog-Post) for their [blogs](https://dev.weebly.com/blog-api.html). Weebly blog posts can accept comments from readers. When comments are allowed, they can be anonymous and they can optionally require approval. The approval process is handled by the moderation app (such as Disqus) set on the blog.

​Use the Blog Post API to return details about a post to a blog, or to update a post. A message can be configured to be used when blog posts are shared on social media. Tags are used to group blog posts together.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
## Fields
The following table shows all fields that exist for this API, those that are returned when you retrieve a list, those that are required for `PUT` and those that are changeable using `PATCH` and `PUT`. All fields are returned when you retrieve a single item.
<table>
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
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>post_id</code></td>
        <td>Unique ID for this blog post.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>post_title</code></td>
        <td>Title of the blog post.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>post_body</code></td>
        <td>Content of the post, including the markup.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>post_author</code></td>
        <td>The unique user_id of the user who created the post.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>post_created_date</code></td>
        <td>​Date the post draft was first created.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>post_lastrevision_date</code></td>
        <td>​Date the post was last updated.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>allow_comments</code></td>
        <td>Whether or not comments are allowed for this post, and if allowed, if non-anonymous comments are allowed. <br>Valid values are:
            <ul>
                <li><code>yes</code>: Comments are allowed.</li>
                <li><code>no</code>: Comments are allowed.</li>
                <li><code>noanon</code>: Comments are allowed, but they can't be anonymous.</li>
            </ul></td>
        <td>string</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>post_link</code></td>
        <td>URL for this post, for example, <code>mynewblogpost.html</code></td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>require_approval</code></td>
        <td>Whether or not comments require approval on this post.<br>
            ​Valid values are:
            <ul>
                <li>true</li>
                <li>false</li>
            </ul></td>
        <td>boolean</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>post_url</code></td>
        <td>​The full URL, including protocol, to the post. For example:
            <code>http://mysite.weebly.com/blog/mynewblogpost.html</code></td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>share_message</code></td>
        <td>​​The <a href="https://hc.weebly.com/hc/en-us/articles/203775853-Sharing-Scheduled-Blog-Posts-to-Facebook-and-Twitter">configured message</a> to be used when sharing the post.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>seo_title</code></td>
        <td>​​​The SEO title for the post. Site owners can create a different title for the browser title bar.
        </td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>seo_description</code></td>
        <td>​​​The SEO page description for the post.
        </td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>tags</code></td>
        <td>​​​​An array of strings that represent tags for the post. These are shown as <a href="https://hc.weebly.com/hc/en-us/articles/201405086-Create-a-Blog-Post">Categories</a> in the UI.
        </td>
        <td>array of strings</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>commenting_system</code></td>
        <td>The system used to allow commenting on the blog. The value <code>default</code> means that the native Weebly system is used.<br>
            Valid values are:
            <ul>
                <li>​default</li>
                <li>disqus</li>
                <li>facebook</li>
            </ul></td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>date_format</code></td>
        <td>Format used for dates on this site.<br>
            Valid values are:
            <ul>
                <li><code>n/j/Y</code>: month/day/year</li>
                <li><code>j/n/Y</code>: day/month/year</li></ul></td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code> </td>
        <td>Date the post was first created.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code> </td>
        <td>Date the post was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td></td>
        <td> </td>
    </tr>

</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Blog Posts
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/blogs/{BLOG_ID}/posts

{% else %}
GET /user/USER_ID/site/{SITE_ID}/blog/{BLOG_ID}/post
{% endif %}
{% endhighlight %}

Returns all posts for the given blog. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:blog`
{% endif %}


<p class="codeTitle">Example CURL request returning all blog posts:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/blogs/6543/posts \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/blog/6543/post \
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
        "post_id": "528036988357777409",
        "post_title": "My New Blog Post",
        "post_created_date": "2017-10-03 11:58:06",
        "created_date": 1402964756
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "post_id": "648291276105250798",
        "post_title": "Another Blog Post",
        "post_created_date": "2013-09-06 09:57:04",
        "created_date": 1378504674
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "post_id": "489389593268427583",
        "post_title": "Travel Blog Post",
        "post_created_date": "2013-09-06 07:00:00",
        "created_date": 1378504578
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Blog Post
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/blogs/{BLOG_ID}/posts/{POST_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/blog/{BLOG_ID}/post/{POST_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given blog post.
{% if site.project == "platform" %}
<br>
**scope:** `read:blog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/blogs/6543/posts/827004614453058652 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/blog/6543/post/827004614453058652 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the blog post are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "post_id": "827004614453058652",
    "post_title": "Feeling the Burn",
    "post_body": "Stayed in the sun too long<\/div>",
    "post_author": "123456",
    "allow_comments": "yes",
    "post_link": "my-new-blog-post.html",
    "require_approval": false,
    "post_url": "http:\/\/mysite.weebly.com\/blog\/my-new-blog-post.html",
    "share_message": "Read my latest blog post!",
    "seo_title": null,
    "seo_description": null,
    "tags":  {
        "health": "health",
        "food": "food"
    },
    "commenting_system": "default",
    "created_date": 1402964756,
    "updated_date": 1402964756,
    "date_format": "j/n/y"
}
{% endhighlight %}


<h2>{% include label.html content="put" %}  Replace a Blog Post</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PUT /v1/user/sites/{SITE_ID}/bloga/{BLOG_ID}/posts/{POST_ID}

{% else %}
PUT /user/USER_ID/site/{SITE_ID}/blog/{BLOG_ID}/post/{POST_ID}
{% endif %}
{% endhighlight %}

Replaces the given blog post.
{% if site.project == "platform" %}
<br>
**scope:** `write:blog`
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
        <td><code>post_body</code></td>
        <td>​​The content of the post, including the markup.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>post_title</code></td>
        <td>The title of the post.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>post_tags</code></td>
        <td>​An array of categories assigned to this post.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>allow_comments</code></td>
        <td>Whether or not comments are allowed for this post.<br>
            Valid values are:
            <ul>
                <li><code>yes</code></li>
                <li><code>no</code></li>
            </ul></td>
        <td>string</td>
        <td>When you update from <code>no</code> to <code>yes</code>, then the value of <code>commenting_system</code> updates to <code>default</code> (which is Weebly).</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PUT \
--url https://api.weebly.com/v1/user/sites/987654321/blogs/6543/posts/827004614453058652 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "post_body": "Stayed in the sun too long, and now I am totally burned!"
}'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/blog/6543/post/827004614453058652 \
-X PUT \
-d '{
        "post_body": "Stayed in the sun too long, and now I am totally burned!"
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
    "post_id": "827004614453058652",
    "post_title": "Feeling the Burn",
    "post_body": "Stayed in the sun too long, and now I am totally burned!<\/div>",
    "post_author": "72773000",
    "allow_comments": "yes",
    "post_link": "feeling-the-burn.html",
    "require_approval": false,
    "post_url": "http:\/\/example.com\/blog\/feeling-the-burn",
    "share_message": null,
    "seo_title": null,
    "seo_description": null,
    "tags": [],
    "commenting_system": "default",
    "created_date": 1468437625,
    "updated_date": 1468437625,
    "date_format": "j/n/y"
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Blog Post</h2>

{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/blogs/{BLOG_ID}/posts/{POST_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/blog/{BLOG_ID}/post/{POST_ID}
{% endif %}
{% endhighlight %}

Updates the given blog post.
{% if site.project == "platform" %}
<br>
**scope:** `write:blog`
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
    <td><code>post_body</code></td>
    <td>​​The content of the post, including the markup.</td>
    <td>string</td>
    <td></td>
</tr>
<tr>
    <td><code>post_title</code></td>
    <td>The title of the post.</td>
    <td>string</td>
    <td></td>
</tr>
<tr>
    <td><code>post_tags</code></td>
    <td>​An array of categories assigned to this post.</td>
    <td>string</td>
    <td></td>
</tr>
<tr>
    <td><code>allow_comments</code></td>
    <td>Whether or not comments are allowed for this post.<br>
        Valid values are:
        <ul>
            <li><code>yes</code></li>
            <li><code>no</code></li>
        </ul></td>
    <td>string</td>
    <td>When you update from <code>no</code> to <code>yes</code>, then the value of <code>commenting_system</code> updates to <code>default</code> (which is Weebly).</td>
</tr>
</table>

{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/blogs/6543/posts/827004614453058652 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "post_body": "Stayed in the sun too long, and now I am totally burned!"
}'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/blog/6543/post/827004614453058652 \
-X PATCH \
-d '{
        "post_body": "Stayed in the sun too long, and now I am totally burned!"
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
    "post_id": "827004614453058652”,
    "post_title": "Feeling the Burn",
    "post_body": "Stayed in the sun too long, and now I am totally burned!<\/div>",
    "post_author": "72773000",
    "allow_comments": "yes",
    "post_link": "feeling-the-burn.html",
    "require_approval": false,
    "post_url": "http:\/\/example.com\/blog\/feeling-the-burn",
    "share_message": null,
    "seo_title": null,
    "seo_description": null,
    "tags": [],
    "commenting_system": "default",
    "created_date": 1468437625,
    "updated_date": 1468437625,
    "date_format": "j/n/y"
}
{% endhighlight %}

<h2>{% include label.html content="delete" %} Delete a Blog Post</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/blogs/{BLOG_ID}/posts/{POST_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/blog/{BLOG_ID}/post/{POST_ID}
{% endif %}
{% endhighlight %}

Deletes the given blog post.
{% if site.project == "platform" %}
<br>
**scope:** `write:blog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/blogs/6543/posts/827004614453058652 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/blog/6543/post/827004614453058652 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.
