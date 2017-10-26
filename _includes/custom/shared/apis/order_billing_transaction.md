An order billing transaction is created when a transaction was sent to a payment provider. A transaction holds information about the actual payment, while a billing holds information about the billing address. A billing can have one to many transactions. For example, if an order was paid for with two different credit cards, there would be two transactions.

​Use the Order Billing Transactions API to retrieve information about the payment of orders, like the amount, payment processor, currency, credit card, and status.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}

<h2>Fields</h2>

<p>The following table shows all fields that exist for this API and those that are returned when you retrieve a list. All fields are returned when you retrieve a single item.</p>

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
    <td>The unique billing ID (within the order) of the {% if site.project=="designer" %}<a href="ds_api_order_billing.html">billing</a>{% elsif site.project=="cloud" %}<a href="cl_api_order_billing.html">billing</a>{% elsif site.project=="platform" %}<a href="pf_api_order_billing.html">billing</a>{% endif %}.</td>
<td>integer</td>
<td>X</td>
</tr>
    <tr>
        <td><code>order_billing_transaction_id</code></td>
        <td>​The unique transaction ID (within the billing) of the transaction.</td>
        <td>integer</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>method</code></td>
        <td>Type of billing transaction. <br>Valid values are:
            <ul>
            <li><code>purchase</code>: order was purchased</li>
            <li><code>void</code>: order was cancelled</li>
            <li><code>refund</code>: order was returned and refunded</li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>status</code></td>
        <td>Status of the transaction.<br>
            Valid values are:
           <ul>
               <li><code>success</code></li>
            <li><code>failure</code></li>
            <li><code>note</code>: The transaction required manual intervention by the merchant.</li>
           </ul>
        </td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>amount</code></td>
        <td>Amount of this transaction.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>currency</code></td>
        <td>Currency used for this transaction.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tx_fee</code></td>
        <td>Any fee charged for this transaction.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tx_id</code></td>
        <td>An external ID for the transaction, often provided by the payment processor.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>tx_message</code></td>
        <td>Message sent from the payment provider associated with this transaction.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>cc_type</code></td>
        <td>Type of credit card used for this transaction.<br>
            Valid values are:
            <ul>
                <li><code>American Express</code></li>
            <li><code>Visa</code></li>
            <li><code>Mastercard</code></li>
            <li><code>Discover</code></li>
            <li><code>PayPal</code></li>
            <li><code>Diners Club</code></li>
            <li><code>JCB</code></li>
            </ul>
            ​Returns <code>false</code> if a credit card was not used.​</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>cc_last_4</code></td>
        <td>Last four digits of the credit card used for this transaction. Returns <code>false</code> if a credit card was not used.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the transaction was created</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the transaction was last updated </td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>

{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Billing Transactions</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings/{ORDER_BILLING_ID}/transactions

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing/{ORDER_BILLING_ID}/transaction
{% endif %}
{% endhighlight %}

Returns all transactions for the given {% if site.project=="designer" %}[billing](ds_api_order_billing.html){%elsif site.project=="cloud" %}[billing](cl_api_order_billing.html){%elsif site.project=="platform" %}[billing](pf_api_order_billing.html){%endif%}. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}


<p class="codeTitle">Example CURL request returning all transactions:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/billings/1/transactions \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/billing/1/transaction \
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
        "order_billing_transaction_id": 1
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "order_id": "456789",
        "order_billing_id": 1,
        "order_billing_transaction_id": 2
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Number of Transactions for a Billing</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings/{ORDER_BILLING_ID}/transactions/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing/{ORDER_BILLING_ID}/transaction/count
{% endif %}
{% endhighlight %}

Returns the number of transactions for a billing.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/billings/1/transactions/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/billing/1/transaction/count \
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

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Billing Transaction
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/orders/{ORDER_ID}/billings/{ORDER_BILLING_ID}/transactions/{ORDER_BILLING_TRANSACTION_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/order/{ORDER_ID}/billing/{ORDER_BILLING_ID}/transaction/{ORDER_BILLING_TRANSACTION_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given transaction.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-orders`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/orders/456789/billings/1/transactions/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/order/456789/billing/1/transaction/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the transaction are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "order_id": "456789",
    "order_billing_id": "1",
    "order_billing_transaction_id": "1",
    "method": "purchase",
    "status": "success",
    "amount": 700,
    "currency": "USD",
    "tx_fee": 0,
    "tx_id": "ch_16pmkuKRCoO7IeaFWfKff7Zm",
    "tx_message": "Transaction approved",
    "cc_type": "Visa",
    "cc_last_4": "4242",
    "created_date": 1443389544,
    "updated_date": 1443389545
}
{% endhighlight %}