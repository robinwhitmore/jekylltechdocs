Products are made up of an array of SKUs, which themselves are made up of an array of options and option choices. [Options](https://hc.weebly.com/hc/en-us/articles/227067887-Add-Selectable-Options-Like-Size-or-Color-to-a-Physical-Product) are things like color that have an array of choices, like red, yellow, and black. For example, a T-shirt might have options like `Color` and `Size`. The option `Color` might have an array of choices like `Red` and `Yellow`, while the option `Size` might have choices of `Small`, `Medium`, and `Large`. A SKU would be the unique combination of the option choices for a product, for example a red T-shirt in size small, or a yellow T-shirt in size large. Each SKU can have its own price, inventory, etc.
​
When you create a product, you must provide an array of `SKU` objects. Creating a product is the only way to create SKUs.

Use the Product SKUs API to retrieve and update product SKUs. Use the {% if site.project=="designer" %}[Product API](ds_api_product.html){%elsif site.project=="cloud" %}[Product API](cl_api_product.html){%elsif site.project=="platform" %}[Products API](pf_api_product.html){%endif%} to create new SKUs.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, and those that are changeable using `PATCH`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
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
        <td></td>
    </tr>

    <tr>
        <td><code>current_price</code></td>
        <td>The price this SKU is currently sold for - either the <code>price</code> or <code>sale_ price</code>.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_id</code></td>
        <td>​​Unique ID (to this store) for the {% if site.project=="designer" %}<a href="ds_api_product.html">product</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">product</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_sku_id</code></td>
        <td>​​Unique ID (to this product) for this SKU.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>sku</code></td>
        <td>​A user-facing SKU identifier. Typically a code used to identify this SKU.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>price</code></td>
        <td>​​The full price of this SKU</td>
        <td>decimal</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>sale_price</code></td>
        <td>​The sale price for this SKU.</td>
        <td>decimal</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>inventory</code></td>
        <td>​How many of this SKU are currently available.</td>
        <td>integer</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>weight</code></td>
        <td>The weight of a single SKU. The weight can be used to determine shipping costs at purchase.</td>
        <td>decimal</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_type</code></td>
        <td>The type of this SKU.<br> 
            Valid values are:
            <ul>
                <li><code>physical</code>: a product that is a physical thing that can be shipped. Most products are physical.</li>
                <li><code>digital</code>: a file that must be downloaded, for example, a PDF file. (Note: You cannot create digital products using the API.)</li>
                <li><code>service</code>: Non-tangible goods, such as landscaping, or babysitting.</li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>download_limit_type</code></td>
        <td>​The download limit if this sku is a digital good. It can be restricted by either the amount available for download or by a number of days the download is available for.</td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>download_units_remaining</code></td>
        <td>​The number of downloads available. Either a number of downloads or number of days, based on the <code>download_limit_type</code>.
        </td>
        <td>integer</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>files</code></td>
        <td>For digital products, the file(s) that can be downloaded.</td>
        <td>array</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>optionchoices</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_product_image.html">option_choices</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_image.html">option_choices</a>{% elsif site.project=="platform" %}<a href="pf_api_product_image.html">option_choices</a>{% endif %} for this SKU. For example, the color <code>green</code>, the size <code>medium</code>, or both if it's <code>green</code> and <code>medium</code>. If only one <code>optionchoice</code> exists for this SKU, the array is the one <code>optionchoice</code>.</td>
        <td>array</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the SKU was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the SKU was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of SKUs
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/skus

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/sku
{% endif %}
{% endhighlight %}

Returns all SKUs for the given product. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request returning all SKUs:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/sku \
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
        "current_price": 2,
        "product_id": "12",
        "product_sku_id": "1",
        "sku": null,
        "price": 2,
        "sale_price": null,
        "inventory": 7,
        "optionchoices": [
            {
                "product_id": "12",
                "product_sku_id": "1",
                "product_sku_optionchoice_id": "1",
                "name": "Color",
                "choice": "red",
                "option_type": "color",
                "user_id": "123456",
                "site_id": "987654321"
            },
            {
                "product_id": "12",
                "product_sku_id": "1",
                "product_sku_optionchoice_id": "1",
                "name": "Size",
                "choice": "small",
                "option_type": "radio",
                "user_id": "123456",
                "site_id": "987654321"
            }
        ]
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "current_price": 2,
        "product_id": "12",
        "product_sku_id": "2",
        "sku": null,
        "price": 2,
        "sale_price": 2,
        "inventory": 2,
        "optionchoices": [
            {
                "product_id": "2",
                "product_sku_id": "2",
                "product_sku_optionchoice_id": "1",
                "name": "Color",
                "choice": "red",
                "option_type": "color",
                "user_id": "123456",
                "site_id": "987654321"
            },
            {
                "product_id": "2",
                "product_sku_id": "2",
                "product_sku_optionchoice_id": "2",
                "name": "Size",
                "choice": "large",
                "option_type": "radio",
                "user_id": "123456",
                "site_id": "987654321"
            }
        ]
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "current_price": 2,
        "product_id": "12",
        "product_sku_id": "3",
        "sku": null,
        "price": 2,
        "sale_price": 2,
        "inventory": 6,
        "optionchoices": [
            {
                "product_id": "12",
                "product_sku_id": "3",
                "product_sku_optionchoice_id": "1",
                "name": "Color",
                "choice": "yellow",
                "option_type": "color",
                "user_id": "123456",
                "site_id": "987654321"
            },
            {
                "product_id": "12",
                "product_sku_id": "3",
                "product_sku_optionchoice_id": "2",
                "name": "Size",
                "choice": "small",
                "option_type": "radio",
                "user_id": "123456",
                "site_id": "987654321"
            }
        ]
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of SKUs for a Product</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/skus/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/sku/count
{% endif %}
{% endhighlight %}

Returns the number of SKUs for the product.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/sku/count \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "count": 3
}
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Product SKU
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/skus/{PRODUCT_SKU_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/sku/{PRODUCT_SKU_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given product SKU.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/sku/2 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the product SKU are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "current_price": 2,
    "product_id": "12",
    "product_sku_id": "2",
    "sku": null,
    "price": 2,
    "sale_price": 2,
    "inventory": 2,
    "weight": 3,
    "product_type": "physical",
    "download_limit_type": null,
    "download_units_remaining": null,
    "created_date": 1381276147,
    "updated_date": 1484784177,
    "files": [],
    "optionchoices": [
        {
            "product_id": "2",
            "product_sku_id": "2",
            "product_sku_optionchoice_id": "1",
            "name": "Color",
            "choice": "red",
            "option_type": "color",
            "user_id": "123456",
            "site_id": "987654321"
        },
        {
            "product_id": "2",
            "product_sku_id": "2",
            "product_sku_optionchoice_id": "2",
            "name": "Size",
            "choice": "large",
            "option_type": "radio",
            "user_id": "123456",
            "site_id": "987654321"
        }
    ]
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Product SKU</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/skus/{PRODUCT_SKU_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/sku/{PRODUCT_SKU_ID}
{% endif %}
{% endhighlight %}

Updates the given SKU.
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
        <td><code>sku</code></td>
        <td>​A user-facing SKU identifier. Typically a code used to identify this SKU.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>price</code></td>
        <td>​​The full price of this SKU</td>
        <td>decimal</td>
    </tr>
    <tr>
        <td><code>sale_price</code></td>
        <td>​The sale price for this SKU.</td>
        <td>decimal</td>
    </tr>
    <tr>
        <td><code>inventory</code></td>
        <td>​How many of this SKU are currently available.</td>
        <td>integer</td>
    </tr>
    <tr>
        <td><code>weight</code></td>
        <td>The weight of a single SKU. The weight can be used to determine shipping costs at purchase.</td>
        <td>decimal</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "price":"12.99
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site/123456/store/product/12/sku/2 \
-X PATCH \
-d '{
        "price":"12.99
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the SKU are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "current_price": 11.99,
    "product_id": "12",
    "product_sku_id": "2",
    "sku": null,
    "price": 12.99,
    "sale_price": 9.99,
    "inventory": 2,
    "weight": 3,
    "product_type": "physical",
    "download_limit_type": null,
    "download_units_remaining": null,
    "created_date": 1381276147,
    "updated_date": 1484784177,
    "files": [],
    "optionchoices": "optionchoices": [
        {
            "product_id": "2",
            "product_sku_id": "2",
            "product_sku_optionchoice_id": "1",
            "name": "Color",
            "choice": "red",
            "option_type": "color",
            "user_id": "123456",
            "site_id": "987654321"
        },
        {
            "product_id": "2",
            "product_sku_id": "2",
            "product_sku_optionchoice_id": "2",
            "name": "Size",
            "choice": "large",
            "option_type": "radio",
            "user_id": "123456",
            "site_id": "987654321"
        }
    ]
}
{% endhighlight %}
