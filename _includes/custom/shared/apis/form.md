Site owners can add [forms to pages](https://hc.weebly.com/hc/en-us/articles/212044867-Create-a-Survey-Poll-RSVP-or-Contact-Form) that allow their visitors to leave information, like their name and address, or to create surveys or polls.

Use the Form API to retrieve all forms for a site. Use the {% if site.project=="designer" %}[Form Entries](ds_api_form_entry.html){%elsif site.project=="cloud" %}[Form Entries](cl_api_form_entry.html){%elsif site.project=="platform" %}[Form Entries](pf_api_form_entry.html){%endif%} API to view the actual entries from a given form.

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
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>form_id</code></td>
        <td>Unique ID for a form
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>form_name</code></td>
        <td>The name given to a form when created</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>last_submitted</code></td>
        <td>Timestamp for the date of the last form submission.
        </td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>submission_count</code></td>
        <td>The number of form submissions.
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>page_id</code></td>
        <td>A unique ID that represents the {% if site.project=="designer" %}<a href="ds_api_page.html">page</a>{% elsif site.project=="cloud" %}<a href="cl_api_page.html">page</a>{% elsif site.project=="platform" %}<a href="pf_api_page.html">page</a>{% endif %} containing the form.
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>site_title</code></td>
        <td>​Title of the site that contains the form.
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>deleted</code></td>
        <td>Whether or not the form has been deleted.<br>
            Valid values are:
           <ul>
               <li><code>1</code>: true</li>
               <li><code>0</code>: false</li>
           </ul></td>
        <td>string</td>
        <td>X</td>
    </tr>

    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Forms
</h2>

{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/forms

{% else %}
GET /user/USER_ID/site/{SITE_ID}/form
{% endif %}
{% endhighlight %}

Returns all forms for the given site.
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
            {%include custom/notes/note_pagination.md %}
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
        <td>Use to retrieve only forms that have a full-text match with the query string.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterby</code></td>
        <td>Field name to set a filter on.
        </td>
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

<p class="codeTitle">Example CURL request returning all forms:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/forms \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/form \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/forms?sortby=form_id&sortdir=asc \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/form?sortby=form_id&sortdir=asc \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
    {
        "site_id":"987654321",
        "form_id":"123456",
        "form_name":"Contact Form",
        "last_submitted":1453382915,
        "submission_count":"4",
        "page_id":"765432198",
        "site_title":"My Site",
        "deleted": "0"
    }
    {
        "site_id":"987654321",
        "form_id":"456789",
        "form_name":"RSVP Form",
        "last_submitted":1453374946,
        "submission_count":"8",
        "page_id":"76543321",
        "site_title":"My Site",
        "deleted": "0"
    }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Form
</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/sites/{SITE_ID}/forms/{FORM_ID}

{% else %}
GET /user/USER_ID/site/{SITE_ID}/form/{FORM_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given form.
{% if site.project == "platform" %}
<br>
**scope:** `read:site`
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user/sites/987654321/forms/123456 \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456/site/987654321/form/123456 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the form are returned.</p>
{% highlight json %}
{
    "site_id":"987654321",
    "form_id":"123456",
    "form_name":"RSVP Form",
    "last_submitted":1453374946,
    "submission_count":"8",
    "page_id":"7654321",
    "site_title":"My Site",
    "deleted": "0"
}
{% endhighlight %}
