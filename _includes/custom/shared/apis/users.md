{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

The following table shows all fields that exist for this API, those that are required for `PUT` and `POST`, and those that are changeable using `PATCH` and `PUT`. All fields are returned when you retrieve a single item.
<table>
    <tbody>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Required</strong></td>
        <td><strong>Changeable</strong></td>
    </tr>
    <tr>
        <td>​<code>user_id</code></td>
        <td>The unique ID of the given user</td>
        <td>string</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><code>email</code></td>
        <td>User's email. This is user name.​</td>
        <td>string</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>language</code></td>
        <td>A two letter language code to set the user's default language.<br>
          The supported languages with their two character codes:
          <ul>
            <li><code>da</code>: Danish</li>
          <li><code>de</code>: German</li>
            <li><code>en</code>: English</li>
            <li><code>es</code>: Spanish</li>
            <li><code>fr</code>: French</li>
            <li><code>it</code>: Italian</li>
            <li><code>ja</code>: Japanese</li>
          <li><code>nl</code>: Dutch</li>
          <li><code>no</code>: Norwegian</li>
            <li><code>pl</code>: Polish</li>
          <li><code>pt</code>: Portuguese</li>
            <li><code>ru</code>: Russian</li>
          <li><code>sv</code>: Swedish</li>
            <li><code>tr</code>: Turkish</li>
            <li><code>zh</code>: Chinese (simplified)</li>
        </ul>
        </td>
        <td>string</td>
        <td></td>
        <td>X</td>
    </tr>
    {% if site.project=="cloud" %}
    <tr>
        <td><code>test_mode</code></td>
        <td>Denotes whether a user is a test user or not. Test users are meant to be used when testing the API or general Weebly Cloud functionality. When <code>true</code>, a user will be created in test mode and the account will not be charged.
        </td>
        <td>boolean</td>
        <td></td>
        <td>X</td>
    </tr>
    {% endif %}
    <tr>
      <td><code>loginLink</code></td>
      <td>A one-time link that will direct users to the editor for the last site that was modified in the account. The link will only work if the user account is enabled and has at least one site associated with it. </td>
      <td>string</td>
      <td></td>
      <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve Details for a User</h2>
{% highlight shell%}
{% if site.project == "platform" %}
GET /v1/user/{USER_ID}/

{% else %}
GET /user/{USER_ID}
{% endif %}
{% endhighlight %}

Returns all fields for the given user.
{% if site.project == "platform" %}
<br>
**scope:** no scope required
{% endif %}

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
{% if site.project == "platform" %}
curl --request GET \
--url https://api.weebly.com/v1/user \
--header 'accept: application/vnd.weebly.v1+json' \
--header 'content-type: application/json' \
--header 'x-weebly-access-token: [YOUR_TOKEN]"

{% else %}
curl https://api.weeblycloud.com/user/123456 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endif %}
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the user are returned.</p>
{% highlight json %}
{
  "user": {
    "user_id": 123456,    
    "email": "sampleuser@weebly.com",{% if site.project=="cloud" %}
    "test_mode": true,{% endif %}
    "language": "en"
  }
}
{% endhighlight %}

{% if site.project == "cloud" or "designer" %}
<h2>{% include label.html content="post" %} Create a User</h2>
{% highlight shell %}
POST /user
{% endhighlight %}

Creates a User.

These fields can be created:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
  <tr>
    <td><code>email</code></td>
    <td>User's email. This is user name.​</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>language</code></td>
    <td>A two letter language code to set the user's default language.<br>
      The supported languages with their two character codes:
      <ul>
        <li><code>da</code>: Danish</li>
        <li><code>de</code>: German</li>
        <li><code>en</code>: English</li>
        <li><code>es</code>: Spanish</li>
        <li><code>fr</code>: French</li>
        <li><code>it</code>: Italian</li>
        <li><code>ja</code>: Japanese</li>
        <li><code>nl</code>: Dutch</li>
        <li><code>no</code>: Norwegian</li>
        <li><code>pl</code>: Polish</li>
        <li><code>pt</code>: Portuguese</li>
        <li><code>ru</code>: Russian</li>
        <li><code>sv</code>: Swedish</li>
        <li><code>tr</code>: Turkish</li>
        <li><code>zh</code>: Chinese (simplified)</li>
      </ul>
    </td>
    <td>string</td>
    <td></td>
  </tr>
  {% if site.project=="cloud" %}
  <tr>
    <td><code>test_mode</code></td>
    <td>Denotes whether a user is a test user or not. Test users are meant to be used when testing the API or general Weebly Cloud functionality. When <code>true</code>, a user will be created in test mode and the account will not be charged.
    </td>
    <td>boolean</td>
    <td></td>
  </tr>
  {% endif %}
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user \
-X POST \
-d '{
      "email": "test@weebly.com",
      "language": "en"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user": {
    "user_id": "123456",
    "email": "test@weebly.com",{% if site.project=="cloud" %}
    "test_mode": true,{% endif %}
    "language": "en"
  }
}

{% endhighlight %}

