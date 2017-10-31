Store offerings are called [products](https://hc.weebly.com/hc/en-us/articles/227050787-About-Creating-Products-for-Your-Store). Before products can be displayed in a store, they must be created in the site.

There are three different types of products:
* **Physical**: Products that are tangible and are delivered to the customer. These can have shipping fees associated with them.
* **Service**: Products that are not tangible, like landscaping or babysitting.
* **Digital**: Products that are files that the customer downloads. These can have download limits based on time or on the number of downloads.
{% include note.html content="digital products cannot be created using the API." %}

While merchants can always create products, only stores whose sites are on the Starter plan or better can actually sell products. And some plans have restrictions on the quantity and type of products that can be sold. More info on plans {% if site.project=="designer" %}[here](ds_gs_plans.html){%elsif site.project=="cloud" %}[here](cl_gs_plans.html){%elsif site.project=="platform" %}[here](https://www.weebly.com/pricing){%endif%}. ​

<div class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip: </b>Use <code>plan_level</code> on the {% if site.project=="designer" %}<a href="ds_apis_site.html">Site API</a>{% elsif site.project=="cloud" %}<a href="cl_apis_site.html">Site API</a>{% elsif site.project=="platform" %}<a href="pf_apis_site.html">Site API</a>{% endif %} to determine the site's current plan. </div>

Products can be assigned to {% if site.project=="designer" %}[categories](ds_api_category.html){%elsif site.project=="cloud" %}[categories](cl_api_category.html){%elsif site.project=="platform" %}[categories](pf_api_categories.html){%endif%} in order to group similar items together. And like categories, products can have one or more {% if site.project=="designer" %}[images](ds_api_product_image.html){%elsif site.project=="cloud" %}[images](cl_api_product_image.html){%elsif site.project=="platform" %}[images](pf_api_product_images.html){%endif%}images used for display in the store. Products can be taxable (by default they are) and can have a sale price and a regular price.

Products are made up of an array of {% if site.project=="designer" %}[SKUs](ds_api_product_sku.html){%elsif site.project=="cloud" %}[SKUs](cl_api_product_sku.html){%elsif site.project=="platform" %}[SKUs](pf_api_product_sku.html){%endif%}. A SKU is the combination of a {% if site.project=="designer" %}[product option](ds_api_product_option.html){%elsif site.project=="cloud" %}[product option](cl_api_product_option.html){%elsif site.project=="platform" %}[product option](pf_api_product_option.html){%endif%} and a {% if site.project=="designer" %}[product option choice](ds_api_product_option_choice.html){%elsif site.project=="cloud" %}[product option choice](cl_api_product_option_choice.html){%elsif site.project=="platform" %}[product option choice](pf_api_product_option_choice.html){%endif%} (more about how merchants create options in the Weebly UI [here](https://hc.weebly.com/hc/en-us/articles/227067887-Add-Selectable-Options-Like-Size-or-Color-to-a-Physical-Product)). Options are things like `Color` and have an array of option choices, like `red`, `green`, and `blue`. For example, a T-shirt might have the options `Color` and `Size`. The option `Color` might have an array of choices like `red` and `yellow`, while the option `Size` might have choices of `small`, `medium`, and `large`. So one SKU might have the option choices of `red` and `medium`. Another SKU might have `red` and `large` as option choices.

Each SKU can have a different price, a different image, etc. When you create a product, you must provide an array of SKU objects, even if there is only one in the array.

Any changes to products that have more than one option choice must be done at the `Product` level. You can't change an option to add a new choice. You need to change the `product` to add a new `option_choice` and new array of `SKU` objects that includes that new choice. For example, if you wanted to add `yellow` as an option for the T-shirt, you'd need to do a `PUT` with the new `option_choice` of `yellow`, and an array of all the `SKU`s available, which would now be all the size and color combinations, *including* `yellow`. After you update the product with the new SKUs, you can then update choices on the `Product Option` to change the order of the colors, so that maybe yellow comes first.
​
Once created, you can change the individual product SKUs. For example, you might change the price.

Use the Products API to manage the product catalog for a site's store and to change the options and skus available for a product.

Use the following APIs to manage different aspects of a product:
* **{% if site.project=="designer" %}[Product Options](ds_api_product_option.html){%elsif site.project=="cloud" %}[Product Options](cl_api_product_option.html){%elsif site.project=="platform" %}[Product Options](pf_api_product_option.html){%endif%}**: Use view current options (like Size or Color) and to change the order that options are displayed for a product. For example, you might want Size to come before Color.
* **{% if site.project=="designer" %}[Product SKUs](ds_api_product_sku.html){%elsif site.project=="cloud" %}[Product SKUs](cl_api_product_sku.html){%elsif site.project=="platform" %}[Product SKUs](pf_api_product_sku.html){%endif%}**: Use this API to view the current SKUs for a product, and to set prices, inventory, and weight on individual SKUs (like a red T-shirt in size small) when they are different from a parent product.
* **{% if site.project=="designer" %}[Product SKU Option Choices](ds_api_product_option_choice.html){%elsif site.project=="cloud" %}[Product SKU Option Choices](cl_api_product_option_choice.html){%elsif site.project=="platform" %}[Product SKU Option Choices](pf_api_product_option_choice.html){%endif%}**: Use to view the current option choices for a given SKU.
* **{% if site.project=="designer" %}[Product Images](ds_api_product_image.html){%elsif site.project=="cloud" %}[Product Images](cl_api_product_image.html){%elsif site.project=="platform" %}[Product Images](pf_api_product_image.html){%endif%}**: Use to view, create, and delete images used to display the product.

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
        <td><strong>Replaceable</strong></td>
        <td><strong>Changeable</strong></td>
    </tr>
    <tr>
        <td>​<code>user_id</code></td>
        <td>The unique ID of the authenticated user</td>
        <td>string</td>
        <td>X</td>
        <td></td>
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
        <td></td>
    </tr>

    <tr>
        <td><code>url</code></td>
        <td>URL to the product's page in the website, for example:
            ​<code>https://mysite.weebly.com/store/p1/Apples.html</code></td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_id</code></td>
        <td>Unique ID (to this store) for the product.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>Name of the product.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>short_description</code></td>
        <td>Description given to the product.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>published</code></td>
        <td>Whether or not the product is displayed on the published site.<br> 
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>taxable</code></td>
        <td>Whether or not the product is taxable in this store.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td></td>
        <td></td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>price_low</code></td>
        <td>Lowest price for this product based on prices for all SKUs of this product.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>price_high</code></td>
        <td>Highest price for this product based on prices for all SKUs of this product.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>sale_price_low</code></td>
        <td>Lowest sale price for this product based on sale prices for all SKUs of this product.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>sale_price_high</code></td>
        <td>Highest sale price for this product based on sale prices for all SKUs of this product.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>inventory</code></td>
        <td>The cumulative amount of SKUs currently on hand for this product.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>category_ids</code></td>
        <td>IDs for all {% if site.project=="designer" %}<a href="ds_api_category.html">categories</a>{% elsif site.project=="cloud" %}<a href="cl_api_category.html">categories</a>{% elsif site.project=="platform" %}<a href="pf_api_category.html">categories</a>{% endif %} that this product is assigned to.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>coupon_ids</code></td>
        <td>IDs for all {% if site.project=="designer" %}<a href="ds_api_coupon.html">coupons</a>{% elsif site.project=="cloud" %}<a href="cl_api_coupon.html">coupons</a>{% elsif site.project=="platform" %}<a href="pf_api_coupon.html">coupons</a>{% endif %} that currently affect this product.</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>skus</code></td>
        <td>Array of {% if site.project=="designer" %}<a href="ds_api_product_sku.html">SKUs</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_sku.html">SKUs</a>{% elsif site.project=="platform" %}<a href="pf_api_product_sku.html">SKUs</a>{% endif %} for this product. The array includes each possible combination of options and their values.</td>
        <td>array</td>
        <td></td>
        <td>X</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>images</code></td>
        <td>Array of {% if site.project=="designer" %}<a href="ds_api_product_image.html">image</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_image.html">image</a>{% elsif site.project=="platform" %}<a href="pf_api_product_image.html">image</a>{% endif %} objects used to display this product on the site.</td>
        <td>array</td>
        <td>X</td>
        <td></td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>options</code></td>
        <td>Array of Array of {% if site.project=="designer" %}<a href="ds_api_product_option.html">options</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_option.html">options</a>{% elsif site.project=="platform" %}<a href="pf_api_product_option.html">options</a>{% endif %} created for this sku, for example <code>Color</code>, <code>Size</code>.</td>
        <td>array</td>
        <td></td>
        <td></td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the product was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td><br>
        </td>
        <td><br>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the product was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td><br>
        </td>
        <td><br>
        </td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Products for a Store
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product
{% endif %}
{% endhighlight %}

Returns all products for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
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
        <td>Field name to set a filter on.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​​​Value to search the filterby field for.<br>
            You can use the following URL encoded operators with your <code>filterfor</code> parameter:
            <ul>
                <li><code>​<</code>: use <code>%3C</code></li>
                <li><code>></code>: use <code>%3E</code></li>
                <li><code><=</code>: use <code>%3C%3D</code></li>
                <li><code>>=</code>: use <code>%3E%3D</code></li>
                ​
            </ul>
        </td>
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

<p class="codeTitle">Example CURL request returning all products:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products?filterby=price_low&filterfor=%3 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product?filterby=price_low&filterfor=%3 \
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
        "url": "https://987654321.weebly.com/store/p1/Apples.html",
        "product_id": "1",
        "name": "Apples",
        "published": true,
        "price_low": 1,
        "price_high": 1,
        "sale_price_low": null,
        "sale_price_high": null,
        "inventory": 1,
        "available": true,
        "images": [
            {
                "url": "http://mystore.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p1_i1_w5184.jpeg",
                "product_id": "1",
                "product_image_id": 1,
                "user_id": "123456",
                "site_id": "987654321",
            },
            {
                "url": "http://mystore.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p1_i2_w3839.jpeg",
                "product_id": "1",
                "product_image_id": 2,
                "user_id": "123456",
                "site_id": "987654321",
            }
        ]
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "url": "https://mystore.weebly.com/store/p2/Asparagus.html",
        "product_id": "2",
        "name": "Asparagus",
        "published": true,
        "price_low": 1,
        "price_high": 1,
        "sale_price_low": null,
        "sale_price_high": null,
        "inventory": null,
        "available": true,
        "images": [
            {
                "url": "http://mystore.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p2_i1_w3840.jpeg",
                "product_id": "2",
                "product_image_id": 1,
                "user_id": "123456",
                "site_id": "987654321",
            },
            {
                "url": "http://mystore.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p2_i2_w1706.jpeg",
                "product_id": "2",
                "product_image_id": 2,
                "user_id": "123456",
                "site_id": "987654321",
            }
        ]
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "url": "https://mystore.weebly.com/store/p3/Beans.html",
        "product_id": "3",
        "name": "Beans",
        "published": true,
        "price_low": 1,
        "price_high": 1,
        "sale_price_low": null,
        "sale_price_high": null,
        "inventory": null,
        "available": true,
        "images": [
            {
                "url": "http://mystore.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p3_i1_w2509.jpeg",
                "product_id": "3",
                "product_image_id": 1,
                "user_id": "123456",
                "site_id": "987654321",
            }
        ]
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Number of Products for a Store
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/count
{% endif %}
{% endhighlight %}

Returns the number of products in the store.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/count \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "count": 25
}
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Product
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given product.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/32 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/32 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the product are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "url": "https://mystore.weebly.com/store/p32/tshirt.html",
    "product_id": "32",
    "name": "tshirt",
    "short_description": "100% Cotton TShirt",
    "published": true,
    "taxable": true,
    "price_low": 10.99,
    "price_high": 10.99,
    "sale_price_low": null,
    "sale_price_high": null,
    "inventory": 12,
    "available": true,
    "category_ids": [
        "9"
    ],
    "coupon_ids": [
        "3"
    ],
    "created_date": 1445624825,
    "updated_date": 1476384556,
    "skus": [
        {
            "current_price": 10.99,
            "product_id": "32",
            "product_sku_id": "1",
            "sku": "123456",
            "price": 10.99,
            "sale_price": null,
            "inventory": 5,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1445624825,
            "updated_date": 1476384555,
            "files": [],
            "optionchoices": [
                {
                    "product_id": "32",
                    "product_sku_id": "1",
                    "product_sku_optionchoice_id": "1",
                    "name": "Color",
                    "choice": "Red",
                    "option_type": "color",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1445640819,
                    "updated_date": 1463002999
                },
                {
                    "product_id": "32",
                    "product_sku_id": "1",
                    "product_sku_optionchoice_id": "2",
                    "name": "Size",
                    "choice": "small",
                    "option_type": "radio",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1476384555,
                    "updated_date": 1476384555
                }
            ]
        },
        {
            "current_price": 10.99,
            "product_id": "32",
            "product_sku_id": "2",
            "sku": "67890",
            "price": 10.99,
            "sale_price": null,
            "inventory": 5,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1445640819,
            "updated_date": 1476384555,
            "files": [],
            "optionchoices": [
                {
                    "product_id": "32",
                    "product_sku_id": "2",
                    "product_sku_optionchoice_id": "1",
                    "name": "Color",
                    "choice": "red",
                    "option_type": "color",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1445640819,
                    "updated_date": 1463002999
                },
                {
                    "product_id": "32",
                    "product_sku_id": "2",
                    "product_sku_optionchoice_id": "2",
                    "name": "Size",
                    "choice": "large",
                    "option_type": "radio",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1476384555,
                    "updated_date": 1476384555
                }
            ]
        },
    "images": [
        {
            "url": "http://mystore.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p32_i2_w3096.jpeg",
            "product_id": "32",
            "product_image_id": 2,
            "width": "3096",
            "height": "4128",
            "format": "jpeg",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1445640702,
            "updated_date": 1445640702
        }
    ],
    "options": [
        {
            "product_id": "32",
            "product_option_id": 1,
            "name": "Color",
            "renderer": "color",
            "choice_order": [
                "Red"
            ],
            "required": false,
            "max_length": false,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1445640819,
            "updated_date": 1445640877
        },
        {
            "product_id": "32",
            "product_option_id": 2,
            "name": "Size",
            "renderer": "radio",
            "choice_order": [
                "Small",
                "Large"
            ],
            "required": false,
            "max_length": false,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1476384556,
            "updated_date": 1476384556
        }
    ]
}
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">post</span> Create a Product</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/store/products

{% else %}
POST /user/USER_ID/site/{SITE_ID}/store/product
{% endif %}
{% endhighlight %}

Creates a product for the given store.
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
        <td>Name of the product.</td>
        <td>string</td>
        <td>
            Required
        </td>
    </tr>
    <tr>
        <td><code>short_description</code></td>
        <td>Description given to the product.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>skus</code></td>
        <td>Array of {% if site.project=="designer" %}<a href="ds_api_product_sku.html">SKUs</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_sku.html">SKUs</a>{% elsif site.project=="platform" %}<a href="pf_api_product_sku.html">SKUs</a>{% endif %} for this product. The array includes each possible combination of options and their values.</td>
        <td>array</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>images</code></td>
        <td>Array of {% if site.project=="designer" %}<a href="ds_api_product_image.html">image</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_image.html">image</a>{% elsif site.project=="platform" %}<a href="pf_api_product_image.html">image</a>{% endif %} objects used to display this product on the site.</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>options</code></td>
        <td>Array of Array of {% if site.project=="designer" %}<a href="ds_api_product_option.html">options</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_option.html">options</a>{% elsif site.project=="platform" %}<a href="pf_api_product_option.html">options</a>{% endif %} created for this sku, for example <code>Color</code>, <code>Size</code>.</td>
        <td>array</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/store/products \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "My Product",
            "skus": [
                {
                    "price": 9.99,
                    "product_type": "physical"
                }
            ]
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product \
-X POST \
-d '{
        "name": "My Product",
        "skus": [
            {
                "price": 9.99,
                "product_type": "physical"
            }
        ]
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
    "url": "https://mystore.weebly.com/store/p68/My_Product.html",
    "product_id": "68",
    "name": "My Product",
    "short_description": null,
    "published": true,
    "taxable": true,
    "price_low": 9.99,
    "price_high": 9.99,
    "sale_price_low": null,
    "sale_price_high": null,
    "inventory": null,
    "available": true,
    "category_ids": [],
    "coupon_ids": [],
    "created_date": 1476402086,
    "updated_date": 1476402086,
    "skus": [
        {
            "current_price": 9.99,
            "product_id": "68",
            "product_sku_id": "1",
            "sku": null,
            "price": 9.99,
            "sale_price": null,
            "inventory": null,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1476402086,
            "updated_date": 1476402086,
            "files": [],
            "optionchoices": []
        }
    ],
    "images": [],
    "options": []
}
{% endhighlight %}

### Request to create a product with options
This example shows how to create a product with two options - `Color` with one choice of `Red`, and `Size` with two choices, `Small` and `Large`. One SKU is created - a tshirt in red and small.
<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/ \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"' \
--data '{
            "name": "Newest Product with options",
            "options": [
                {
                    "name": "Color",
                    "renderer": "color",
                    "choice_order": [
                    "Red"]
                },
                {
                    "name": "Size",
                    "renderer": "radio",
                    "choice_order": [
                        "Small",
                        "Large"
                    ]

                }
            ],
            "skus": [
                {
                    "price": 10.99,
                    "product_type": "physical",
                    "optionchoices": [
                        {
                            "name": "Color",
                            "choice": "Red",
                            "option_type": "color"
                        },
                        {
                            "name": "Size",
                            "choice": "Small",
                            "option_type": "radio"
                        }
                    ]
                }
            ]
        }'
{% elsif site.project=="cloud" or "designer" %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product \
-X POST \
-d '{
        "name": "Newest Product with options",
        "options": [
            {
                "name": "Color",
                "renderer": "color",
                "choice_order": [
                    "Red"
                ]
            },
            {
                "name": "Size",
                "renderer": "radio",
                "choice_order": [
                    "Small",
                    "Large"
                ]
            }
        ],
        "skus": [
            {
                "price": 10.99,
                "product_type": "physical",
                "optionchoices": [
                    {
                        "name": "Color",
                        "choice": "Red",
                        "option_type": "color"
                    },
                    {
                        "name": "Size",
                        "choice": "Small",
                        "option_type": "radio"
                    }
                ]
            }
        ]
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<h2><span class="label label-put text-uppercase">put</span> Replace (Copy) a Product</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PUT /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}

{% else %}
PUT /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}
{% endif %}
{% endhighlight %}

