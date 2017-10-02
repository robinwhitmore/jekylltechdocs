## `layout.tpl`

This is the main blog partial that displays the sidebar and the content of the blog.
{% include image.html file="partial_blog_layout.png" caption="layout.tpl partial" %}

## `/comments`

The partials in this directory are used to display the comments to a blog post. The comments directory contains these partials:

* `list.tpl`
* `reply-button.tpl`


{% include image.html file="partial_blog_comments.png" caption="Blog comments partials" %}

## `/modules`

The partials in this directory provide the content that appears in the sidebar of a blog. The modules directory includes these partials:

* `archives.tpl`
* `categories.tpl`
* `rss.tpl`
{% include image.html file="partial_blog_modules.png" caption="Blog sidebar partials" %}

## `more-break.tpl`

This partial provides the "Read More" link that appears on the main page, where only a preview of the blog appears.
{% include image.html file="partial_blog_more.png" caption="More partial" %}


## `pagination.tpl`

Provides the Next and Forward links at the bottom of a blog post.
{% include image.html file="partial_blog_page.png" caption="Pagination partial" %}


## `post.tpl`

Partial for the blog post, including title, date, comment count, separator, and post content.
{% include image.html file="partial_blog_post.png" caption="Blog post partial" %}