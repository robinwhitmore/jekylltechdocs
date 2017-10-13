Each submitted {% if site.project=="designer" %}[form](ds_api_form.html){%elsif site.project=="cloud" %}[form](cl_api_form.html){%elsif site.project=="platform" %}[form](pf_api_form.html){%endif%} on a site is saved as a form entry.

​Use the Form Entries API to return these entries.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
## Fields
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
        <td><code>elements</code></td>
        <td>Each element object represents a field in the form and has 3 properties:
            <ul>
                <li><code>type</code></li>
                <li><code>form_element_name</code></li>
                <li><code>values</code>: The <code>values</code> property is an array of objects representing field subtypes, each with a key and value property. The key is the the subtype name (empty string if none), and value is the value of the subtype.</li>
            </ul> </td>
        <td>array of objects</td>
        <td>X</td>
    </tr>

    <tr>
        <td><code>date_submitted</code></td>
        <td>Date the form entry was submitted
        </td>
        <td>Unix timestamp in GMT.</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>ip_address</code></td>
        <td>​The IP address of the machine submitting the form.</td>
        <td>string</td>
        <td>X</td>
        </tr>
    <tr>
        <td><code>form_entry_id</code></td>
        <td>The unique ID for a form entry.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve a List of Form Entries
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/forms/{FORM_ID}/entries

{% else %}
GET /user/USER_ID/site/{SITE_ID}/form/{FORM_ID}/entry
{% endif %}
{% endhighlight %}

Returns all entries for the given form.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

### Query Parameters
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
        <td>Use to retrieve only entries that have a full-text match with the query string.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterby</code></td>
        <td>Field name to set a filter on. </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​Value to search the filterby field for.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>sortby</code></td>
        <td>Field name to sort by</td>
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

<p class="codeTitle">Example CURL request returning all entries:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/forms/56789/entries \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/form/56789/entry \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/forms/56789/entries?sortdir=asc \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/form/56789/entry?sortdir=asc \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
    {
        "date_submitted":"1453382915",
        "ip_address":"74.115.50.52",
        "form_entry_id":"123456",
        "elements":[
            {
                "type":"Name",
                "form_element_name":"Name",
                "values":[
                    {
                        "key":"first",
                        "value":"John"
                    },
                    {
                        "key":"last",
                        "value":"Doe"
                    }
                ]
            },
            {
                "type":"email",
                "form_element_name":"Email",
                "values": [
                    {
                        "key":"",
                        "value":"john.doe@email.com"
                    }
                ]
            },
            {
                "type":"Options Buttons",
                "form_element_name":"Receive Emails?",
                "values": [
                    {
                        "key":"",
                        "value": "yes"
                    }
                ]
            }
        ]
    },
    {
        "date_submitted":"1453382925",
        "ip_address":"74.115.90.232",
        "form_entry_id":"18724587",
        "elements":[
            {
                "type":"Name",
                "form_element_name":"Name",
                "values":[
                    {
                        "key":"first",
                        "value":"Jane"
                    },
                    {
                        "key":"last",
                        "value":"Smith"
                    }
                ]
            },
            {
                "type":"email",
                "form_element_name":"Email",
                "values": [
                    {
                        "key":"",
                        "value":"jane.smith@email.com"
                    }
                ]
            },
            {
                "type":"Options Buttons",
                "form_element_name":"Receive Emails?",
                "values": [
                    {
                        "key":"",
                        "value":"no"
                    }
                ]
            }
        ]
    }
]
{% endhighlight %}

<h2><span class="label label-get text-uppercase">get</span> Retrieve Details for a Form Entry
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/forms/{FORM_ID}/entries/{ENTRY_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/form/{FORM_ID}/entry/{ENTRY_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given form entry.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/forms/56789/entries/654321 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/form/56789/entry/654321 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the entry are returned.</p>
{% highlight json %}
{
    "date_submitted":"1453382925",
    "ip_address":"74.115.90.232",
    "form_entry_id":"654321",
    "elements":[
        {
            "type":"Name",
            "form_element_name":"Name",
            "values":[
                {
                    "key":"first",
                    "value":"Jane"
                },
                {
                    "key":"last",
                    "value":"Smith"
                }
            ]
        },
        {
            "type":"email",
            "form_element_name":"Email",
            "values": [
                {
                    "key":"",
                    "value":"jane.smith@email.com"
                }
            ]
        },
        {
            "type":"Options Buttons",
            "form_element_name":"Receive Emails?",
            "values": [
                {
                    "key":"",
                    "value":"no"
                }
            ]
        }
    ]
}
{% endhighlight %}