Replaces the given product. Use this to copy an existing product by replacing the product_id and updating other fields. Any fields not sent will be copied from the product used in the request.

Also use this endpoint to add/change/delete the SKUs for a product. For example, if you wanted to add the color option of yellow to a product, you'd use PUT to add the option choice of yellow and replace skus with all the available options, including yellow. You can then use the PATCH endpoint from the Product Options API to change the order.

{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
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
        <td>Name of the product.</td>
        <td>string</td>
        <td>
            Required
        </td>
    </tr>
    <tr>
        <td><code>short_description</code></td>
        <td>Description given to the product.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>published</code></td>
        <td>Whether or not the product is displayed on the published site.<br>
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
        <td><code>taxable</code></td>
        <td>Whether or not the product is taxable in this store.<br>
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
        <td><code>skus</code></td>
        <td>Array of {% if site.project=="designer" %}<a href="ds_api_product_sku.html">SKUs</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_sku.html">SKUs</a>{% elsif site.project=="platform" %}<a href="pf_api_product_sku.html">SKUs</a>{% endif %} for this product. The array includes each possible combination of options and their values.</td>
        <td>array</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>images</code></td>
        <td>Array of {% if site.project=="designer" %}<a href="ds_api_product_image.html">image</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_image.html">image</a>{% elsif site.project=="platform" %}<a href="pf_api_product_image.html">image</a>{% endif %} objects used to display this product on the site.</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>options</code></td>
        <td>Array of Array of {% if site.project=="designer" %}<a href="ds_api_product_option.html">options</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_option.html">options</a>{% elsif site.project=="platform" %}<a href="pf_api_product_option.html">options</a>{% endif %} created for this sku, for example <code>Color</code>, <code>Size</code>.</td>
        <td>array</td>
        <td>Required if product includes options.</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PUT \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/68 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "My Copied Product",
            "product_id": "100",
            "skus": [
                {
                    "price": 9.99,
                    "product_type": "physical",
                }
            ]
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/68 \
-X PUT \
-d '{
        "name": "My Copied Product",
        "product_id": "100",
        "skus": [
            {
                "price": 9.99,
                "product_type": "physical",
            }
        ]
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
    "url": "https://mystore.weebly.com/store/p100/My_Copied_Product.html",
    "product_id": "100",
    "name": "My Copied Product",
    "short_description": null,
    "published": true,
    "taxable": false,
    "price_low": 9.99,
    "price_high": 9.99,
    "sale_price_low": null,
    "sale_price_high": null,
    "inventory": null,
    "available": true,
    "category_ids": [
        "10"
    ],
    "coupon_ids": [],
    "created_date": 1445559772,
    "updated_date": 1445559793,
    "skus": [
        {
            "current_price": 9.99,
            "product_id": "100",
            "product_sku_id": "1",
            "sku": null,
            "price": 9.9,
            "sale_price": null,
            "inventory": null,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1445559772,
            "updated_date": 1463002993,
            "files": [],
            "optionchoices": []
        }
    ],
    "images": [
        {
            "url": "http://821263702103547270.weebly.com/uploads/5/4/9/1/54914441/s242778913223969860_p3_i1_w2509.jpeg",
            "product_id": "100",
            "product_image_id": 1,
            "width": "2509",
            "height": "1673",
            "format": "jpeg",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1445559780,
            "updated_date": 1445559780
        }
    ],
    "options": []
}
{% endhighlight %}

