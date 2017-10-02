Weebly themes support using [LESS](http://lesscss.org/#) for styling. LESS is a pre-processor for CSS. It extends CSS, so your stylesheet uses the same classes, pseudo-classes, IDs, etc. as standard CSS, but with added functionality.

## Variables

You can define variables to be used in your stylesheet. For example:

{% highlight css %}
@orange: #FF9933;
@blue: #6699FF;
...
#header {
    background: @orange;
}
{% endhighlight %}

This results in:

{%highlight css%}
#header {
    background: #FF9933;
}
{%endhighlight%}

If your theme has multiple {% if site.project=="designer" %}[color variations](ds_themes_variations.html){%elsif site.project=="cloud" %}[color variations](cl_themes_variations.html){%elsif site.project=="platform" %}[color variations](pf_themes_variations.html){%endif%}, you use variables to define the properties that will change color with each variation.


## Mixins

Mixins allow you to include properties from one rule-set into another.

For example, you might create this class:

{%highlight css%}
.serif{
    font-family: Georgia, 'Times New Roman', serif;
}
{%endhighlight%}

And use it the following way:

{%highlight css%}
p {
    font-size: 15px;
    .serif;
}
{% endhighlight %}

## Nested Rules

You can nest a number of rules into one.

For example, instead of this:

{% highlight css%}
#banner {
    display: table;
    color: #ffffff;
}

#banner .content {
    text-align: center;
}
{% endhighlight %}

You can do this:

{% highlight css%}
#banner {
    display: table;
    color: #ffffff;
    .content{
        text-align: center;
    }
}
{% endhighlight %}


## Operations and Functions

LESS allows you to manipulate values using variables and math. For example, you can lighten or darken colors using percentages, or you might make sizes relative to each other.

For example:

{%highlight css%}
@textColor: #0000FF
@baseFontSize: 12px;

a:hover {
    color: lighten(@textColor, 25%);
}

blockquote {
    font-size: @baseFontSize + 6;
    color: darken(@textColor, 50%);
}
{%endhighlight%}
