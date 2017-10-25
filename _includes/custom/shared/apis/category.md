Stores use [categories](https://hc.weebly.com/hc/en-us/articles/227050287-Organize-Your-Store-with-Categories) to group and display similar products. Categories can be nested. Products can be assigned to one or more categories.
{% include image.html file="api_categories.png" caption="Categories in a store" %}

​Use the Categories API to retrieve category information, as well as to update, replace, create, and delete categories.

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
        <td><code>url</code></td>
        <td>​Direct URL to the category's page.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>category_id</code></td>
        <td>​Unique ID (to the store) of the category.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>​Name of the category.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>seo_page_title</code></td>
        <td>​The SEO title for the category. Site owners can create a title as a meta tag used by search engines.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>seo_page_description</code></td>
        <td>​The SEO description for the category. Site owners can create a title as a meta tag used by search engines.
        </td>
        <td>string</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>​The unique ID (to the store) of all {% if site.project=="designer" %}<a href="ds_api_product.html">products</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">products</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">products</a>{% endif %} associated with this category.</td>
        <td>array of strings</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>images</code></td>
        <td>An array of images to display for this category. Use the {% if site.project=="designer" %}<a href="ds_api_category_image.html">Category Images</a>{% elsif site.project=="cloud" %}<a href="cl_api_category_image.html">Category Images</a>{% endif %} API to work with images.</td>
        <td>array of image objects</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>parent_category_id</code></td>
        <td>For nested categories, ​ID of the category that is the parent to this category.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the</td>
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

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Categories</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/categories

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/category
{% endif %}
{% endhighlight %}

Returns all categories for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store`
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
        <td>Field name to set a filter on.
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​Value to search the filterby field for. You can use the URL encoded characters for following operators:
        <ul>
            <li><code><</code>    use   <code>%3C</code></li>
            <li><code>></code>    use   <code>%3E</code></li>
            <li><code><=</code>  use  <code>%3C%3D</code></li>
            <li><code>>=</code>  use  <code>%3E%#D</code></li>
        </ul>
        </td>
        <td>string</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request returning all categories:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories?filterby=parent_category_id&filterfor=1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category?filterby=parent_category_id&filterfor=1 \
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
        "category_id": "1",
        "name": "Featured Products",
        "images": [],
        "parent_category_id": null
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "category_id": "7",
        "name": "Fruit",
        "images": [
            {
                "url": "http://654321.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_c7.jpeg",
                "user_id": "123456",
                "site_id": "987654321",
                "category_id": "7",
                "category_image_id": 1,
            }
        ],
        "parent_category_id": "1"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "category_id": "8",
        "name": "Berries",
        "images": [
            {
                "url": "http://654321.weebly.com/uploads/5/4/9/1/54914441/s242778913.jpeg",
                "user_id": "123456",
                "site_id": "987654321",
                "category_id": "8",
                "category_image_id": 1,
                "user_id": "123456"
            }
        ],
        "parent_category_id": "1"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "category_id": "9",
        "name": "Citrus",
        "images": [
            {
                "url": "http://654321.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_c9.jpeg",
                "user_id": "123456",
                "site_id": "987654321",
                "category_id": "9",
                "category_image_id": 1,
                "user_id": "123456"
            }
        ]
        "parent_category": "1"
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Quantity of Categories</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/categories/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/category/count
{% endif %}
{% endhighlight %}

Returns the number categories in the store.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/count \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "count": 6
}
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Category</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given category.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/7 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/7 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the category are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "url": "https://hf4u.weebly.com/store/c7/Fruit.html",
    "category_id": "7",
    "name": "Fruit",
    "seo_page_title": null,
    "seo_page_description": null,
    "product_ids": [
        "1",
        "7",
        "8",
        "14",
        "16",
        "18",
        "25",
        "28",
        "29",
        "31"
    ],
    "created_date": 1445624678,
    "updated_date": 1445625218,
    "images": [
        {
            "url": "http://654321.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_c7.jpeg",
            "user_id": "123456",
            "site_id": "987654321",
            "category_id": "7",
            "category_image_id": 1,
        }
    ],
    "parent_category_id": "1"
}
{% endhighlight %}

<h2><span class="label label-post text-uppercase">post</span> Create a Category</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/store/categories

{% else %}
POST /user/USER_ID/site/{SITE_ID}/store/category
{% endif %}
{% endhighlight %}

Creates a category.
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
        <td><code>name</code></td>
        <td>​Name of the category.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>seo_page_title</code></td>
        <td>​The SEO title for the category. Site owners can create a title as a meta tag used by search engines.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>seo_page_description</code></td>
        <td>​The SEO description for the category. Site owners can create a title as a meta tag used by search engines.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>​The unique ID (to the store) of all {% if site.project=="designer" %}<a href="ds_api_product.html">products</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">products</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">products</a>{% endif %} associated with this category.</td>
        <td>array of strings</td>
        <td></td>
    </tr>
    <tr>
    <td><code>parent_category_id</code></td>
    <td>For nested categories, ​ID of the category that is the parent to this category.</td>
    <td>string</td>
</tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "New Category",
            "parent_category": "1"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category \
-X POST \
-d '{
        "name": "New Category",
        "parent_category": "1"
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
    "url": "https://hf4u.weebly.com/store/c13/new_category.html",
    "category_id": "13",
    "name": "New Category",
    "seo_page_title": null,
    "seo_page_description": null,
    "product_ids": [],
    "created_date": 1476313140,
    "updated_date": 1476313140,
    "images": [],
    "parent_category_id": "1"
}
{% endhighlight %}

<h2><span class="label label-put text-uppercase">put</span> Replace a Category</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PUT /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}

{% else %}
PUT /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}
{% endif %}
{% endhighlight %}

Replaces the given category.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-cataglog`
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
        <td><code>name</code></td>
        <td>​Name of the category.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>seo_page_title</code></td>
        <td>​The SEO title for the category. Site owners can create a title as a meta tag used by search engines.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>seo_page_description</code></td>
        <td>​The SEO description for the category. Site owners can create a title as a meta tag used by search engines.
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>​The unique ID (to the store) of all {% if site.project=="designer" %}<a href="ds_api_product.html">products</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">products</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">products</a>{% endif %} associated with this category.</td>
        <td>array of strings</td>
        <td></td>
    </tr>
    <tr>
        <td><code>parent_category_id</code></td>
        <td>For nested categories, ​ID of the category that is the parent to this category.</td>
        <td>string</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PUT \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/13 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "New Category",
            "parent_category": "1"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/13 \
-X PUT \
-d '{
        "name": "New Category",
        "parent_category": "1"
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
    "url": "https://hf4u.weebly.com/store/c13/new_category.html",
    "category_id": "13",
    "name": "New Category",
    "seo_page_title": null,
    "seo_page_description": null,
    "product_ids": [],
    "created_date": 1476313140,
    "updated_date": 1476313140,
    "images": [],
    "parent_category_id": "1"
}
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">patch</span> Update a Category</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}
{% endif %}
{% endhighlight %}

