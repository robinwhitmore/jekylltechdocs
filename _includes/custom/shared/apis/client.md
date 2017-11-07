

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
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>site_id</code></td>
        <td>ID of a Weebly site, unique to the currently authenticated user​</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td><code>client_id</code></td>
        <td>description​</td>
        <td>string</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>description</td>
        <td>string</td>
        <td>list</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>description</td>
        <td>string</td>
        <td>list</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>phone</code></td>
        <td>description</td>
        <td>string</td>
        <td>list</td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>note</code></td>
        <td>description</td>
        <td>string</td>
        <td></td>
        <td></td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
      <td>Date the client was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
      <td>Date the client was last updated.</td>
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

<h2>{% include label.html content="get" %} Retrieve a List of Clients</h2>

{% highlight shell%}
GET /client
{% endhighlight %}

Returns all clients for the designer. Only `list` fields are returned.

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

<p class="codeTitle">Example CURL request returning all clients:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/client \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example filtered request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client?filterby=phone&filterfor=555-555-5555 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
  {
    "user_id": "123456",
    "site_id": "987654321",
    "client_id": "1",
    "name": "Client One",
    "email": "clientone@email.com",
    "phone": "555-555-5555",
    "note": null
  },
  {
    "user_id": "123456",
    "site_id": "987654322",
    "client_id": "2",
    "name": "Client Two",
    "email": "clienttwo@email.com",
    "phone": "555-555-5556",
    "note": null
  },
  {
    "user_id": "123456",
    "site_id": "987654323",
    "client_id": "3",
    "name": "Client Three",
    "email": "clientthree@email.com",
    "phone": "555-555-5557",
    "note": null
  }
]
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Client</h2>
{% highlight shell%}
GET /client/{CLIENT_ID}
{% endhighlight %}

Returns all fields for the given client.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the client are returned.</p>
{% highlight json %}
{
  "user_id": "123456",
  "site_id": "987654321",
  "client_id": "1",
  "name": "Client One",
  "email": "clientone@email.com",
  "phone": "555-555-5555",
  "note": null
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create a Client</h2>
{% highlight shell%}
POST /client
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
    <td><code>name</code></td>
    <td>description</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>email</code></td>
    <td>description</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>phone</code></td>
    <td>description</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td><code>note</code></td>
    <td>description</td>
    <td>string</td>
    <td></td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client \
-X POST \
-d '{
      "name": "New Client",
      "email": "newclient@email.com",
      "phone": "555-555-5559"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user_id": "123456",
  "site_id": "987654321",
  "client_id": "4",
  "name": "New Client",
  "email": "newclient@email.com",
  "phone": "555-555-5559",
  "note": null
}         
{% endhighlight %}

<h2>{% include label.html content="put" %} Replace a Client</h2>
{% highlight shell%}
PUT /client/{CLIENT_ID}
{% endhighlight %}

Replaces the given client.


These fields can be replaced:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>description</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>email</code></td>
    <td>description</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>phone</code></td>
    <td>description</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td><code>note</code></td>
    <td>description</td>
    <td>string</td>
    <td></td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/client/1 \
-X PUT \
-d '{
      "name": "New Client One"
      "email": newclientone@email.com
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user_id": "123456",
  "site_id": "987654321",
  "client_id": "1",
  "name": "New Client One",
  "email": "newclientone@email.com",
  "phone": "555-555-5555",
  "note": null
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Client</h2>
{% highlight shell%}
PATCH /client/{CLIENT_ID}
{% endhighlight %}

Updates the given client.


These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>description</td>
    <td>string</td>
  </tr>
  <tr>
    <td><code>email</code></td>
    <td>description</td>
    <td>string</td>
  </tr>
  <tr>
    <td><code>phone</code></td>
    <td>description</td>
    <td>string</td>
  </tr>
  <tr>
    <td><code>note</code></td>
    <td>description</td>
    <td>string</td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/client/2 \
-X PATCH \
-d '{
      "note": "A new note."
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"

{% endhighlight %}

<p class="codeTitle">Example response:</p>
See Fields table. All fields for the client are returned.
{% highlight json %}
{
    "user_id": "123456",
    "site_id": "987654322",
    "client_id": "2",
    "name": "Client Two",
    "email": "clienttwo@email.com",
    "phone": "555-555-5556",
    "note": "A new note."
}
{% endhighlight %}


