## site.update

Occurs when the site is updated. A site can be updated without being published, for example when settings are updated.

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
    <td>User associated with the site being updated.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>Site being updated.​</td>
  </tr>
  <tr>
    <td><code>site_title</code></td>
    <td>string</td>
    <td>Title for the site​</td>
  </tr>
</table>

## site.publish

Occurs when the site is published.

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
    <td>User associated with the site being updated.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>Site being published.​</td>
  </tr>
  <tr>
    <td><code>domain</code></td>
    <td>string</td>
    <td>The fully qualified domain name of the site, if published. ​</td>
  </tr>
</table>

## site.copy

Occurs when the site is copied to create a new site.

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
    <td>User associated with the site being updated.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>Site being copied.​</td>
  </tr>
  <tr>
    <td><code>new_site_id</code></td>
    <td>string</td>
    <td>Site created by the copy event. ​</td>
  </tr>
</table>

## site.delete

Occurs when the site is deleted.

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
    <td>User associated with the site being updated.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>Site being deleted.​</td>
  </tr>
</table>

