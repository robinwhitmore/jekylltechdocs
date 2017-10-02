## JavaScript
By default, JavaScript is not currently enabled in themes. If you’d like to use JavaScript you can, but be aware of the following issues:

### Using `$` to access JQuery​
​Weebly uses the Prototype JavaScript framework, which also uses `$`. Using `$` to access JQuery will not work.
If you need to use JQuery, we recommend the following:

{% highlight js %}
// closure
(function($) {
    $('#foo').doThatThing();
)(jQuery);
{% endhighlight %}
​
and

{% highlight js %}
// dom:ready
jQuery(function($) {
    $('#foo').doThatThing();
});
​​{% endhighlight %}

### Display in the editor
In the editor, the site’s markup will not be present when the DOM `ready` event fires. So while in the editor, your JavaScript may not execute as you expect.
​
### Event handlers persist after switching themes
If your JavaScript registers handlers (say for example, for `onClick`), those handlers remain loaded even if the user switches themes. To avoid this, the handler should check the current theme first.

### Can't use RequireJS
Both RequireJS and Weebly use `window.required()`, and so one might overwrite the other. You cannot use RequireJS at this point.