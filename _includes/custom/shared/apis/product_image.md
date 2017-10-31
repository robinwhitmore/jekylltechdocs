Products can have multiple images that display when a Products element is used on a page. Images are also used on the product's detail page:
{% include image.html file="sh_productImages.png" caption="Images on the product's page" %}

​Use the Product Images API to view and manage the images used to display products in a Weebly store.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, and those that are required for POST. All fields are returned when you retrieve a single item.
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
        <td>The url of this image if the site and the product are published.
            Note that `img_url` is used for a `POST`, while `url` is returned.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_id</code></td>
        <td>​Unique ID (to this store) for the product.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_image_id</code></td>
        <td>​Unique ID (to this product) for the image.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>width</code></td>
        <td>The width in pixels of the image.</td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>height</code></td>
        <td>The height in pixels of the image.</td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>format</code></td>
        <td>The format of the image.<br>
            Valid values are:
            <ul>
                <li><code>jpg</code></li>
                <li><code>png</code></li>
                <li><code>gif</code></li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the iamge was first created.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the image was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Images for a Product
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/images

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/image
{% endif %}
{% endhighlight %}

Returns all images for the given product. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}


<p class="codeTitle">Example CURL request returning all images:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/images \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/image \
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
        "url": "http://mysite.weebly.com/uploads/2/0/2/8/20281409/s238965604388839654_p2_i1_w207.jpeg",
        "product_id": "12",
        "product_image_id": 1
    }
    {
        "user_id": "123456",
        "site_id": "987654321",
        "url": "http://mysite.weebly.com/uploads/2/0/2/8/20281409/s238965604388839654_p2_i1_w210.jpeg",
        "product_id": "12",
        "product_image_id": 2
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Number of Images for a Product
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/images/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/image/count
{% endif %}
{% endhighlight %}

Returns the number of images for a product.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/images/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/image/count \
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

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Product Image
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID/images/{IMAGE_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID/image/{IMAGE_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given image.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/images/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/image/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the image are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "url": "http://mysite.weebly.com/uploads/2/0/2/8/20281409/s238965604388839654_p2_i1_w207.jpeg",
    "product_id": "12",
    "product_image_id": 1,
    "width": "207",
    "height": "244",
    "format": "jpeg",
    "created_date": 1381276054,
    "updated_date": 1381276054
}
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">post</span> Create a Product Image</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/images

{% else %}
POST /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/image
{% endif %}
{% endhighlight %}

Creates an image for a product.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
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
        <td><code>url</code></td>
        <td>The url of this image if the site and the product are published.
            Note that `img_url` is used for a `POST`, while `url` is returned.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/images \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "img_url": "http://mysite.com/uploads/image.jpeg"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/products/12/images \
-X POST \
-d '{
        "img_url": "http://mysite.com/uploads/image.jpeg"
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
    "width": null,
    "height": null,
    "format": "jpeg",
    "created_date": 0,
    "updated_date": 0,
    "url": "2/0/2/8/20281409/s238965604388839654_p2_i_w.jpeg",
    "product_id": "12",
    "product_image_id": "3"
}
{% endhighlight %}


<h2><span class="label label-delete text-uppercase">delete</span> Delete a Product Image</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/images/{IMAGE_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/image/{IMAGE_ID}
{% endif %}
{% endhighlight %}

Deletes the given product image.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/images/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/image/2 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.