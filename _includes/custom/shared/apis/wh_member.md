## member.register

Occurs when a new user registers at the site.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
    <tr>
        <td><strong>Field</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Definition</strong></td>
    </tr>
    <tr>
        <td><code>user_id</code></td>
        <td>string</td>
        <td>User associated with the site owner​.</td>
    </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site with membership.</td>
  </tr>
  <tr>
    <td><code>site_member_id</code></td>
    <td>string</td>
    <td>​User that is registering to become a member of the site.</td>
  </tr>
</table>

## member.update

Occurs when a registered member is updated, for example when they've been approved, or if the pages they can access have been changed.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>User associated with the site owner​.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site with membership.</td>
  </tr>
  <tr>
    <td><code>site_member_id</code></td>
    <td>string</td>
    <td>Member that was updated.</td>
  </tr>
</table>

## member.destroy

Occurs when a registered member is deleted from the site.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>User associated with the site owner​.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site with membership.</td>
  </tr>
  <tr>
    <td><code>site_member_id</code></td>
    <td>string</td>
    <td>Member that was removed.</td>
  </tr>
</table>
