When a product has [options](https://hc.weebly.com/hc/en-us/articles/227067887-Add-Selectable-Options-Like-Size-or-Color-to-a-Physical-Product), like `Color` or `Size`, then each `SKU` has a set of option choices - that is, the value for those options for this SKU. For example, a T-shirt might have the options `Color` and `Size`, and so a particular SKU might have the option choice values of `Red` and `Small`. Another SKU might have the option choice values of `Red` and `Large`.

Use the Product SKU Option Choice API to retrieve the option choices for a given product sku.

Product SKU Option Choices are also returned with the {% if site.project=="designer" %}[Product SKU API](ds_api_product_sku.html){%elsif site.project=="cloud" %}[Product SKU API](cl_api_product_sku.html){%elsif site.project=="platform" %}[Product SKU API](pf_api_product_sku.html){%endif%}.

If you want add/change/delete the option choices for a product, you use the `PUT` endpoint on {% if site.project=="designer" %}[Product](ds_api_product.html){%elsif site.project=="cloud" %}[Product](cl_api_product.html){%elsif site.project=="platform" %}[Product](pf_api_product.html){%endif%}. For example, if you wanted to add the color option of yellow to a product, you'd use `PUT` and replace sku with all the available options, including yellow. You can then use the `PATCH` endpoint from the {% if site.project=="designer" %}[Product Options API](ds_api_product_option.html){%elsif site.project=="cloud" %}[Product Options API](cl_api_product_option.html){%elsif site.project=="platform" %}[Product Options API](pf_api_product_option.html){%endif%} to change the order.

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
        <td><code>product_id</code></td>
        <td>​​Unique ID (to this store) for the {% if site.project=="designer" %}<a href="ds_api_product.html">product</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">product</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_sku_id</code></td>
        <td>​​Unique ID (to this product) for this {% if site.project=="designer" %}<a href="ds_api_product_sku.html">SKU</a>{% elsif site.project=="cloud" %}<a href="cl_api_product_sku.html">SKU</a>{% elsif site.project=="platform" %}<a href="pf_api_product_sku.html">SKU</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>product_sku_optionchoice_id</code></td>
        <td>Unique ID (to this SKU) for this option choice. For example, red as a color choice would have a unique ID.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>​​The name of this option, for example <code>Color</code> or <code>Size</code>.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>choice</code></td>
        <td>​The value of this choice for this SKU, for example <code>red</code> or <code>medium</code>.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>option_type</code></td>
        <td>The UI control used to display the choices for this option. <br>
            Valid values are:
            <ul>
                <li><code>dropdown</code> (choose one)</li>
                <li><code>color</code> (color picker)</li>
                <li><code>radio</code> (choose many checkbox</li>
                <li><code>text</code> (text input)</li>
            </ul>
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the option choice was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the option choice was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of SKU Option Choicess
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/skus/{PRODUCT_SKU_ID}/optionchoices

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/sku/{PRODUCT_SKU_ID}/optionchoice
{% endif %}
{% endhighlight %}

Returns all option choices for the given SKU. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request returning all option choices:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus/2/optionchoices \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/sku/2/optionchoice \
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
        "product_id": "12",
        "product_sku_id": "2",
        "product_sku_optionchoice_id": "1",
        "name": "Color",
        "choice": "red",
        "option_type": "color"
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "product_id": "12",
        "product_sku_id": "2",
        "product_sku_optionchoice_id": "2",
        "name": "Size",
        "choice": "Medium",
        "option_type": "radio"
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve the Number of Option Choices for a Product</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/skus/{PRODUCT_SKU_ID}/optionchoices/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/sku/{PRODUCT_SKU_ID}/optionchoices/count
{% endif %}
{% endhighlight %}

Returns the number of option choices for the product.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus/2/optionchoices/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/sku/2/optionchoice/count \
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

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for an Option Choice
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/12/skus/2/optionchoices/{PRODUCT_SKU_OPTIONCHOICE_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/12/sku/2/optionchoice/{PRODUCT_SKU_OPTIONCHOICE_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given option choice.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/12/skus/2/optionchoices/1 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/12/sku/2/optionchoice/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the option choice are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "product_id": "12",
    "product_sku_id": "2",
    "product_sku_optionchoice_id": "1",
    "name": "Color",
    "choice": "Red",
    "option_type": "color"
    "created_date": 1490635265,
    "updated_date": 1490635265
}
{% endhighlight %}
