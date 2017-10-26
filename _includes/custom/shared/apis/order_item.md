The products that a customer purchases from a site's store are called order items. All order items have an associated order and an associated SKU, which represents the version of the product purchased.

Use the Order Item API to retrieve information about order items from a given order.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API and those that are returned when you retrieve a list. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
    </tr>
    <tr>
        <td>​<code>user_id</code></td>
        <td>The unique ID of the authenticated user</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td>X</td>
    </tr>

    <tr>
        <td><code>discounted_price</code></td>
        <td>Price after any discounts have been applied</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>track_inventory</code></td>
        <td>Whether or not the product is configured to keep track of inventory.<br>
            Valid values are:
           <ul> 
               <li><code>true</code></li>
            <li><code>false</code></li>
           </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_id</code></td>
        <td>Unique ID for the {% if site.project=="designer" %}<a href="ds_api_order.html">order</a>{% elsif site.project=="cloud" %}<a href="cl_api_order.html">order</a>{% elsif site.project=="platform" %}<a href="pf_api_order.html">order</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_item_id</code></td>
        <td>Unique ID (to this order) for the item</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>site_product_id</code></td>
        <td>The {% if site.project=="designer" %}<a href="ds_api_product.html">product ID</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">product ID</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product ID</a>{% endif %} this order item is associated with.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>site_product_sku_id</code></td>
        <td>The {% if site.project=="designer" %}<a href="ds_api_product_sku.html">SKU ID</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_sku.html">SKU ID</a>{% elsif site.project=="platform" %}<a href="pf_api_product_sku.html">SKU ID</a>{% endif %} this order item is associated with.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>The name of the item, taken from the product.</td>
        <td>string</td>
        <td>X</td>
    </tr>

    <tr>
        <td><code>short_description</code></td>
        <td>The description for the item, taken from the product.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>quantity</code></td>
        <td>The amount of this item in the order.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_type</code></td>
        <td>The type of this product, taken from the SKU.<br> Valid values are:
            <ul>
                <li><code>physical</code></li>
            <li><code>digital</code></li>
            <li><code>service</code></li>
            </ul>
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>download_limit_type</code></td>
        <td>The download limit if the SKU associated with this item is a digital good. It can be restricted by either the amount available for download or by a number of days the download is available for.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>download_units_remaining</code></td>
        <td>​The number of downloads available. Either a number of downloads or number of days, based on the <code>download_limit_type</code>.
        </td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>price</code></td>
        <td>The full price of this item.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>sale_price</code></td>
        <td>The sale price of this item.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>total_price</code></td>
        <td>The total price for all of these items (<code>price * quantit</code>y)</td>
        <td>decimal</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>weight</code></td>
        <td>Weight of the item.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>weight_unit</code></td>
        <td>Unit of measure used by the store for this item.<br>
            Valid values are:
            <<ul>
                <li><code>lb</code></li>
                <li><code>kg</code></li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>sku</code></td>
        <td>​A user-facing SKU identifier. Typically a code used to identify this SKU.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>options</code></td>
        <td>{% if site.project=="designer" %}<a href="ds_api_product_option.html">Option(s)</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_option.html">Option(s)</a>{% elsif site.project=="platform" %}<a href="pf_api_product_option.html">Option(s)</a>{% endif %} for this order item. For example, the color green, the size medium, or both if it's green and medium. If more than one option is present, and array of option objects is returned.</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>returned</code></td>
        <td>Whether or not the order item has been returned.<br>
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
        <td><code>discounts</code></td>
        <td>An array of discount objects. A discount happens when a product is purchased with a sale price or a coupon is used on an order. Discount objects include the following:
            <ul>
                <li><code>discount_type</code> with values of:
                    ​<ul>
                        <li><code>markdown</code>: the sale price</li>
                        <li><code>coupon</code>: a coupon (other than free shipping)</li>
                        <li><code>shipping</code>: a free shipping coupon</li>
                    </ul></li>
            <li><code>discount</code>: the amount saved</li>
                <li><code>price</code>: the amount charged</li>
            </ul>

        </td>
        <td>array</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>original_product_url</code></td>
        <td>URL for the associated product on the published site.</td>
        <td>array</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the order item was created. </td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the order item was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Order Items
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/items

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/item
{% endif %}
{% endhighlight %}

Returns all order items for the given order. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request returning all order items:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/123456/items \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/123456/item \
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
        "discounted_price": 8,
        "track_inventory": true,
        "order_id": "123456",
        "order_item_id": "1",
        "site_product_id": "2",
        "site_product_sku_id": "2",
        "name": "T-shirt",
        "short_description": "100% Cotton",
        "quantity": 1,
        "product_type": "physical",
        "price": 10,
        "sale_price": 8,
        "total_price": 8,
        "sku": null,
        "discounts": [
            {
                "discount_type": "markdown",
                "price": 8,
                "discount": 2
            }
        ],
        "original_product_url": "http://mystore.weebly.com/store/p2/tshirt.html"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "discounted_price": 0,
        "track_inventory": true,
        "order_id": "123456",
        "order_item_id": "2",
        "site_product_id": "1",
        "site_product_sku_id": "1",
        "name": "Sticker",
        "short_description": "Iron on sticker",
        "quantity": 1,
        "product_type": "physical",
        "price": 1,
        "sale_price": null,
        "total_price": 1,
        "sku": " ghjktyu t",
        "discounts": [],
        "original_product_url": "http://mystore.weebly.com/store/p1/sticker.html"
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Number of Order Items for an Order
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/items/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/item/count
{% endif %}
{% endhighlight %}

Returns the number of non-deleted orders.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/123456/items/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/123456/item/count \
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

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for an Order Item
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/items/{ORDER_ITEM_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/item/{ORDER_ITEM_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given order item.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/123456/items/1 \ \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/123456/item/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the order item are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "discounted_price": 8,
    "track_inventory": true,
    "order_id": "123456",
    "order_item_id": "1",
    "site_product_id": "2",
    "site_product_sku_id": "2",
    "name": "T-shirt",
    "short_description": "100% Cotton",
    "quantity": 1,
    "product_type": "physical",
    "download_limit_type": null,
    "download_units_remaining": null,
    "price": 10,
    "sale_price": 8,
    "total_price": 8,
    "weight": 1,
    "weight_unit": "lb",
    "sku": null,
    "options": {
        "Color": "red",
        "Size": "small"
    },
    "returned": null,
    "discounts": [
        {
            "discount_type": "markdown",
            "price": 8,
            "discount": 2
        }
    ],
    "original_product_url": "http://mystore.weebly.com/store/p2/tshirt.html",
    "created_date": 1442892536,
    "updated_date": 1442892536
}
{% endhighlight %}
