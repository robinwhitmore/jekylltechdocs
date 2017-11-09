Store owners can create [coupons](https://hc.weebly.com/hc/en-us/articles/227111587-Create-a-Coupon) for use on their site. Coupons can be either an amount deducted from the order, a percentage off of an order, or free shipping. They can be restricted either by the order amount needing to meet a certain threshold, or they can be restricted to specific products. The owner can also limit the number of coupons available and the date range that they are valid for.

For free shipping coupons, the coupon can be for a specific [rate or method](https://hc.weebly.com/hc/en-us/articles/226811948-Set-Up-Shipping-Areas-and-Rates) that the store owner has already configured. You cannot create free shipping coupons using the API.

Use the Coupons API to manage a store's coupons, including retrieving coupons, updating or deleting existing ones, and creating new ones.

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
        <td><code>availability</code></td>
        <td>Date range that the coupon is valid for.
        </td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>summary</code></td>
        <td>Calculated string that describes the coupon, based on the posted criteria.
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>num_available</code></td>
        <td>Total number of coupons available.</td>
        <td>integer</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>num_used</code></td>
        <td>​Number of coupons redeemed by the store's customers.</td>
        <td>integer</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>shipping_method_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_method_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td></td>
        <td>Required if <code>type=​shipping</code></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>shipping_rate_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_rate_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td></td>
        <td>Required if <code>type=​shipping</code></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>category_ids</code></td>
        <td>For <code>categories</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_category.html">category IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_category.html">category IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_category.html">category IDs</a>{% endif %} that the coupon is valid for.</td>
        <td>array of strings</td>
        <td></td>
        <td>Required if <code>criteria=categories</code></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>For <code>products</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_apis_product.html">product IDs</a>{% elsif site.project=="cloud" %}<a href="cl_apis_product.html">product IDs</a>{% elsif site.project=="platform" %}<a href="pf_apis_product.html">product IDs</a>{% endif %} that the coupon is valid for.
        </td>
        <td>array of strings</td>
        <td></td>
        <td>Required if <code>criteria=products</code></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>coupon_id</code></td>
        <td>​Unique ID (within the store) of the coupon
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>code</code></td>
        <td>​​The coupon code that the customer must enter to redeem the coupon
        </td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>type</code></td>
        <td>The type of this coupon.<br>
            Valid values are:
            <ul>
                <li><code>percent</code>: percentage amount off the total order</li>
                <li><code>absolute</code>: absolute amount off the total order</li>
                <li><code>shipping</code>: free shipping (only available if the store owner has configured shipping rates for their store)</li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>amount</code></td>
        <td>The amount of the coupon, for example <code>5.00</code> for an absolute amount of <code>$5.00</code>. For percent types, use a percentage amount, for example <code>20.00</code> for <code>20%</code>.
        </td>
        <td>decimal</td>
        <td></td>
        <td>Required if <code>type=absolute</code></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>start_date</code></td>
        <td>​​The first date the coupon is valid.
        </td>
        <td>​Unix timestamp in GMT
        </td>
        <td></td>
        <td><br>
        </td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>end_date</code></td>
        <td>​​​The last date the coupon is valid.
        </td>
        <td>​​Unix timestamp in GMT
        </td>
        <td></td>
        <td><br>
        </td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>criteria</code></td>
        <td>The limiting criteria for applying a coupon.<br>
            Valid values are:
            <ul>
                <li><code>all</code>: no limitations</li>
                <li><code>total_over</code>: only orders over X dollar amount</li>
                <li><code>categories</code>: only orders containing products from specific categories</li>
                <li><code>products</code>: only orders containing specific products</li>
            </ul>
        </td>
        <td>string</td>
        <td></td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>criteria_amount</code></td>
        <td>​​For <code>total_over</code> criteria, the threshold amount an order must meet in order for the coupon to be valid.
        </td>
        <td>decimal</td>
        <td></td>
        <td>Required
            If <code>criteria=
            ​total_over</code>
        </td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the coupon was created </td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the coupon was last updated </td>
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

<h2>{% include label.html content="get" %} Retrieve a List of Coupons
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/coupons

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/coupon
{% endif %}
{% endhighlight %}

Returns all coupons for the given site. Only `list` fields are returned.
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
        <td><code>filterby</code></td>
        <td>Field name to set a filter on.
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​​​Value to search the filterby field for.<br>
            You can use the following URL encoded operators with your filterfor parameter:
            <ul>
                <li><code>​<</code>: use <code>%3C</code></li>
                <li><code>></code>: use <code>%3E</code></li>
                <li><code><=</code>: use <code>%3C%3D</code></li>
                <li><code>>=</code>: use <code>%3E%3D</code></li>​
            </ul>
        </td>
        <td>string</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request returning all coupons:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons?filterby=num_avail&filterfor=$3 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon?filterby=num_avail&filterfor=$3 \
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
        "summary": "$10 off orders over $100",
        "coupon_id": "2",
        "code": "10OFF"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "summary": "$10 off select products",
        "coupon_id": "7",
        "code": "SPRINGTIME"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "summary": "$10 off select products",
        "coupon_id": "8",
        "code": "SPRINGFLING"
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of Coupons for a Site
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/coupons/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/coupon/count
{% endif %}
{% endhighlight %}

Returns the number of coupons.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon/count \
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

<h2>{% include label.html content="get" %} Retrieve Details for a Coupon
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/coupons/{COUPON_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/coupon/{COUPON_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given coupon.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons/3 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon/3 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the coupon are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "availability": "3/1/2017 - 3/31/2017",
    "summary": "$10 off orders over $100",
    "num_available": 100,
    "num_used": 0,
    "shipping_method_ids": [],
    "category_ids": [],
    "product_ids": [],
    "coupon_id": "2",
    "code": "10OFF",
    "type": "absolute",
    "amount": 10,
    "start_date": 1488326400,
    "end_date": 1490918400,
    "criteria": "total_over",
    "criteria_amount": 100,
    "created_date": 1486166397,
    "updated_date": 1486166397,
    "shipping_rate_ids": []
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create a Coupon</h2>
{% highlight shell%}
{% if site.project == "platform" %}
POST /v1/user/sites/{SITE_ID}/store/coupons

{% else %}
POST /user/USER_ID/site/{SITE_ID}/store/coupon
{% endif %}
{% endhighlight %}

Creates a new coupon for the site's store.
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
        <td><code>code</code></td>
        <td>​​The coupon code that the customer must enter to redeem the coupon
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>type</code></td>
        <td>The type of this coupon.<br>
            Valid values are:
            <ul>
                <li><code>percent</code>: percentage amount off the total order</li>
                <li><code>absolute</code>: absolute amount off the total order</li>
                <li><code>shipping</code>: free shipping (only available if the store owner has configured shipping rates for their store)</li>
            </ul>
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>criteria</code></td>
        <td>The limiting criteria for applying a coupon.<br>
            Valid values are:
            <ul>
                <li><code>all</code>: no limitations</li>
                <li><code>total_over</code>: only orders over X dollar amount</li>
                <li><code>categories</code>: only orders containing products from specific categories</li>
                <li><code>products</code>: only orders containing specific products</li>
            </ul>
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>amount</code></td>
        <td>The amount of the coupon, for example <code>5.00</code> for an absolute amount of <code>$5.00</code>. For percent types, use a percentage amount, for example <code>20.00</code> for <code>20%</code>.
        </td>
        <td>decimal</td>
        <td>Required if <code>type=absolute</code></td>
    </tr>
    <tr>
        <td><code>criteria_amount</code></td>
        <td>​​For <code>total_over</code> criteria, the threshold amount an order must meet in order for the coupon to be valid.
        </td>
        <td>decimal</td>
        <td>Required if <code>criteria=total_over</code>
        </td>
    </tr>
    <tr>
        <td><code>category_ids</code></td>
        <td>For <code>categories</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_category.html">category IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_category.html">category IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_category.html">category IDs</a>{% endif %} that the coupon is valid for.</td>
        <td>array of strings</td>
        <td>Required if <code>criteria=categories</code></td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>For <code>products</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_product.html">product IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">product IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product IDs</a>{% endif %} that the coupon is valid for.
        </td>
        <td>array of strings</td>
        <td>Required if <code>criteria=products</code></td>
    </tr>
    <tr>
        <td><code>shipping_method_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_method_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td>Required if <code>type=shipping</code></td>
    </tr>
    <tr>
        <td><code>shipping_rate_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_rate_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td>Required if <code>type=shipping</code></td>
    </tr>
    <tr>
        <td><code>num_available</code></td>
        <td>Total number of coupons available.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>start_date</code></td>
        <td>​​The first date the coupon is valid.
        </td>
        <td>​Unix timestamp in GMT
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>end_date</code></td>
        <td>​​​The last date the coupon is valid.
        </td>
        <td>​​Unix timestamp in GMT
        </td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request POST \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "code": "5-OFF",
            "type": "absolute",
            "amount": 5,
            "criteria": "total_over",
            "criteria_amount": "5.00",
            "num_available": 100,
            "start_date": 1493596800,
            "end_date": 1496275199
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon \
-X POST \
-d '{
        "code": "5-OFF",
        "type": "absolute",
        "amount": 5,
        "criteria": "total_over",
        "criteria_amount": "5.00",
        "num_available": 100,
        "start_date": 1493596800,
        "end_date": 1496275199
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
    "availability": "4/30/2017 - 5/31/2017",
    "summary": "$5 off orders over $5",
    "num_available": 100,
    "num_used": 0,
    "shipping_method_ids": [],
    "shipping_rate_ids": [],
    "category_ids": [],
    "product_ids": [],
    "coupon_id": "11",
    "code": "5-OFF",
    "type": "absolute",
    "amount": 5,
    "start_date": 1493596800,
    "end_date": 1496275199,
    "criteria": "total_over",
    "criteria_amount": 5,
    "created_date": 1486410889,
    "updated_date": 1486410889
}
{% endhighlight %}

<h2>{% include label.html content="put" %} Replace a Coupon</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PUT /v1/user/sites/{SITE_ID}/store/coupons/{COUPON_ID}

{% else %}
PUT /user/USER_ID/site/{SITE_ID}/store/coupon/{COUPON_ID}
{% endif %}
{% endhighlight %}

Replaces the given coupon.
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
        <td><code>code</code></td>
        <td>​​The coupon code that the customer must enter to redeem the coupon
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>type</code></td>
        <td>The type of this coupon.<br>
            Valid values are:
            <ul>
                <li><code>percent</code>: percentage amount off the total order</li>
                <li><code>absolute</code>: absolute amount off the total order</li>
                <li><code>shipping</code>: free shipping (only available if the store owner has configured shipping rates for their store)</li>
            </ul>
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>criteria</code></td>
        <td>The limiting criteria for applying a coupon.<br>
            Valid values are:
            <ul>
                <li><code>all</code>: no limitations</li>
                <li><code>total_over</code>: only orders over X dollar amount</li>
                <li><code>categories</code>: only orders containing products from specific categories</li>
                <li><code>products</code>: only orders containing specific products</li>
            </ul>
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>amount</code></td>
        <td>The amount of the coupon, for example <code>5.00</code> for an absolute amount of <code>$5.00</code>. For percent types, use a percentage amount, for example <code>20.00</code> for <code>20%</code>.
        </td>
        <td>decimal</td>
        <td>Required if <code>type=absolute</code></td>
    </tr>
    <tr>
        <td><code>criteria_amount</code></td>
        <td>​​For <code>total_over</code> criteria, the threshold amount an order must meet in order for the coupon to be valid.
        </td>
        <td>decimal</td>
        <td>Required if <code>criteria=total_over</code>
        </td>
    </tr>
    <tr>
        <td><code>category_ids</code></td>
        <td>For <code>categories</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_category.html">category IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_category.html">category IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_category.html">category IDs</a>{% endif %} that the coupon is valid for.</td>
        <td>array of strings</td>
        <td>Required if <code>criteria=categories</code></td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>For <code>products</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_product.html">product IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">product IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product IDs</a>{% endif %} that the coupon is valid for.
        </td>
        <td>array of strings</td>
        <td>Required if <code>criteria=products</code></td>
    </tr>
    <tr>
        <td><code>shipping_method_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_method_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td>Required if <code>type=shipping</code></td>
    </tr>
    <tr>
        <td><code>shipping_rate_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_rate_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td>Required if <code>type=shipping</code></td>
    </tr>
    <tr>
        <td><code>num_available</code></td>
        <td>Total number of coupons available.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>start_date</code></td>
        <td>​​The first date the coupon is valid.
        </td>
        <td>​Unix timestamp in GMT
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>end_date</code></td>
        <td>​​​The last date the coupon is valid.
        </td>
        <td>​​Unix timestamp in GMT
        </td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PUT \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons/{COUPON_ID} \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "code": "VIP",
            "type": "absolute",
            "amount": "100",
            "criteria": "all",
            "criteria_amount": "1",
            "product_ids": "[]",
            "category_ids": "[]",
            "shipping_rate_ids": "[]"
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon/{COUPON_ID} \
-X PUT \
-d '{
        "code": "VIP",
        "type": "absolute",
        "amount": "100",
        "criteria": "all",
        "criteria_amount": "1",
        "product_ids": "[]",
        "category_ids": "[]",
        "shipping_rate_ids": "[]"
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
    "availability": "Never expires",
    "summary": "10% off all orders",
    "num_available": null,
    "num_used": 0,
    "shipping_rate_ids": [ ],
    "category_ids": [ ],
    "product_ids": [ ],
    "coupon_id": "3",
    "code": "VIP",
    "type": "absolute",
    "amount": 100,
    "start_date": null,
    "end_date": null,
    "criteria": "all",
    "criteria_amount": 1,
    "created_date": 1458873551,
    "updated_date": 1461024564
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Coupon</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/store/coupons/{COUPON_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/store/coupon/{COUPON_ID}
{% endif %}
{% endhighlight %}

Updates the given coupon.
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
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>code</code></td>
        <td>​​The coupon code that the customer must enter to redeem the coupon
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>type</code></td>
        <td>The type of this coupon.<br>
            Valid values are:
            <ul>
                <li><code>percent</code>: percentage amount off the total order</li>
                <li><code>absolute</code>: absolute amount off the total order</li>
                <li><code>shipping</code>: free shipping (only available if the store owner has configured shipping rates for their store)</li>
            </ul>
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>criteria</code></td>
        <td>The limiting criteria for applying a coupon.<br>
            Valid values are:
            <ul>
                <li><code>all</code>: no limitations</li>
                <li><code>total_over</code>: only orders over X dollar amount</li>
                <li><code>categories</code>: only orders containing products from specific categories</li>
                <li><code>products</code>: only orders containing specific products</li>
            </ul>
        </td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>amount</code></td>
        <td>The amount of the coupon, for example <code>5.00</code> for an absolute amount of <code>$5.00</code>. For percent types, use a percentage amount, for example <code>20.00</code> for <code>20%</code>.
        </td>
        <td>decimal</td>
        <td>Required if <code>type=absolute</code></td>
    </tr>
    <tr>
        <td><code>criteria_amount</code></td>
        <td>​​For <code>total_over</code> criteria, the threshold amount an order must meet in order for the coupon to be valid.
        </td>
        <td>decimal</td>
        <td>Required if <code>criteria=total_over</code>
        </td>
    </tr>
    <tr>
        <td><code>category_ids</code></td>
        <td>For <code>categories</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_category.html">category IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_category.html">category IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_category.html">category IDs</a>{% endif %} that the coupon is valid for.</td>
        <td>array of strings</td>
        <td>Required if <code>criteria=categories</code></td>
    </tr>
    <tr>
        <td><code>product_ids</code></td>
        <td>For <code>products</code> criteria, an array of {% if site.project=="designer" %}<a href="ds_api_product.html">product IDs</a>{% elsif site.project=="cloud" %}<a href="cl_api_produc.html">product IDs</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product IDs</a>{% endif %} that the coupon is valid for.
        </td>
        <td>array of strings</td>
        <td>Required if <code>criteria=products</code></td>
    </tr>
    <tr>
        <td><code>shipping_method_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_method_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td>Required if <code>type=shipping</code></td>
    </tr>
    <tr>
        <td><code>shipping_rate_ids</code></td>
        <td>For free shipping coupons, an array of <code>shipping_rate_ids</code> that provide free shipping. This must already be configured in the store.</td>
        <td>array of strings</td>
        <td>Required if <code>type=shipping</code></td>
    </tr>
    <tr>
        <td><code>num_available</code></td>
        <td>Total number of coupons available.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>start_date</code></td>
        <td>​​The first date the coupon is valid.
        </td>
        <td>​Unix timestamp in GMT
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>end_date</code></td>
        <td>​​​The last date the coupon is valid.
        </td>
        <td>​​Unix timestamp in GMT
        </td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons/5 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "num_available": 90
            "amount": 10
        }'

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon/5 \
-X PATCH \
-d '{
        "num_available": 90
        "amount": 10
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
    "availability": "2/28/2017 - 3/30/2017",
    "summary": "$10 off all orders",
    "num_available": 90,
    "num_used": 10,
    "shipping_method_ids": [],
    "category_ids": [],
    "product_ids": [],
    "coupon_id": "2",
    "code": "10OFF",
    "type": "absolute",
    "amount": 10,
    "start_date": 1488326400,
    "end_date": 1490918400,
    "criteria": "all",
    "criteria_amount": 10,
    "created_date": 1486166397,
    "updated_date": 1486415167
}
{% endhighlight %}

<h2>{% include label.html content="delete" %} Delete a Coupon</h2>
{% highlight shell%}
{% if site.project == "platform" %}
DELETE /v1/user/sites/{SITE_ID}/store/coupons/{COUPON_ID}

{% else %}
DELETE /user/USER_ID/site/{SITE_ID}/store/coupon/{COUPON_ID}
{% endif %}
{% endhighlight %}

Deletes the given coupon.
{% if site.project == "platform" %}
<br>
**scope:** `write:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request DELETE \
--url https://api.weebly.com/v1/user/sites/987654321/store/coupons/3 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/coupon/3 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

**Response**
There is no response to a delete request.
