Order shipments hold information about how the the order was shipped, including shipping address, weight, box size, shipping provider, and status. Orders can have more than one shipment.
​
Use the Order Shipment API to retrieve information about the shipment for an order.

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
        <td>​The unique order ID (within the store) of the {% if site.project=="designer" %}<a href="ds_api_order.html">order</a>{% elsif site.project=="cloud" %}<a href="cl_api_order.html">order</a>{% elsif site.project=="platform" %}<a href="pf_api_order.html">order</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_shipment_id</code></td>
        <td>The unique shipment ID (within the order) for this shipment.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>shipping_provider</code></td>
        <td>Company used for this shipment.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>weight</code></td>
        <td>Weight of the box</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>weight_unit</code></td>
        <td>The weight unit used for this order (kg or lb).<br>
            Valid values are:
            <ul>
                <li><code>lb</code></li>
                <li><code>kg</code></li>
            </ul>
            If not set, defaults to the store's weight unit.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>height</code></td>
        <td>Height of the box.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>width</code></td>
        <td>Width of the box</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>depth</code></td>
        <td>Depth of the box.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>full_name</code></td>
        <td>Full name of the addressee.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>Email of the addressee.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>phone</code></td>
        <td>Phone number of the addressee.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>business_name</code></td>
        <td>Business name of the addressee, if used.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>street</code></td>
        <td>Shipping street address entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>street2</code></td>
        <td>Second line of shipping street address, if used.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>city</code></td>
        <td>Shipping city entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>region</code></td>
        <td>Shipping state or region entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>country</code></td>
        <td>Shipping country entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>postal_code</code></td>
        <td>Shipping postal code entered by customer</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>shipment_tax_total</code></td>
        <td>Total amount of tax charged against the shipping amount.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>shipment_tax_rates</code></td>
        <td>Rate of tax charged against the shipping amount.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>price</code></td>
        <td>​Amount charged for shipping</td>
        <td>decimal</td>
        <td></td>
    </tr>
    <tr>
        <td><code>shipment_total</code></td>
        <td>Amount charged for shipping including any tax</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>charges_taxes_on_shipping</code></td>
        <td>Whether or not this store charges tax on shipping.<br>
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
        <td><code>title</code></td>
        <td>Shipping method used for this box, for example "UPS" or "DHL"</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>shipment_date</code></td>
        <td>Date this box was shipped. Returns null if <code>status</code> is not <code>shipped</code>.</td>
        <td>​Unix timestamp in GMT</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tracking_number</code></td>
        <td>Shipping provider's tracking number</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>status</code></td>
        <td>Status for this shipment.<br>
            Valid values are:
            <ul>
                <li><code>label_created</code></li>
                <li><code>label_returned</code></li>
                <li><code>shipped</code></li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>transactions</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_order_shipment_transaction.html">Shipment Transactions</a>{% elsif site.project=="cloud" %}<a href="ds_api_order_shipment_transaction.html">Shipment Transaction</a>{% elsif site.project=="platform" %}<a href="pf_api_order_shipment_transaction.html">Shipment Transaction</a>{% endif %} objects.</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the shipment was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the shipment was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Shipments for an Order
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/shipments

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/shipment
{% endif %}
{% endhighlight %}

Returns all shipments for the given order. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request returning billings:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/shipments \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/shipment \
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
        "order_id": "456789",
        "order_shipment_id": 1
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "456789",
        "order_shipment_id": 2
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of Shipments for an Order
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/shipments/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/shipment/count
{% endif %}
{% endhighlight %}

Returns the number of shipments for an order.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/shipments/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/shipment/count \
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

<h2>{% include label.html content="get" %} Retrieve Details for an Order's Shipment
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings/{ORDER_SHIPMENT_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing/{ORDER_SHIPMENT_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given billing.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/shipments/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/shipment/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the shipment are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "order_id": "456789",
    "order_shipment_id": "1",
    "shipping_provider": "UPS",
    "weight": 2,
    "weight_unit": "lb",
    "height": 3,
    "width": 4,
    "depth": 5,
    "full_name": "John Doe",
    "email": "johndoe@email.com",
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
    "title": "UPS",
    "shipment_date": 1442891179,
    "tracking_number": 123331,
    "status": "shipped",
    "created_date": 1443305683,
    "updated_date": 1443547605,
    "transactions": [
        {
            "order_id": "456789",
            "order_shipment_id": 1,
            "order_shipment_transaction_id": 1,
            "tx_id": "123331",
            "tx_type": "UPS",
            "tx_date": 1443547605,
            "tx_status": "shipped",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1443547605,
            "updated_date": 1443547605
        },
        {
            "order_id": "456789",
            "order_shipment_id": 1,
            "order_shipment_transaction_id": 2,
            "tx_id": "123331",
            "tx_type": "UPS",
            "tx_date": 1443548303,
            "tx_status": "shipped",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1443548303,
            "updated_date": 1443548303
        }
    ]
}
{% endhighlight %}
