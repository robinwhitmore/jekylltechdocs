Weebly Cloud {% if site.project=="designer" %}[plans](ds_gs_plans.html){%elsif site.project=="cloud" %}[plans](cl_gs_plans.html){%endif%} are based off of the four subscription levels that Weebly offers: Free, Starter, Pro, and Business. Weebly Cloud Plans can be created in Weebly Cloud Admin. This API allows your plans to be managed and also allows you to manage plans for a given site.

<h2>Fields</h2>

The following table shows all fields that exist for this API and those that are required for `POST`.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Required</strong></td>
    </tr>
    <tr>
        <td>​<code>plans</code></td>
        <td>All plans for a {{site.company}} or site.</td>
        <td>object that includes a <code>plan_id</code> object, which in turn includes all the fields for a plan.</td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>Plan name.​</td>
        <td>string</td>
        <td></td>
    </tr>

    <tr>
        <td><code>page_limit</code></td>
        <td>Maximum number of published pages allowed under this plan. If the plan allows unlimited pages, the value is <code>0</code>. If a user tries to add a page above that limit, they are prompted to upgrade.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>terms</code></td>
        <td>All terms for this plan</td>
        <td>object that includes the <code>term</code> and <code>retail_price</code> fields.</td>
        <td></td>
    </tr>
    <tr>
        <td><code>term</code></td>
        <td>Amount of time, in months, that the plan is good for.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>retail_price</code></td>
        <td>Price of the plan for the <code>term</code>.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>period_name</code></td>
        <td>Description of the length of the <code>term</code>, for example <code>month</code> or <code>year</code>.</td>
        <td>integer</td>
        <td></td>
    </tr>
    <tr>
        <td><code>is_default</code></td>
        <td>Whether or not this plan is the plan assigned by default when a site is created.<br>
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
        <td><code>is_archived</code></td>
        <td>Whether or not this plan is archived.<br>
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
        <td><code>description</code></td>
        <td>A description of the plan to help site creators make a decision about which plan to purchase.</td>
        <td>string</td>
        <td></td>
    </tr>
    <tr>
        <td><code>plan_id</code></td>
        <td>Unique ID for this plan</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>weebly_plan</code></td>
        <td>The Weebly plan this plan is associated with.<br>
        Valid values are:
            <ul>
                <li>Free: <code>0</code></li>
                <li>Starter: <code>5</code></li>
                <li>Pro:  <code>10</code></li>
                <li>Business: <code>15</code></li>
            </ul>
        </td>
        <td>integer</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Plans
</h2>

{% highlight shell%}
GET plan
{% endhighlight %}

Returns all plans created in the Cloud Admin. All fields are returned

<p class="codeTitle">Example CURL request returning all plans:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/plan \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "plans": {
        "1": {
            "name": "Free",
            "page_limit": 5,
            "terms": [
                {
                    "term": "1",
                    "retail_price": 0,
                    "period_name": "month"
                },
                {
                    "term": "12",
                    "retail_price": 0,
                    "period_name": "year"
                }
            ],
            "is_default": true,
            "is_archived": false,
            "description": "A quick way to start your first Weebly site.",
            "plan_id": "1",
            "weebly_plan": 0
        },
        "2": {
                "name": "Starter",
                "page_limit": 0,
                "terms": [
                    {
                        "term": "1",
                        "retail_price": 8.17,
                        "period_name": "month"
                    },
                    {
                        "term": "12",
                        "retail_price": 89.04,
                        "period_name": "year"
                    }
                ],
                "is_default": false,
                "is_archived": false,
                "description": "Create a great website in no-time. Add a custom footer and favicon.",
                "plan_id": "2",
                "weebly_plan": 5
        },
        "3": {
                "name": "Pro",
                "page_limit": 0,
                "terms": [
                    {
                        "term": "1",
                        "retail_price": 13.17,
                        "period_name": "month"
                    },
                    {
                        "term": "12",
                        "retail_price": 138.96,
                        "period_name": "year"
                    }
                ],
                "is_default": false,
                "is_archived": false,
                "description": "Everything you need to create a professionally branded website. Access to premium elements and membership.",
                "plan_id": "3",
                "weebly_plan": 10
        },
        "4": {
                "name": "Business",
                "page_limit": 0,
                "terms": [
                    {
                        "term": "1",
                        "retail_price": 29,
                        "period_name": "month"
                    },
                    {
                        "term": "12",
                        "retail_price": 299.04,
                        "period_name": "year"
                    }
                ],
                "is_default": false,
                "is_archived": false,
                "description": "Powerful tools enabling you to run your business on Weebly. Inventory management, no transaction fees, shipping integration and more.",
                "plan_id": "4",
                "weebly_plan": 15
        }
    }
}
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve the Plan for a Site
</h2>
{% highlight shell%}
GET /user/USER_ID/site/{SITE_ID}/plan
{% endhighlight %}

Returns the plan for the site.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/123456/site/987654321/plan \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the plan are returned.</p>
{% highlight json %}
{
    "plans": {
        "3": {
            "name": "Pro",
            "page_limit": 0,
            "term": 12,
            "period_name": "year",
            "retail_price": 138.96,
            "is_default": false,
            "is_archived": false,
            "description": "Everything you need to create a professionally branded website. Access to premium elements and membership.",
            "plan_id": "3",
            "weebly_plan": 10
        }
    }
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Assign a Plan to a Site</h2>
{% highlight shell%}
POST /user/USER_ID/site/{SITE_ID}/plan
{% endhighlight %}

Assigns a plan to a site

These fields can be created:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
    <tr>
        <td><code>plan_id</code></td>
        <td>The unique ID for the plan.</td>
        <td>string</td>
        <td>Required</td>
    </tr>
    <tr>
        <td><code>term</code></td>
        <td>Amount of time, in months, that the plan is good for.</td>
        <td>integer</td>
        <td></td>
    </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/123456/site/987654321/plan \
-X POST \
-d '{
        "plan_id": "3"
        "term": 12
}' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
    "success": true
}
{% endhighlight %}
