

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
      <td><code>user_id</code></td>
      <td>ID of the <a href="ds_api_user.html">user object</a> that this site is associated with. For designers, this user object is needed to access the rest of the Weebly Cloud API on behalf the site. Each site has a unique <code>user_id</code>​</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>reseller_client_id</code></td>
      <td>ID of a client, unique to the reseller.​</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>reseller_client_site_id</code></td>
      <td>ID of a client's site, unique to the designer. ​</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>site_id</code></td>
      <td>ID of a Weebly site, unique to Weebly. This <code><a href="ds_api_site.html">site_id</a></code> is needed to access the Weebly Cloud API on behalf of the site.​</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>site_title</code></td>
      <td>Title given to a site.</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>site_domain</code></td>
      <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
      <td>string</td>
      <td>X</td>
      <td>X</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>published</code></td>
      <td>Whether or not this site is published.<br> Valid values are:
        <ul>
          <li><code>true</code></li>
          <li><code>false</code></li>
        </ul>
      </td>
      <td>boolean</td>
      <td>X</td>
      <td><br>
      </td>
      <td><br>
      </td>
      <td></td>
    </tr>
    <tr>
      <td><code>site_contributor_count</code></td>
      <td>Number of <a href="ds_gs_access_sites.html">site contributors</a> assigned to this site. Site contributors are those that have varying and configurable access to the site.</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>reseller_plan_name</code></td>
      <td>Name of the <a href="ds_api_plan.html">plan</a> assigned to this site.</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><code>reseller_id</code></td>
      <td>The unique ID for the designer.</td>
      <td>string</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
      <td>Date the client's site was created.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
      <td>Date the client's site was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Client Sites</h2>

{% highlight shell%}
GET /client/{RESELLER_CLIENT_ID}/site
{% endhighlight %}

Returns all sites associated with the client. Only `list` fields are returned.

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
        <td><code>query</code></td>
        <td>Use to retrieve only pages that have a full-text match with the query string.</td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterby</code></td>
        <td>Field name to set a filter on. </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>filterfor</code></td>
        <td>​​​Value to search the filterby field for.<br>
            You can use the following URL encoded operators with your <code>filterfor</code> parameter:
            <ul>
                <li><code>​<</code>: use <code>%3C</code></li>
                <li><code>></code>: use <code>%3E</code></li>
                <li><code><=</code>: use <code>%3C%3D</code></li>
                <li><code>>=</code>: use <code>%3E%3D</code></li>
                ​
            </ul>
        </td>
        <td>string</td>
    </tr>
    <tr>
        <td><code>sortby</code></td>
        <td>Field name to sort by.</td>
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

<p class="codeTitle">Example CURL request returning all sites for a client:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/client/3/site \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client/3/site?filterby=published&filterfor=false \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
  {
    "user_id": "123456789",
    "reseller_client_id": "3",
    "reseller_client_site_id": "3",
    "site_id": "987654321",
    "site_title": "Clienttwo",
    "site_domain": "www.clienttwo.com",
    "published": false,
    "site_contributor_count": "0",
    "reseller_plan_name": "Prime",
    "reseller_id": "23456789",
    "updated_date": 1507664644,
    "created_date": 1507664644
  },
  {
    "user_id": "123456762",
    "reseller_client_id": "3",
    "reseller_client_site_id": "7",
    "site_id": "987654123",
    "site_title": "New Site",
    "site_domain": "www.mynewsite.com",
    "published": false,
    "site_contributor_count": "0",
    "reseller_plan_name": "Free",
    "reseller_id": "23456789",
    "updated_date": 1510960433,
    "created_date": 1510960433
  }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Client's Site</h2>
{% highlight shell%}
GET /client/{RESELLER_CLIENT_ID}/site/{RESELLER_CLIENT_SITE_ID}
{% endhighlight %}

Returns all fields for the given client site.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client/3/site/7 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the client are returned.</p>
{% highlight json %}
{
  "user_id": "123456762",
  "reseller_client_id": "3",
  "reseller_client_site_id": "7",
  "site_id": "987654123",
  "site_title": "New Site",
  "site_domain": "www.mynewsite.com",
  "published": false,
  "site_contributor_count": "0",
  "reseller_plan_name": "Free",
  "reseller_id": "23456789",
  "updated_date": 1510960433,
  "created_date": 1510960433
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create a Client Site</h2>
{% highlight shell%}
POST /client/{RESELLER_CLIENT_ID}/site
{% endhighlight %}

Creates a client.


These fields can be created:

<table>
  <tr>
    <td><strong>Name</strong></td>
    <td><strong>Description</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Notes</strong></td>
  </tr>
  <tr>
    <td><code>site_domain</code></td>
    <td>Fully qualified domain name for the site, for example <code>www.samplesite.com</code>​</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>site_title</code></td>
    <td>Title given to a site.</td>
    <td>string</td>
    <td>Returns <code>Blank Title</code> if no title is given.</td>
  </tr>
  <tr>
    <td><code>reseller_plan_name</code></td><!--todo: plan_name or id? -->
    <td>Name of the <a href="ds_api_plan.html">plan</a> assigned to this site.</td>
    <td>string</td>
    <td>If no plan is provided in the request, the default is assigned.</td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client/{RESELLER_CLIENT_ID}/site \
-X POST \
-d '{
      "site_domain": "anothernewsite.com"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user_id": "123654789",
  "reseller_client_id": "3",
  "reseller_client_site_id": "8",
  "site_id": "9876451263",
  "site_title": "Blank Title",
  "site_domain": "www.anothernewsite.com",
  "published": false,
  "site_contributor_count": "0",
  "reseller_plan_name": "Free",
  "reseller_id": "23456789",
  "updated_date": 1510960433,
  "created_date": 1510960433
}       
{% endhighlight %}

<h2>{% include label.html content="put" %} Replace a Client Site</h2>
{% highlight shell%}
PUT /client/{RESELLER_CLIENT_ID}/site/{RESELLER_CLIENT_SITE_ID}
{% endhighlight %}

Replaces the given client site.


These fields can be replaced:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
 <!--todo: add fields once tested-->
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client/3/site/8 \
-X PUT \
-d '{
      "site_title": "My Brand New Site"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user_id": "123654789",
  "reseller_client_id": "3",
  "reseller_client_site_id": "8",
  "site_id": "9876451263",
  "site_title": "My Brand New Site",
  "site_domain": "www.anothernewsite.com",
  "published": false,
  "site_contributor_count": "0",
  "reseller_plan_name": "Free",
  "reseller_id": "23456789",
  "updated_date": 1510960433,
  "created_date": 1510960433
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Client Site</h2>
{% highlight shell%}
PATCH /client/{RESELLER_CLIENT_ID}/site/{RESELLER_CLIENT_SITE_ID}
{% endhighlight %}

Updates the given client site.


These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <!--todo: add fields once tested-->
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/client/3/site/8 \
-X PATCH \
-d '{
      "site_title": "My Brand New Site"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"

{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the client are returned.
{% highlight json %}
{
  "user_id": "123654789",
  "reseller_client_id": "3",
  "reseller_client_site_id": "8",
  "site_id": "9876451263",
  "site_title": "My Brand New Site",
  "site_domain": "www.anothernewsite.com",
  "published": false,
  "site_contributor_count": "0",
  "reseller_plan_name": "Free",
  "reseller_id": "23456789",
  "updated_date": 1510960433,
  "created_date": 1510960433
}
{% endhighlight %}

<!--todo: add delete?-->