<h2>{% include label.html content="put" %} Replace a User</h2>
{% highlight shell%}

PUT /user/{USER_ID}
{% endhighlight %}

Replaces the given user.

These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Notes</strong></td>
    </tr>
  <tr>
    <td><code>email</code></td>
    <td>User's email. This is user name.​</td>
    <td>string</td>
    <td>Required</td>
  </tr>
  <tr>
    <td><code>language</code></td>
    <td>A two letter language code to set the user's default language.<br>
      The supported languages with their two character codes:
      <ul>
        <li><code>da</code>: Danish</li>
        <li><code>de</code>: German</li>
        <li><code>en</code>: English</li>
        <li><code>es</code>: Spanish</li>
        <li><code>fr</code>: French</li>
        <li><code>it</code>: Italian</li>
        <li><code>ja</code>: Japanese</li>
        <li><code>nl</code>: Dutch</li>
        <li><code>no</code>: Norwegian</li>
        <li><code>pl</code>: Polish</li>
        <li><code>pt</code>: Portuguese</li>
        <li><code>ru</code>: Russian</li>
        <li><code>sv</code>: Swedish</li>
        <li><code>tr</code>: Turkish</li>
        <li><code>zh</code>: Chinese (simplified)</li>
      </ul>
    </td>
    <td>string</td>
    <td></td>
  </tr>
  {% if site.project=="cloud" %}
  <tr>
    <td><code>test_mode</code></td>
    <td>Denotes whether a user is a test user or not. Test users are meant to be used when testing the API or general Weebly Cloud functionality. When <code>true</code>, a user will be created in test mode and the account will not be charged.
    </td>
    <td>boolean</td>
    <td>Required</td>
  </tr>
  {% endif %}
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/123456 \
-X PUT \
-d '{
      "email": "test9999@weebly.com",
      "language": "en"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user": {
    "email": "test9999@weebly.com",{% if site.project=="cloud" %}
    "test_mode": true,{% endif %}
    "language": "en"
  }
}
{% endhighlight %}

<h2>{% include label.html content="patch" %} Update a User</h2>
{% highlight shell%}
PATCH /user/{USER_ID}
{% endhighlight %}

Updates the given user.

These fields can be updated:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <tr>
    <td><code>email</code></td>
    <td>User's email. This is user name.​</td>
    <td>string</td>
  </tr>
  <tr>
    <td><code>language</code></td>
    <td>A two letter language code to set the user's default language.<br>
      The supported languages with their two character codes:
      <ul>
        <li><code>da</code>: Danish</li>
        <li><code>de</code>: German</li>
        <li><code>en</code>: English</li>
        <li><code>es</code>: Spanish</li>
        <li><code>fr</code>: French</li>
        <li><code>it</code>: Italian</li>
        <li><code>ja</code>: Japanese</li>
        <li><code>nl</code>: Dutch</li>
        <li><code>no</code>: Norwegian</li>
        <li><code>pl</code>: Polish</li>
        <li><code>pt</code>: Portuguese</li>
        <li><code>ru</code>: Russian</li>
        <li><code>sv</code>: Swedish</li>
        <li><code>tr</code>: Turkish</li>
        <li><code>zh</code>: Chinese (simplified)</li>
      </ul>
    </td>
    <td>string</td>
  </tr>
  {% if site.project=="cloud" %}
  <tr>
    <td><code>test_mode</code></td>
    <td>Denotes whether a user is a test user or not. Test users are meant to be used when testing the API or general Weebly Cloud functionality. When <code>true</code>, a user will be created in test mode and the account will not be charged.
    </td>
    <td>boolean</td>
  </tr>
  {% endif %}
</table>

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}

curl https://api.weeblycloud.com/user/987654321 \
-X PATCH \
-d '{
      "email": "test9@weebly.com"
    }' \
-H "Content-type: application/json" \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "user": {
    "email": "test9@weebly.com",{% if site.project=="cloud" %}
    "test_mode": true,{% endif %}
    "language": "en"
  }
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Enable a User</h2>
{% highlight shell %}
POST /user/{USER_ID}/enable
{% endhighlight %}

Enables a user account after an account has been disabled. Enabling a user account will allow users to log into the editor. When a user is created, their account is automatically enabled.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/987654321/enable \
-X POST \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "success": true
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Disable a User</h2>
{% highlight shell %}
POST /user/{USER_ID}/disable
{% endhighlight %}

Disables a user account. When a user account is disabled, the user will no longer be able to log into the editor. If an attempt to create a login link is made on a disabled account, an error is thrown.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/987654321/disable \
-X POST \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
"success": true
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create a Login Link</h2>
{% highlight shell %}
POST /user/{USER_ID}/loginLink
{% endhighlight %}

Generates a one-time link that will direct users to the editor for the last site that was modified in the account. This method requires that the account is enabled and that the account has at least one site.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/user/987654321/loginLink \
-X POST \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "link": "http://www.weebly.com/editor/login.php?t=c4e48646d7943bdaab0992fdbb5c9594&redirect=toSite.php%3Fsite=682490944919028999"
}
{% endhighlight %}
{% endif %}
