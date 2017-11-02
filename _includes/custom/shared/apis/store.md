A site can have one [online store](https://hc.weebly.com/hc/en-us/articles/227184547-Parts-and-Pieces-of-a-Weebly-Online-Store). The {% if site.project=="designer" %}[plan](ds_gs_plans.html){%elsif site.project=="cloud" %}[plan](cl_gs_plans.html){%elsif site.project=="platform" %}[plan](https://www.weebly.com/pricing){%endif%} that the site uses determines the functionality available to that store. For example, more premium plans allow a greater number of products, custom domain checkout, as well as more advanced functionality like automatic tax calculation and shipping rates. Use `plan_level` on the {% if site.project=="designer" %}[Site API](ds_api_site.html){%elsif site.project=="cloud" %}[Site API](cl_api_site.html){%elsif site.project=="platform" %}[Site API](pf_api_site.html){%endif%} to determine the site's current plan.

Use the Store API to get and update information about a site's store.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all the fields that exist for this API and which are changeable using `PATCH`. Sites can have only one store, so you can only get details for that one store.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Changeable</strong></td>
    </tr>
    <tr>
        <td>​<code>user_id</code></td>
        <td>The unique ID of the authenticated user</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td></td>
    </tr>

    <tr>
        <td><code>company_name</code></td>
        <td>The name given to the store.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>street</code></td>
        <td>The store's street address.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>city</code></td>
        <td>The store's city.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>state</code></td>
        <td>The store's state or region.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>postal_code</code></td>
        <td>The store's postal/zip code.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>country</code></td>
        <td>The store's country</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>The email set for the store. This may be different than the associated user's email.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>phone</code></td>
        <td>The phone number set for the store.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>currency</code></td>
        <td>The currency set for this store.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>weight_unit</code></td>
        <td>The weight unit set for this store.<br>
            Valid values are:
            <ul>
                <li><code>lb</code></li>
                <li><code>kg</code></li>
            </ul>
            </td>
        <td>string</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}


<h2>{% include label.html content="get" %} Retrieve Details for a Store</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/store

{% else %}
GET /user/USER_ID/site/{SITE_ID}/store
{% endif %}
{% endhighlight %}

Returns all fields for the given store.
{% if site.project == "platform" %}
<br>
**scope:** `read:store-catalog`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/store \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/store \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the store are returned.</p>
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "company_name": "Healthy Food For You",
    "street": "460 Bryant St.",
    "city": "San Francisco",
    "state": "CA",
    "postal_code": "94107",
    "country": "US",
    "email": "hf4u@email.com",
    "phone": 5555555555,
    "currency": "USD",
    "weight_unit": "lb"
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Store</h2>
{% highlight shell%}
{% if site.project == "platform" %}
PATCH /v1/user/sites/{SITE_ID}/store

{% else %}
PATCH /user/USER_ID/site/{SITE_ID}/store
{% endif %}
{% endhighlight %}

Updates the given store.
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
        <td><code>company_name</code></td>
        <td>The name given to the store.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>street</code></td>
        <td>The store's street address.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>city</code></td>
        <td>The store's city.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>state</code></td>
        <td>The store's state or region.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>postal_code</code></td>
        <td>The store's postal/zip code.</td>
        <td>string</td>
        <td></td>
    </tr>
    <!--
    <tr>
        <td><code>country</code></td>
        <td>The store's country</td>
        <td>string</td>
        <td>Note that the <code>PATCH</code> call accepts any text as a string, but the <code>GET</code> call returns the country's ISO 3166 Alpha 2 code (for example, US).</td>
    </tr> -->
    <tr>
        <td><code>email</code></td>
        <td>The email set for the store. This may be different than the associated user's email.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>phone</code></td>
        <td>The phone number set for the store.</td>
        <td>string</td>
        <td>X</td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request PATCH \
--url https://api.weebly.com/v1/user/site \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"
--data '{
            "email": "healthyfood4you@email.com",
            "phone": 5551234567,
        }'

{% else %}
curl https://api.weeblycloud.com/user/987654321/site \
-X PATCH \
-d '{
        "email": "healthyfood4you@email.com",
        "phone": 5551234567,
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the store are returned.
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654321",
    "company_name": "Healthy Food For You",
    "street": "460 Bryant St.",
    "city": "San Francisco",
    "state": "CA",
    "postal_code": "94107",
    "country": "US",
    "email": "healthyfood4you@email.com",
    "phone": 5551234567,
    "currency": "USD",
    "weight_unit": "lb"
}
{% endhighlight %}
