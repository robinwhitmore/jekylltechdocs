## blog.create

Occurs when a user creates a blog.


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
        <td>User associated with the site containing the blog.​</td>
    </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the blog</td>
  </tr>
  <tr>
    <td><code>blog_id</code></td>
    <td>string</td>
    <td>​Blog that was created.</td>
  </tr>
</table>

## blog.delete

Occurs when a user deletes a blog.


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
    <td>User associated with the site containing the blog.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the blog</td>
  </tr>
  <tr>
    <td><code>blog_id</code></td>
    <td>string</td>
    <td>​Blog that was deleted.</td>
  </tr>
</table>

## blog.post.create

Occurs when a user creates a blog post for a blog.


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
    <td>User associated with the site containing the blog.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the blog</td>
  </tr>
  <tr>
    <td><code>blog_id</code></td>
    <td>string</td>
    <td>​Blog that contians the post.</td>
  </tr>
  <tr>
    <td><code>post_id</code></td>
    <td>string</td>
    <td>​Blog post that was created.</td>
  </tr>
</table>

## blog.post.delete

Occurs when a user deletes a blog post.


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
    <td>User associated with the site containing the blog.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the blog</td>
  </tr>
  <tr>
    <td><code>blog_id</code></td>
    <td>string</td>
    <td>​Blog that contians the post.</td>
  </tr>
  <tr>
    <td><code>post_id</code></td>
    <td>string</td>
    <td>​Blog post that was deleted.</td>
  </tr>
</table>

## blog.post.update

Occurs when a user updates a blog post.


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
    <td>User associated with the site containing the blog.​</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the blog</td>
  </tr>
  <tr>
    <td><code>blog_id</code></td>
    <td>string</td>
    <td>​Blog that contians the post.</td>
  </tr>
  <tr>
    <td><code>post_id</code></td>
    <td>string</td>
    <td>​Blog post that was updated.</td>
  </tr>
</table>
