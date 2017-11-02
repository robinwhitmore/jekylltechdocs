[Options](https://hc.weebly.com/hc/en-us/articles/227067887-Add-Selectable-Options-Like-Size-or-Color-to-a-Physical-Product) are the variations that each product SKU might have, for example color or size. Different display controls can be used to display options: a dropdown list, check boxes, or a color picker. The different values that an option can have are called option choices. For example, the option color might use a dropdown list to display the option choices of black, green, and purple. A product can have 0-n options, and an option can have 1-n option choices.

If you want to add/change/delete the options for a product, use the `PUT` endpoint on the {% if site.project=="designer" %}[Product API](ds_api_product.html){%elsif site.project=="cloud" %}[Product API](cl_api_product.html){%elsif site.project=="platform" %}[Products API](pf_api_product.html){%endif%}. For example, if you wanted to add the color option of yellow to a product, you'd use `PUT` and replace skus with all the available options, including yellow. You can then use the `PATCH` endpoint from the Product Option API to change the order.

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
        <td><code>product_id</code></td>
        <td>Unique ID (to this store) for the {% if site.project=="designer" %}<a href="ds_api_product.html">product</a>{% elsif site.project=="cloud" %}<a href="cl_api_product.html">product</a>{% elsif site.project=="platform" %}<a href="pf_api_product.html">product</a>{% endif %}.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>product_option_id</code></td>
        <td>​Unique ID (to this product) for this option.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>The name of this option, for example <code>Color</code> or <code>Size</code>.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>renderer</code></td>
        <td>The UI control used to display the choices for this option. <br>
            Valid values are:
            <ul>
                <li><code>dropdown</code> (choose one)</li>
                <li><code>color</code> (color picker)</li>
                <li><code>radio</code> (choose many checkbox)</li>
                <li><code>text</code> (text input)</li>
            </ul>
        </td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>choice_order</code></td>
        <td>An array of values for this option, in the order that they should be displayed. Colors need to include a hex value.<br>
            For example, if the option name is <code>Color</code>, the choice order might be: <pre>["black<#000>", "purple<#b073da>", "green<#508d24>"]</pre>
            You can also add just a hex value first to have a default color display. <br>
                For example:
            <pre>["<#000>", "black<#000>", "purple<#b073da>", "green<#508d24>"]</pre>
        </td>
        <td>array</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>required</code></td>
        <td>Whether or not an option must be selected to be purchased.<br>
            Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>max_length</code></td>
        <td>Whether or not an option with a renderer of <code>text</code> has a maximum character length.<br>
        Valid values are:
            <ul>
                <li><code>true</code></li>
                <li><code>false</code></li>
            </ul>
        </td>
        <td>boolean</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
        <td>Date the option was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
        <td>Date the option was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Options for a Product
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/options

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/option
{% endif %}
{% endhighlight %}

Returns all options for the given product. Only `list` fields are returned.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request returning all options:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/123/options \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/123/option \
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
        "product_id": "2",
        "product_option_id": 1,
        "name": "Color",
        "renderer": "color",
        "choice_order": [
            "<#000>",
            "Black<#000>",
            "Green<#508d24>",
            "purple<#b073da>"
        ],
        "required": true,
        "max_length": false
    },
    {
        "user_id": "123456",
        "site_id": "987654321",
        "product_id": "2",
        "product_option_id": 2,
        "name": "Size",
        "renderer": "radio",
        "choice_order": [
            "Small",
            "Medium",
            "Large"
        ],
        "required": true,
        "max_length": false
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Number of Options for a Product</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/options/count

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/option/count
{% endif %}
{% endhighlight %}

Returns the number of options for the product.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/123/options/count \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/123/option/count \
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

<h2>{% include label.html content="get" %} Retrieve Details for a Product Option
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/options/{PRODUCT_OPTION_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/option/{PRODUCT_OPTION_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given product option.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/123/options/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store/product/123/option/2 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the option are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "product_id": "123",
    "product_option_id": 2,
    "name": "Size",
    "renderer": "radio",
    "choice_order": [
        "Small",
        "Medium",
        "Large"
    ],
    "required": true,
    "max_length": false
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Product Option</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/store/products/{PRODUCT_ID}/options/{PRODUCT_OPTION_ID}

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/store/product/{PRODUCT_ID}/option/{PRODUCT_OPTION_ID}
{% endif %}
{% endhighlight %}

Updates the given product option.
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
        <td><code>choice_order</code></td>
        <td>An array of values for this option, in the order that they should be displayed. Colors need to include a hex value.<br>
            For example, if the option name is <code>Color</code>, the choice order might be: <pre>["black<#000>", "purple<#b073da>", "green<#508d24>"]</pre>
            You can also add just a hex value first to have a default color display. <br>
            For example:
            <pre>["<#000>", "black<#000>", "purple<#b073da>", "green<#508d24>"]</pre>
        </td>
        <td>array</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/sites/987654321/store/products/123/options/2 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "choice_order": ["Large","Medium","Small"]
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site/123456/store/product/123/option/2 \
-X PATCH \
-d '{
        "choice_order": ["Large","Medium","Small"]
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the product option are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "product_id": "123",
    "product_option_id": 2,
    "name": "Size",
    "renderer": "radio",
    "choice_order": [
        "Large",
        "Medium",
        "Small"
    ],
    "required": true,
    "max_length": false
}
{% endhighlight %}
