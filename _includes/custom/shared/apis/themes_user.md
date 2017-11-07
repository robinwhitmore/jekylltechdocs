The Theme API provides methods for managing and creating Weebly themes for a given Cloud user.

​If you want to manage your custom themes, use the {% if site.project=="designer" %}[Theme (User) API](ds_api_themes_cloud.html){%elsif site.project=="cloud" %}[Theme (User) API](cl_api_themes_cloud.html){%endif%}.
​
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are returned when you retrieve a list, and those that are required for `POST`. 
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>List</strong></td>
        <td><strong>Required</strong></td>
    </tr>
    <tr>
        <td>​<code>theme_id</code></td>
        <td>The unique ID of the theme</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>theme_name</code></td>
        <td>Name given to a theme.​</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>

    <tr>
        <td><code>date_created</code></td>
        <td>Timestamp of when the theme was added to the user's account.</td>
        <td>string</td>
        <td>X</td>
        <td></td>
    </tr>
    <tr>
        <td><code>is_custom</code></td>
        <td>Whether or not the theme is a custom theme. Custom themes are added by a user or added by you via the Cloud Admin or {% if site.project=="designer" %}[Theme (Custom) API](ds_api_themes_cloud.html){%elsif site.project=="cloud" %}[Theme (Custom) API](cl_api_themes_cloud.html){%endif%}</td>
        <td>boolean</td>
        <td>X</td>
        <td></td>

    </tr>
    <tr>
        <td><code>theme_zip</code></td>
        <td>Publicly accessible URL that points to the zip file containing the theme contents. Only used when adding a theme to a site.
        </td>
        <td>string</td>
        <td></td>
        <td>X</td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Themes for the User</h2>
{% highlight shell %}
GET /user/USER_ID/theme
{% endhighlight %}

Returns all themes available to the given user.

<p class="codeTitle">Example CURL request returning all available themes:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/123456/theme \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"

{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "data": [
    {
      "theme_id": "43829593181038559",
      "theme_name": "Light",
      "date_created": "2012-06-06 01:07:53",
      "is_custom": false
    },
    {
      "theme_id": "617936838395342932",
      "theme_name": "Enterprise",
      "date_created": "2013-01-09 13:41:39",
      "is_custom": false
    }
  ]
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Make a Theme Available to a User</h2>
{% highlight shell%}
POST /user/USER_ID/theme
{% endhighlight %}

Creates a new theme in the user account.

{% capture theme_url_note %}
"The URL for <code>theme_zip</code> must be publicly accessible and follow the structure for {% if site.project=="designer" %}<a href="ds_themes_directory.html">custom themes</a>{% elsif site.project=="cloud" %}<a href="cl_themes_directory.html">custom themes</a>{% endif %}."
{% endcapture%}

{% include note.html content=theme_url_note %}

These fields can be created:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <tr>
    <td><code>theme_zip</code></td>
    <td>Publicly accessible URL that points to the zip file containing the theme contents. Only used when adding a theme to a site.
    </td>
    <td>string</td>
  </tr>
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/123456/theme \
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

<h2>{% include label.html content="post" %} Apply a Theme to a Site</h2>
{% highlight shell%}
PUT /user/USER_ID/site/{SITE_ID}/theme

{% endhighlight %}

Sets the theme for a given site. This theme change takes place immediately, but won't be seen on the published site until next publish. An `is_custom` flag is required in order to distinguish between Weebly themes and custom themes.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/123456/site/987654321/theme \
-X POST \
-d '{
      "theme_id": "328910311176743925",
      "is_custom": true
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

