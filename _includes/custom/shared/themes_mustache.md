Mustache is "logic-less" because there are only tags that are replaced with a value or a series of values. In Weebly, Mustache tags are used in {% if site.project=="designer" %}[partials](ds_themes_partials.html){%elsif site.project=="cloud" %}[partials](cl_themes_partials.html){%elsif site.project=="platform" %}[partials](pf_themes_partials.html){%endif%} to provide content like product information for a page.

## A Quick Example

A typical Mustache template:

{% highlight html %}
{%raw%}
Customer Name: {{name}}
Thanks for placing Order #{{order_no}}!
Your shipping will be:
{{#overnight}}
Fedex Overnight: ${{shipping_cost}}
{{/overnight}}
{%endraw%}
{%endhighlight%}


Given the following hash:

{%highlight sh%}
{
"name": "Chris",
"order_no": 1234,
"shipping_cost": 20,
"overnight": true
}
{%endhighlight sh%}

Will produce the following:
{%highlight sh%}
Customer Name: Chris
Thanks for placing Order #1234!
Your shipping will be:
Fedex Overnight: $20
{%endhighlight%}

## Tag Types

Tags are indicated by the double brackets. In the above example, `{%raw%}{{name}}{%endraw%}` is a variable tag that gets replaced by the given content `Chris.`

## Sections

Sections can display a block of text one or more times, in other words, can iterate over a list. You use the hash (#) to start a section and a slash (/) to end it. If the key exists and has a non-false value, the HTML between the pound and slash will be rendered once for each item in the list. If the list is empty or false, then whatever is between the # and / is not displayed. If the value is not a list, but a single item, then that single value displays.

For example, in the Archives partial in Weebly themes, the `#items` section is used on blog pages:

{%highlight html%}
{%raw%}
{{#items}}
    <a href="{{url}}" class="blog-link">{{title}}</a>
    <br />
{{/items}}
{%endraw%}
{%endhighlight%}

It displays a list of monthly blog post titles as links.

You can also display inverted sections, in other words the inverse of the value of the tag. Inverted sections start with a caret (^) and end with a slash (/).

For example, the Archives partial contains an inverted section (`#t1`) after the `#items` section to display text if no blog post titles exist:
{%highlight html%}
{%raw%}
{{^items}}
    {{#tl}}No Archives{{/tl}}
{{/items}}
{%endraw%}
{%endhighlight%}


## Comments

Comments begin with a bang (!). Anything following that is ignored. Many Weebly partials contain comments to describe what the partial is used for:

{%highlight html%}
{%raw%}
{{!
An area that shows the various months of blog post archives.
Most likely in the sidebar the blog sidebar.
}}
{%endraw%}
{%endhighlight%}

## Partials

Partials can be nested in other partials, using the greater than sign (>). For example, the Main partial used to display products actually calls other partials for the content:

{%highlight html%}
{%raw%}
<div id="wsite-com-product-area">
    {{> commerce/product/images}}
    <div id="wsite-com-product-info">
        <div id="wsite-com-product-info-inner">
            {{> commerce/product/title}}
            {{> commerce/product/sku}}
            {{> commerce/product/price}}
            {{> commerce/product/short-description}}
            {{> commerce/product/sharing}}
            {{> commerce/product/options}}
            <div id="wsite-com-product-inventory">
                {{> commerce/product/quantity}}
                {{> commerce/product/inventory}}
            </div>
            . . .
        </div>
    </div>
</div>
{%endraw%}
{% endhighlight %}