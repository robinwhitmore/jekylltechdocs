{% if site.project=="designer" %}[Team members](ds_gs_team_members.html){%elsif site.project=="cloud" %}[Team members](cl_gs_team_members.html){%endif%} are the users internal to your company that need to access the Cloud Admin. Team member users are assigned roles that determine what they can and cannot access in Cloud Admin.

{% if site.project == "platform" %}
{% include custom/shared/note_oauthAPI.html%}
{% endif %}
<h2>Fields</h2>

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
        <td>​<code>reseller_member_id</code></td>
        <td>The unique ID (to this reseller) for this team member.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td>​Full name of a user that has access the Cloud Admin for this reseller.</td>
        <td>string</td>
        <td>X</td>
    </tr>

    <tr>
        <td><code>email</code></td>
        <td>Email for the team member. Weebly Cloud uses the email as the username for logging into the Cloud Admin. An email is sent to this address once creation of a member is complete, with a link to log into the Cloud Admin.</td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
        <td><code>permission</code></td>
        <td>The level of access the team member has in the Cloud Admin.<br>
          ​Valid values are:
          <ul>
            <li><code>admin</code>: Can access all portal functionality. Can view, create, edit, and delete users and team members. Can view, create, edit, log into, and publish websites. Can access account settings and billing information.</li>
          <li><code>technical</code>: Can access all user and site functionality, as well as account settings. Does not have access to team member or billing functionality.</li>
          <li><code>support</code>: Can view and edit users. Has full access to site functionality. Cannot access team member, account settings or billing functionality.</li>
          <li><code>editor</code>: Can only view users and view and edit sites. Cannot access anything else.</li>
          <li><code>finance</code>: Can only access billing functionality. Cannot access anything else.</li>
          </ul>
        </td>
        <td>string</td>
        <td>X</td>
    </tr>
    <tr>
      <td><code>loginLink</code></td>
      <td>A one-time URL link that will direct team members to the Cloud Admin. The link will only work if the reseller account is enabled.</td>
      <td>string</td>
      <td></td>
    </tr>
    <tr>
        <td><code>created_date</code></td>
      <td>Date the team member was created.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    <tr>
        <td><code>updated_date</code></td>
      <td>Date the team member was last updated.</td>
        <td>Unix GMT Timestamp</td>
        <td></td>
    </tr>
    </tbody>
</table>
{% include custom/notes/note_api_undoc.md %}

<h2>{% include label.html content="get" %} Retrieve a List of Team Members</h2>

{% highlight shell %}
GET /team
{% endhighlight %}

Returns all team members for the given {{site.company}}. Only `list` fields are returned.

<p class="codeTitle">Example CURL request returning all team members:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/team \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "members": [
    {
      "reseller_member_id": "1",
      "name": "John Doe",
      "email": "johndoe@email.com",
      "permission": "admin"
    },
    {
      "reseller_member_id": "2",
      "name": "Jane Smith",
      "email": "janesmith@email.com",
      "permission": "support"
    }
  ]
}
{% endhighlight %}

<h2>{% include label.html content="get" %} Retrieve Details for a Team Member</h2>
{% highlight shell%}
GET /team/{RESELLER_MEMBER_ID}
{% endhighlight %}

Returns all fields for the given team member.

<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/team/1 \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
<p>See Fields table. All fields for the team member are returned.</p>
{% highlight json %}
{
  "member":{
      "reseller_member_id": "1",
      "name": "John Doe",
      "email": "johndoe@email.com",
      "permission": "admin"
  }
}
{% endhighlight %}

<h2>{% include label.html content="post" %} Create a Login Link for a Team Member</h2>
{% highlight shell %}
POST /team/{RESELLER_MEMBER_ID}/loginLink
{% endhighlight %}

Creates a Login link for the given team member.

These fields can be created:

<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Type</strong></td>
    </tr>
  <tr>
    <td><code>loginLink</code></td>
    <td>A one-time URL link that will direct team members to the Cloud Admin. The link will only work if the reseller account is enabled.</td>
    <td>string</td>
  </tr>
</table>

<p/>
<p class="codeTitle">Example CURL request:</p>
{% highlight shell%}
curl https://api.weeblycloud.com/team/1/loginLink \
-X POST \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

<p class="codeTitle">Example response:</p>
{% highlight json %}
{
  "link": "http:\/\/www.weeblycloud.com\/admin\/autoLogin.php?code=6cdd0571970186e366f059fbcd5552c2&email=johndoe%40weebly.com"
}
{% endhighlight %}
