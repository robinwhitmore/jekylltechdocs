Shipment transactions happen when the status of the shipment changes. For example, when a shipment goes from <code>label_created</code> to <code>shipped</code>, a transaction occurs.

​Use the Order Shipment Transactions API to retrieve the shipment transactions for an order.

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
        <td>The unique order ID (within the store) of the {% if site.project=="designer" %}<a href="ds_api_order.html">order</a>{% elsif site.project=="cloud" %}<a href="cl_api_order.html">order</a>{% elsif site.project=="platform" %}<a href="pf_api_order.html">order</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_shipment_id</code></td>
        <td>The unique ID (within the order) of the {% if site.project=="designer" %}<a href="ds_api_order_shipment.html">shipment</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_shipment.html">shipment</a>{% elsif site.project=="platform" %}<a href="pf_api_order_shipment.html">shipent</a>{% endif %}.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>order_shipment_transaction_id</code></td>
        <td>An incrementing ID unique to this shipment.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>tx_id</code></td>
        <td>ID for this transaction</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tx_type</code></td>
        <td>Shipping method (as defined by the <a href="https://hc.weebly.com/hc/en-us/articles/226811948-Set-Up-Shipping-Areas-and-Rates">merchant</a>) used for this transaction, for example <code>UPS</code>.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tx_date</code></td>
        <td>Date the transaction was created.</td>
        <td>​Unix timestamp in GMT</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tx_status</code></td>
        <td>Status for this transaction.<br>
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
        <td><code>created_date</code></td>
        <td>Date the transaction was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the transaction was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Shipment Transactions</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/shipments/{ORDER_SHIPMENT_ID}/transactions

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/shipment/{ORDER_SHIPMENT_ID}/transaction
{% endif %}
{% endhighlight %}

Returns all transactions for the given shipment. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request returning all shipment transactions:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/shipments/1/transactions \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/shipment/1/transaction \
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
        "order_shipment_id": 1,
        "order_shipment_transaction_id": 1
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "456789",
        "order_shipment_id": 1,
        "order_shipment_transaction_id": 2
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "456789",
        "order_shipment_id": 1,
        "order_shipment_transaction_id": 3
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "456789",
        "order_shipment_id": 1,
        "order_shipment_transaction_id": 4
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of Transactions for a Shipment
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/shipments/{ORDER_SHIPMENT_ID}/transactions/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/shipment/{ORDER_SHIPMENT_ID}/transaction/count
{% endif %}
{% endhighlight %}

Returns the number of transactions for a shipment.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/shipments/1/transactions/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/shipment/1/transaction/count \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "count": 4
}
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Shipment Transaction
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/shipments/{ORDER_SHIPMENTS_ID}/transactions/{ORDER_SHIPMENT_TRANSACTION_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/shipment/{ORDER_SHIPMENTS_ID}/transaction/{ORDER_SHIPMENT_TRANSACTION_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given shipment transaction.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/45678/shipments/1/transactions/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/45678/shipment/1/transaction/2 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the shipment transaction are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "order_id": "45678",
    "order_shipment_id": "1",
    "order_shipment_transaction_id": "2",
    "tx_id": "123331",
    "tx_type": "USPS",
    "tx_date": 1443548303,
    "tx_status": "label_returned",
    "created_date": 1443548303,
    "updated_date": 1443548303
}
{% endhighlight %}
