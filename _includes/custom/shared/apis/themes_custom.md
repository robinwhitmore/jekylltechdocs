The Custom Cloud Theme API provides methods for managing any custom Cloud themes you have {% if site.project=="designer" %}[created](ds_themes_start.html){%elsif site.project=="cloud" %}[created](cl_themes_start.html){%endif%}.

​If you want to manage your themes for a particular user, see the {% if site.project=="designer" %}[Theme (User) API](ds_api_themes_user.html){%elsif site.project=="cloud" %}[Theme (User) API](cl_api_themes_user.html){%endif%}.

<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, those that are required for `POST`, and those that are changeable using `PATCH` . All fields are returned when you retrieve a single item.
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
        <td>​<code>theme_id</code></td>
        <td>The unique ID of the custom theme.</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>reseller_id</code></td>
        <td>ID of the {{site.company}}​</td>
        <td>integer</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>

    <tr>
        <td><code>theme_name</code></td>
        <td>Name given to the theme.</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
      <td><code>theme_zip</code></td>
      <td>Publicly accessible URL that points to the zip file containing the theme contents. This is only used when uploading a theme.</td>
      <td>string</td>
      <td>X</td>
      <td>X</td>
      <td></td>
    </tr>
    <tr>
        <td><code>theme_properties</code></td>
      <td>A JSON object that represents properties that have been {% if site.project=="designer" %}<a href="">configured</a>{% elsif site.project=="cloud" %}<a href="">configured</a>{% endif %} for the theme.<br> 
          Includes the following:
          <ul>
            <li><code>custom_theme_id</code>: The unique ID of the custom theme.</li>
            <li><code>property</code>: The property that has been configured.</li>
            <li><code>value</code>: The value of the property</li>
          </ul>
        </td>
        <td>array</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>theme_var_definitions</code></td>
        <td>An array of JSON objects that represent theme variable definitions.<br>
        Includes the following:
          <ul>
            <li><code>custom_theme_id</code>: The unique ID of the custom theme.</li>
            <li><code>var_name</code>: Variable's name.</li>
            <li><code>var_definition</code>: The variable's value.</li>
          </ul>
        </td>
        <td>array</td>
        <td>X</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
      <td>Date the theme was added.</td>
        <td>Unix GMT Timestamp</td>
        <td>X</td>
        <td><br>
        </td>
        <td><br>
        </td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
      <td>Date the theme was last updated.</td>
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

<h2>{% include label.html content="get" %} Retrieve a List of Custom Themes</h2>

{% highlight shell%}
GET /themes
{% endhighlight %}

Returns all custom themes.

<p class="codeTitle">Example CURL request returning all themes:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/themes \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
[
  {
    "custom_theme_id": 1532272242,
    "reseller_id": 2068059156,
    "theme_name": "New Name",
    "created_date": 1509138085,
    "updated_date": 1509138085,
    "theme_properties": [
      {
        "custom_theme_id": "1532272242",
        "property": "screenshot_path",
        "value": "\/weebly\/uploads\/reseller\/assets\/2068059156\/custom_themes\/1532272242\/files\/screenshot.png"
      }
    ],
    "theme_var_definitions": [
      {
        "custom_theme_id": "1532272242",
        "var_name": "has_customizable_background",
        "var_definition": "1"
      },
      {
        "custom_theme_id": "1532272242",
        "var_name": "layouts",
        "var_definition": "[\"header\",\"no-header\",\"splash\"]"
      },
      {
        "custom_theme_id": "1532272242",
        "var_name": "layout_icons",
        "var_definition": "[]"  
      }
    ]
  }
]
{% endhighlight %}

<h2>{% include label.html content="post" %} Add a Custom Theme</h2>
{% highlight shell%}
POST /themes
{% endhighlight %}

Uploads a custom theme.

These fields can be created:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <tr>
    <td><code>theme_name</code></td>
    <td>Name given to the theme.</td>
    <td>string</td>
  </tr>
  <tr>
    <td><code>theme_zip</code></td>
    <td>Publicly accessible URL that points to the zip file containing the theme contents. This is only used when uploading a theme.</td>
    <td>string</td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/themes \
-X POST \
-d '{
      "theme_name": "Green Monster",
      "theme_zip": "https:\/\/myhost.com\/greenmonster.zip"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "theme_id": "328910311176743925"
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a Custom Theme</h2>
{% highlight shell%}
PATCH /themes/{THEME_ID}
{% endhighlight %}

Updates the given theme.

These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <tr>
    <td><code>theme_name</code></td>
    <td>Name given to the theme.</td>
    <td>string</td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/themes/1234567 \
-X PATCH \
-d '{
      theme_name: New Name
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "theme_id": 1234567
}
{% endhighlight %}

<h2>{% include label.html content="delete" %} Delete a Custom Theme</h2>
{% highlight shell%}
DELETE /themes/{THEME_ID}
{% endhighlight %}

Deletes the given theme.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/themes/1234567 \
-X DELETE \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

**Response**
There is no response to a delete request.