### Example request to add options to a product

This request shows adding the option choice of `Yellow` for `Color` and adding a new sku that has the option choice of `Yellow` for `Color` and `Small` for `Size`. Note that the existing SKU of Red and Small still needs to be sent in the request.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PUT \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/68 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name": "Newest Product with options",
            "options": [
                {
                    "name": "Color",
                    "renderer": "color",
                    "choice_order": [
                        "red",
                        "yellow"
                    ]
                },
                {
                    "name": "Size",
                    "renderer": "radio",
                    "choice_order": [
                        "Small",
                        "Large"
                    ]
                }
            ],
            "skus": [
                {
                    "price": 10.99,
                    "product_type": "physical",
                    "optionchoices": [
                        {
                            "name": "Color",
                            "choice": "red",
                            "option_type": "color"
                        },
                        {
                            "name": "Size",
                            "choice": "small",
                            "option_type": "radio"
                        }
                    ]
                },
                {
                    "price": 10.99,
                    "product_type": "physical",
                    "optionchoices": [
                        {
                            "name": "Color",
                            "choice": "yellow",
                            "option_type": "color"
                        },
                        {
                            "name": "Size",
                            "choice": "small",
                            "option_type": "radio"
                        }
                    ]
                }
            ]
    }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/68 \
-X PUT \
-d '{
        "name": "Newest Product with options",
        "options": [
            {
                "name": "Color",
                "renderer": "color",
                "choice_order": [
                    "red",
                    "yellow"
                ]
            },
            {
                "name": "Size",
                "renderer": "radio",
                "choice_order": [
                    "Small",
                    "Large"
                ]
            }
        ],
        "skus": [
            {
                "price": 10.99,
                "product_type": "physical",
                "optionchoices": [
                    {
                        "name": "Color",
                        "choice": "red",
                        "option_type": "color"
                    },
                    {
                        "name": "Size",
                        "choice": "small",
                        "option_type": "radio"
                    }
                ]
            },
            {
                "price": 10.99,
                "product_type": "physical",
                "optionchoices": [
                    {
                        "name": "Color",
                        "choice": "yellow",
                        "option_type": "color"
                    },
                    {
                        "name": "Size",
                        "choice": "small",
                        "option_type": "radio"
                    }
                ]
            }
        ]
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
    "url": "https://mystore.weebly.com/store/p21/Newest_Product_with_options.html",
    "product_id": "21",
    "name": "Newest Product with options",
    "short_description": null,
    "published": true,
    "taxable": true,
    "price_low": 10.99,
    "price_high": 10.99,
    "sale_price_low": null,
    "sale_price_high": null,
    "inventory": null,
    "category_ids": [],
    "coupon_ids": [],
    "created_date": 1490633793,
    "updated_date": 1490635265,
    "skus": [
        {
            "current_price": 10.99,
            "product_id": "21",
            "product_sku_id": "2",
            "sku": null,
            "price": 10.99,
            "sale_price": null,
            "inventory": null,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1490635265,
            "updated_date": 1490635265,
            "files": [],
            "optionchoices": [
                {
                    "product_id": "21",
                    "product_sku_id": "2",
                    "product_sku_optionchoice_id": "1",
                    "name": "Color",
                    "choice": "red",
                    "option_type": "color",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1490635265,
                    "updated_date": 1490635265
                },
                {
                    "product_id": "21",
                    "product_sku_id": "2",
                    "product_sku_optionchoice_id": "2",
                    "name": "Size",
                    "choice": "small",
                    "option_type": "radio",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1490635265,
                    "updated_date": 1490635265
                }
            ]
        },
        {
            "current_price": 10.99,
            "product_id": "21",
            "product_sku_id": "3",
            "sku": null,
            "price": 10.99,
            "sale_price": null,
            "inventory": null,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1490635265,
            "updated_date": 1490635265,
            "files": [],
            "optionchoices": [
                {
                    "product_id": "21",
                    "product_sku_id": "3",
                    "product_sku_optionchoice_id": "1",
                    "name": "Color",
                    "choice": "yellow",
                    "option_type": "color",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1490635265,
                    "updated_date": 1490635265
                },
                {
                    "product_id": "21",
                    "product_sku_id": "3",
                    "product_sku_optionchoice_id": "2",
                    "name": "Size",
                    "choice": "small",
                    "option_type": "radio",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1490635265,
                    "updated_date": 1490635265
                }
            ]
        }
    ],
    "images": [],
    "options": [],
    "available": true
}
{% endhighlight %}

