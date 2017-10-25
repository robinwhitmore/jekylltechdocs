Site owners can upload images for categories. These images are displayed on category pages in the store.
{% include image.html file="api_cat_image.png" caption="Category images" %}
​Use the Category Image API to retrieve image information, as well as to create and delete category images.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, and those that are required for `POST`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
        <td><strong>Required</strong></td>
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
        <td></td>
    </tr>

    <tr>
        <td><code>url</code></td>
        <td>​When returned, the URL to the image when on a published site.<br>
            ​For POST, use <code>image_url</code> instead of <code>url</code>, and send the URL to the image to be uploaded.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>category_id</code></td>
        <td>​Unique ID (to the store) of the {% if site.project=="designer" %}<a href="ds_api_category.html">category</a>{% elsif site.project=="cloud" %}<a href="ds_api_category.htm">category</a>{% elsif site.project=="platform" %}<a href="pf_api_category.htm">category</a>{% endif %} that the image is used for.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>category_image_id</code></td>
        <td>​Unique (to the category) ID of the image</td>
        <td>int</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>width</code></td>
        <td>​The width in pixels of this image.</td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>height</code></td>
        <td>​​The height in pixels of this image.</td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>format</code></td>
        <td>​The format of the image.<br>
            Valid values are:
            <ul>
                <li><code>jpeg</code></li>
                <li><code>png</code></li>
                <li><code>gif</code></li>
            </ul>
        </td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the image was posted</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the image was last updated</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Category Images</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}/images

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}/image
{% endif %}
{% endhighlight %}

Returns all category images for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}


<p class="codeTitle">Example CURL request returning all category images:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/7/images \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/7/image \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}


<p class="codeTitle">Example response:</p>
{% highlight json %}
[
    {
        "user": "123456",
        "site_id": "987654321",
        "url": "http:\/\/testing12345.com\/uploads\/7\/5\/6\/5\/75658535\/s274903847701657561_c2_i1_w547.png",
        "category_id": "2",
        "category_image_id": 1
    },
    {
        "user": "123456",
        "site_id": "987654321",
        "url": "http:\/\/testing12345.com\/uploads\/7\/5\/6\/5\/75658535\/s2749038477065465416516_c2_i1_w532.png",
        "category_id": "2",
        "category_image_id": 2
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Quantity of Category Images</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}/images/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}/image/count
{% endif %}
{% endhighlight %}

Returns the number images uploaded for this category.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/7/images/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/7/image/count \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "count": 2
}
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Category Image</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}/images/{IMAGE_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}/image/{IMAGE_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given category image.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/7/images/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/7/image/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the category are returned.</p>
{% highlight json %}
{
    "user": "123456",
    "site_id": "987654321",
    "url": "http:\/\/testing12345.com\/uploads\/7\/5\/6\/5\/75658535\/s274903847701657561_c2_i1_w547.png",
    "category_id": "7",
    "category_image_id": 1,
    "width": "547",
    "height": "292",
    "format": "png",
    "created_date": 1458864865,
    "updated_date": 1458864865
}
{% endhighlight %}

<h2><span class="label label-post text-uppercase">post</span> Create a Category Image</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID/images

{% else %}
POST /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID/image
{% endif %}
{% endhighlight %}

Adds an image to a category.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
{% endif %}


These fields can be posted:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>image_url</code></td>
        <td>​The URL to the image to be uploaded.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/7/images \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "img_url": "http://www.sea-way.org//blog/google-ocean.jpg"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category \
-X POST \
-d '{
        "img_url": "http://www.sea-way.org//blog/google-ocean.jpg"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "user": "123456",
    "site_id": "987654321",
    "url": "http:\/\/testing12345.com\/uploads\/7\/5\/6\/5\/75658535\/s274903847701657561_c3_i1_w480.jpeg",
    "category_id": "7",
    "category_image_id": 3,
    "width": "480",
    "height": "286",
    "format": "jpeg",
    "user_id": "123456",
    "created_date": 1458865615,
    "updated_date": 1458865615
}
{% endhighlight %}

<h2><span class="label label-delete text-uppercase">delete</span> Delete a Category Image</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}/images/{IMAGE_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}/image/{IMAGE_ID}
{% endif %}
{% endhighlight %}

Deletes the given category.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/9/images/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/9/image/2 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.