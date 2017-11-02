When customers purchase products from a site's store an [order](https://hc.weebly.com/hc/en-us/articles/227064787-About-Managing-Orders) is created. An order contains order items that represent the products the customer purchased. Orders can have one or more {% if site.project=="designer" %}<a href="ds_api_order_shipment.html">shipments</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_shipment.html">shipments</a>{% elsif site.project=="platform" %}<a href="pf_api_order_shipment.html">shipments</a>{% endif %} and {% if site.project=="designer" %}<a href="ds_api_order_shipment_transaction.html">shipment transactions</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_shipment_transaction.html">shipment transactions</a>{% elsif site.project=="platform" %}<a href="pf_api_order_shipment_transaction.html">shipment transactions</a>{% endif %} that show the charges for shipping. Orders also include {% if site.project=="designer" %}<a href="ds_api_order_billing.html">billings</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_billing.html">billings</a>{% elsif site.project=="platform" %}<a href="pf_api_order_billing.html">billings</a>{% endif %}, which are the payment methods and billing addresses, as well as {% if site.project=="designer" %}<a href="ds_api_order_billing_transaction.html">billing transactions</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_billing_transaction.html">billing transactions</a>{% elsif site.project=="platform" %}<a href="pf_api_order_billing_transaction.html">billing transactions</a>{% endif %} which are the actual charges.

Orders can also be associated with {% if site.project=="designer" %}<a href="ds_api_coupon.html">coupons</a>{% elsif site.project=="cloud" %}<a href="cl_api_coupon.html">coupons</a>{% elsif site.project=="platform" %}<a href="pf_api_coupon.html">coupons</a>{% endif %} and discounts used with the order, as well as notes that the customer may have left for the store owner.

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
        <td><code>order_id</code></td>
        <td>The unique order id (within the store) of the order.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_date</code></td>
        <td>The date that the order was placed.</td>
        <td>Unix timestamp in GMT</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>full_name</code></td>
        <td>​Full name of the person who placed the order, as entered during checkout.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>is_marketing_updates_subscribed</code></td>
        <td>Whether or not the customer of this order elected to receive marketing updates.<br>
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
        <td><code>order_status</code></td>
        <td>The order status.<br> Valid values are:
            <ul>
                <li><code>pending</code></li>
                <li><code>paid</code></li>
                <li><code>shipped</code></li>
                <li><code>cancelled</code></li>
                <li><code>refunded</code></li>
                <li><code>sent</code> (for use with digital products)</li>
                <li><code>returned</code></li>
                <li><code>completed</code> (for use with service products)</li>
            </ul></td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_currency</code></td>
        <td>​Currency used for this order</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_item_tax_total</code></td>
        <td>Total tax charged for all items</td>
        <td>decimal</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_tax_total</code></td>
        <td>​Total tax charged for this order</td>
        <td>decimal</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_tax_rates</code></td>
        <td>An object that breaks down the total_tax for the order into an array of the different tax rates for the order. For example, an order that has both state and local taxes charged on a $100 order might have this:
            <pre>
{
    "total_tax": 8.50,
    "rates": [
        {
            "name": "State",
            "rate": 0.075,
            "amount":7.5
        },
        {
            "name": "City",
            "rate": 0.010,
            "amount": 1.0
        }
     ]
}
</pre>
        </td>
        <td>object</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_shipping_total</code></td>
        <td>​Total amount of shipping charged for this order.</td>
        <td>decimal</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_shipping_taxes_total</code></td>
        <td>​Total amount of tax charged against shipping.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_shipping_subtotal</code></td>
        <td>​Amount of shipping charged before any shipping tax.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_shipping_method</code></td>
        <td>The method used to ship the order. These are defined by the store owner when they configure their <a href="https://hc.weebly.com/hc/en-us/articles/226811488-All-About-Shipping">shipping rates</a>.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_subtotal</code></td>
        <td>Amount of order before taxes and shipping charges.</td>
        <td>decimal</td>
        <td></td>
    </tr>
    <tr>
        <td><code>order_total</code></td>
        <td>​Amount of order, including taxes and shipping charges.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_notes</code></td>
        <td>Notes entered by the customer when the order was placed.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>items</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_order_item.html">order items</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_item.html">order items</a>{% elsif site.project=="platform" %}<a href="pf_api_order_item.html">order items</a>{% endif %}.</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>shipments</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_order_shipment.html">order shipments</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_shipment.html">order shipments</a>{% elsif site.project=="platform" %}<a href="pf_api_order_shipment.html">order shipments</a>{% endif %}</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>billings</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_order_billing.html">order billings</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_billing.html">order billings</a>{% elsif site.project=="platform" %}<a href="pf_api_order_billing.html">order billings</a>{% endif %}</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>coupons</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_coupon.html">coupons</a>{% elsif site.project=="cloud" %}<a href="cl_api_coupon.html">coupons</a>{% elsif site.project=="platform" %}<a href="pf_api_coupon.html">coupons</a>{% endif %}</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the order was created </td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the order was last updated </td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Orders</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order
{% endif %}
{% endhighlight %}

Returns all orders for the given site. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
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
        <td>​​​Value to search the filterby field for.<br>
            You can use the following URL encoded operators with your <code>filterfor</code> parameter:
            <ul>
                <li><code>​<</code>: use <code>%3C</code></li>
                <li><code>></code>: use <code>%3E</code></li>
                <li><code><=</code>: use <code>%3C%3D</code></li>
                <li><code>>=</code>: use <code>%3E%3D</code></li>​
            </ul>
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>sortby</code></td>
        <td>Field name to sort by. You can sort on <code>order_date</code>.</td>
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

