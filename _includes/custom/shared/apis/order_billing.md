An Order Billing represents information given to a payment provider for an order. For example, it contains the name, billing address, and email that the customer entered as their billing information. An order can have more than one billing when more than one payment method was used. Billings have one or more {% if site.project=="designer" %}<a href="ds_api_order_billing_transaction.html">transactions</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_billing_transaction.html">transactions</a>{% elsif site.project=="platform" %}<a href="pf_api_order_billing_transaction.html">transactions</a>{% endif %} that represent the money paid for the order.

Use the Order Billings API to retrieve payment information like billing address or payment provider for payments against an order.

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
        <td><code>order_billing_id</code></td>
        <td>The unique billing ID (within the order) of the billing.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>gateway</code></td>
        <td>The payment provider used for this billing.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>full_name</code></td>
        <td>Customer's full name.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>Customer's email.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>phone</code></td>
        <td>Customer's phone.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>business_name</code></td>
        <td>Business name of the customer, if used.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>street</code></td>
        <td>Billing street address entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>street2</code></td>
        <td>Second line of billing street address, if used.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>city</code></td>
        <td>Billing city entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>region</code></td>
        <td>Billing state or region entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>country</code></td>
        <td>Billing country entered by customer.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>postal_code</code></td>
        <td>Billing postal code entered by customer</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>transactions</code></td>
        <td>An array of {% if site.project=="designer" %}<a href="ds_api_order_billing_transaction.html">billing transactions</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_billing_transaction.html">billing transactions</a>{% elsif site.project=="platform" %}<a href="pf_api_order_billing_transaction.html">billing transactions</a>{% endif %}.</td>
        <td>array</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the billing was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the billing was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Billings for an Order
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing
{% endif %}
{% endhighlight %}

Returns all billings for the given order. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request returning billings:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/billings \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/billing \
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
        "order_billing_id": 1,
        "full_name": "John Doe"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "456789",
        "order_billing_id": 2,
        "full_name": "John Doe"
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of Billings for an Order
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing/count
{% endif %}
{% endhighlight %}

Returns the number of billings for an order.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/billings/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/billing/count \
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

<h2>{% include label.html content="get" %} Retrieve Details for an Order's Billing
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings/{ORDER_BILLING_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing/{ORDER_BILLING_ID}
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
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/billings/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/billing/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the billing are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "order_id": "456789",
    "order_billing_id": "1",
    "gateway": "Stripe",
    "full_name": "John Doe",
    "email": "johndoe@email.com",
    "phone": "555-555-5555",
    "business_name": null,
    "street": "460 Bryant St.",
    "street2": null,
    "city": "San Francisco",
    "region": "CA",
    "country": "US",
    "postal_code": "94107",
    "created_date": 1443389596,
    "updated_date": 1443389596,
    "transactions": [
        {
            "order_id": "45678",
            "order_billing_id": 1,
            "order_billing_transaction_id": 1,
            "method": "purchase",
            "status": "success",
            "amount": 200,
            "currency": "USD",
            "tx_fee": 0,
            "tx_id": "ch_16pmlkKRCoO7IeaFIw1qsH4p",
            "tx_message": "Transaction approved",
            "cc_type": "Visa",
            "cc_last_4": "4242",
            "user_id": "123456",
            "site_id": "987654321",
            "created_date": 1443389596,
            "updated_date": 1443389596
        }
    ]
}
{% endhighlight %}