Updates the given category.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
{% endif %}


These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>​Name of the category.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>seo_page_title</code></td>
        <td>​The SEO title for the category. Site owners can create a title as a meta tag used by search engines.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>seo_page_description</code></td>
        <td>​The SEO description for the category. Site owners can create a title as a meta tag used by search engines.
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>​The unique ID (to the store) of all {% if site.project=="designer" %}<a href="ds_api_product.html">products</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">products</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">products</a>{% endif %} associated with this category.</td>
        <td>array of strings</td>
    </tr>
    <tr>
        <td><code>parent_category_id</code></td>
        <td>For nested categories, ​ID of the category that is the parent to this category.</td>
        <td>string</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/9 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name":"Flowers"
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site/123456/store/category/9 \
-X PATCH \
-d '{
        "name":"Flowers"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the category are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "url": "https://hf4u.weebly.com/store/c9/Flowers.html",
    "category_id": "9",
    "name": "Flowers",
    "seo_page_title": null,
    "seo_page_description": null,
    "product_ids": [
        "27",
        "30",
        "32",
        "34",
        "35",
        "36"
    ],
    "created_date": 1445624817,
    "updated_date": 1476314995,
    "images": [
        {
            "url": "http://821263702103547270.weebly.com/uploads/5/4/9/1/54914441/s242c9_i1_w3000.jpeg",
            "site_id": "987654321",
            "category_id": "9",
            "category_image_id": 1,
        }
    ],
    "parent_id": "1"
}
{% endhighlight %}

<h2><span class="label label-delete text-uppercase">delete</span> Delete a Category</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/store/categories/{CATEGORY_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/store/category/{CATEGORY_ID}
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
--url https://api.weebly.com/v1/user/sites/987654321/store/categories/9 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/category/9 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.