<h2><span class="label label-patch text-uppercase">patch</span> Update a Product</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}
{% endif %}
{% endhighlight %}

Updates the given product.
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
        <td>Name of the product.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>short_description</code></td>
        <td>Description given to the product.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>published</code></td>
        <td>Whether or not the product is displayed on the published site.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
    </tr>
</table>

If you want to add/change/delete the SKUs for a product, use the `PUT` endpoint instead. For example, if you wanted to add the `color` option of `yellow` to a product, you'd use `PUT` and replace `sku` with all the available options, including `yellow`. You can then use the `PATCH` endpoint from the {% if site.project=="designer" %}[Product Options API](ds_api_product_option.html){%elsif site.project=="cloud" %}[Product Options API](cl_api_product_option.html){%elsif site.project=="platform" %}[Product Options API](pf_api_product_option.html){%endif%} to change the order.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/64 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "name":"My Updated Product"
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site/123456/product/64 \
-X PATCH \
-d '{
        "name":"My Updated Product"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the product are returned.
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "url": "https://mysite.weebly.com/store/p64/My_Updated_Product.html",
    "product_id": "64",
    "name": "My Updated Product",
    "short_description": "This is a great product!",
    "published": true,
    "taxable": true,
    "price_low": 12.99,
    "price_high": 12.99,
    "sale_price_low": null,
    "sale_price_high": null,
    "inventory": 12,
    "available": true,
    "category_ids": [
        "1",
        "5"
    ],
    "coupon_ids": [],
    "created_date": 1472521895,
    "updated_date": 1476406470,
    "skus": [
        {
            "current_price": 12.99,
            "product_id": "64",
            "product_sku_id": "2",
            "sku": null,
            "price": 12.99,
            "sale_price": null,
            "inventory": 12,
            "weight": null,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1476405065,
            "updated_date": 1476405065,
            "files": [],
            "optionchoices": []
        }
    ],
    "images": [],
    "options": []
}
{% endhighlight %}

<h2><span class="label label-delete text-uppercase">delete</span> Delete a Product</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}
{% endif %}
{% endhighlight %}

Deletes the given product.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/64 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/64 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**

There is no response to a delete request.