<p class="codeTitle">Example CURL request returning all orders:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders?sortby=order_date&sortdir=asc \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order?sortby=order_date&sortdir=asc \
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
        "order_id": "963728582",
        "order_date": 1415061315,
        "full_name": "Jane Doe ",
        "order_status": "pending",
        "order_currency": "USD",
        "order_total": 2
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "989398230",
        "order_date": 1443305684,
        "full_name": "John Smith ",
        "order_status": "shipped",
        "order_currency": "USD",
        "order_total": 4
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "997590262",
        "order_date": 1443389596,
        "full_name": "John Doe ",
        "order_status": "pending",
        "order_currency": "USD",
        "order_total": 6
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of Orders for a Site
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/count
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
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/count \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "count": 9
}
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for an order</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given order.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/997590262 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/997590262 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the order are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "order_id": "997590262",
    "order_date": 1443305684,
    "full_name": "Jane Doe",
    "is_marketing_updates_subscribed": false,
    "order_status": "pending",
    "order_currency": "USD",
    "order_item_tax_total": 8.50,
    "order_tax_total": 8.50,
    "order_tax_rates": {
    "total_tax": 8.50,
    "rates": [
        {
            "name": "State",
            "rate": 0.075,
            "amount":7.5
        },
        {
            "name": "City",
            "rate": 0.010,
            "amount": 1.0
        }
    ]
    },
    "order_shipping_total": 3,
    "order_shipping_taxes_total": 0,
    "order_shipping_subtotal": 3,
    "order_shipping_method": "USPS",
    "order_subtotal": 3,
    "order_total": 6,
    "order_notes": null,
    "created_date": 1442892536,
    "updated_date": 1443548303,
    "items": [
        {
            "discounted_price": 2,
            "track_inventory": true,
            "order_id": "997590262",
            "order_item_id": "1",
            "site_product_id": "2",
            "site_product_sku_id": 2,
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
                    "price": 2,
                    "discount": 0
                }
            ],
            "original_product_url": "http://mystore.weebly.com/store/p2/tshirt.html",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1442892536,
            "updated_date": 1442892536
        },
        {
            "discounted_price": 1,
            "track_inventory": true,
            "order_id": "997590262",
            "order_item_id": "2",
            "site_product_id": "1",
            "site_product_sku_id": 1,
            "name": "Sticker",
            "short_description": "Iron on sticker",
            "quantity": 1,
            "product_type": "physical",
            "download_limit_type": null,
            "download_units_remaining": null,
            "price": 1,
            "sale_price": null,
            "total_price": 1,
            "weight": 1,
            "weight_unit": "lb",
            "sku": " ghjktyu t",
            "options": {
                "color": "rainbow"
            },
            "returned": null,
            "discounts": [],
            "original_product_url": "http://mystore.weebly.com/store/p1/sticker.html",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1443295500,
            "updated_date": 1443295500
        }
    ],
    "shipments": [
        {
            "order_id": "997590262",
            "order_shipment_id": 1,
            "shipping_provider": "USPS",
            "weight": 2,
            "weight_unit": "lb",
            "height": 3,
            "width": 4,
            "depth": 5,
            "full_name": "Jane Doe",
            "email": "jane.doe@email.com",
            "phone": "555-555-5555",
            "business_name": null,
            "street": "460 Bryant St",
            "street2": null,
            "city": "San Francisco",
            "region": "CA",
            "country": "US",
            "postal_code": "94107",
            "shipment_tax_total": 0,
            "shipment_tax_rates": null,
            "price": 3,
            "shipment_total": 3,
            "charge_taxes_on_shipping": false,
            "title": "USPS",
            "shipment_date": null,
            "tracking_number": 123331,
            "status": "shipped",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1443305683,
            "updated_date": 1443547605,
            "transactions": [
                {
                    "order_id": "997590262",
                    "order_shipment_id": 1,
                    "order_shipment_transaction_id": 1,
                    "tx_id": "123331",
                    "tx_type": "USPS",
                    "tx_date": 1443547605,
                    "tx_status": "shipped",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1443547605,
                    "updated_date": 1443547605
                },
                {
                    "order_id": "997590262",
                    "order_shipment_id": 1,
                    "order_shipment_transaction_id": 2,
                    "tx_id": "123331",
                    "tx_type": "USPS",
                    "tx_date": 1443548303,
                    "tx_status": "label_returned",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1443548303,
                    "updated_date": 1443548303
                }
            ]
        }
    ],
    "billings": [
        {
            "order_id": "997590262",
            "order_billing_id": 1,
            "gateway": "Stripe",
            "full_name": "Jim Doe",
            "email": "jim.doe@email.com",
            "phone": null,
            "business_name": null,
            "street": null,
            "street2": null,
            "city": null,
            "region": null,
            "country": null,
            "postal_code": "94107",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1443305683,
            "updated_date": 1443305683,
            "transactions": [
                {
                    "order_id": "997590262",
                    "order_billing_id": 1,
                    "order_billing_transaction_id": 1,
                    "method": "purchase",
                    "status": "success",
                    "amount": 600,
                    "currency": "USD",
                    "tx_fee": 0,
                    "tx_id": "ch_16pQwKKRCoO7IeaF6wfR7gBB",
                    "tx_message": "Transaction approved",
                    "cc_type": "Visa",
                    "cc_last_4": "4242",
                    "user_id": "123456",
                    "site_id": "987654321",
                    "created_date": 1443305683,
                    "updated_date": 1443305684
                }
            ]
        }
    ],
    "coupons": []
}
{% endhighlight %}
