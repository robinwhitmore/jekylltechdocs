You can use JavaScript to add events, interactions, and effects to your element.
{% include note.html content="If your element doesn't need JavaScript, you still must create this file and leave it blank." %}

## Editor vs. Published Scripts

Your JavaScript files live in the {%if site.project=="designer"%}[`js` directory](ds_apps_element_folders.html){%elsif site.project=="cloud"%}[`js` directory](cl_apps_element_folders.html){%elsif site.project=="platform"%}[`js` directory](pf_apps_element_folders.html){%endif%} for your element. You need to create a file named `element.js`, which will be used for both the editor and the published site. You can also provide an `editor_element.js` file to be used only within the editor. This allows you to specify different events and interactions for the site owner when working with your element in the editor. This may be necessary when your element requires major interactivity with the user on a published site, as the element placeholder in the editor can handle only basic interaction, such as direct editing.

## JavaScript Structure
We provide a [Backbone View](http://backbonejs.org/#View) as the base class (`PlatformElement.js`) for you to extend to create your element's JavaScript.  This allows you to easily define events for your element using the events hash.
{% include note.html content="If your element doesn't need JavaScript, you still must create this file (but you can leave it blank)." %}

​There are two ways for you to define your element javascript code: extending the base class and providing all your JavaScript in that extended class, or using a self executing anonymous function that allows more flexibility as to where the script lives. Both methods can refer to jQuery (use `$`) and Underscore (use `_` ).

### Base class extension
To extend the base class, call the `extend` method of `PlatformElement`. With this method, all code must be contained within your extended class. You specify an `initialize` method that gets called once your element is placed on the DOM and is ready for event bindings and interaction.
{% highlight js %}
PlatformElement.extend({
    events: {
        "click .button": "clickButton"
    },

    clickButton: function() {
        console.log("Button Clicked!");
        // You can use $ (jQuery) and _(Underscore) in here!
    }
});
{% endhighlight %}

### Self-executing anonymous function
If you use the self executing anonymous function, you can move code outside of the element definition, and you have a bit more flexibility in terms of where you place your code.  You can use the example below as a starting point for your element.

{% highlight js %}
(function(){
    // You can use $ (jQuery) and _ (Underscore) in here!
    // Perform any setup you might need
    var example = 10;

    // Prepare the element
    var myElement = PlatformElement.extend({
        initialized: function(){
        console.log("Element Ready");
        }
    });

    // do some work
    myElement.example = example;

// All done
    return myElement;
}) ();
{% endhighlight %}

{% include custom/notes/note_https.md %}

## Access Settings
Within your JavaScript, you can access element settings using `this.settings`, which acts as a [Backbone Model](http://backbonejs.org/#Model), and the `get` method.  Any settings that are defined as private in your `manifest.json` will not be available to your JavaScript on the published site.  This is for security reasons, and allows you to place API Keys in your settings without exposing them to site visitors.

{% highlight  js %}
PlatformElement.extend({
    initialize.function(){
        this.settings.get("name");
    }
});
{% endhighlight %}

## Update Settings
When in the editor, your JavaScript can update the element settings also using the Backbone Model syntax:
{% highlight js %}
PlatformElement.extend({
    initialize: function(){
        this.settings.set("name", "John Doe");
        this.settings.save().done(function(){
        // This code will run once the settings are successfully saved
        });
    }
});
{% endhighlight %}

{% include note.html content="You can only update settings from the editor and not from the published site.  Attempting to update from the published site causes the `save` call to fail resolving.  You can catch this with the `.fail` chained method on your `save` call." %}

​Once you update settings, you need to re-render the page for the new values to be applied.

## Rerender to Apply Changes
If your element updates its settings, you need to trigger a re-render before the new settings are properly applied to the element in the editor.  We've overridden the `render` method of your element JavaScript.  Simply call `render` to trigger a rerender.  Once the rerender is complete, your element is in a fresh new state, and your `initialize` method is rerun.

{% highlight js %}
PlatformElement.extend({
    events: {
        "click .button": "clickButton"
    },

    clickButton: function(){
        this.render(); // Triggers a re-render
    }
});
{% endhighlight %}

{% include note.html content="Triggering a rerender destroys the DOM nodes for your element and regenerates them.  This means that triggering the `render` method will interrupt any other JavaScript flow within the method, essentially acting as a return." %}
{% include note.html content="Calling the `render` method from within your `initialize` method will cause an infinite loop. This is because the editor will destroy and regenerate the DOM nodes repeatedly. Be careful not to do this!" %}

## Include Additional Data
You can access additional data in your JavaScript. This data is accessed similarly to settings, using mustache \{{squiggles}}. You can access the following:

* `assets_path`: The HTTP accessible root path to your elements' assets folder, in protocol-agnostic form.  The path contains the trailing slash.  It is accessible as a property of your element:
{% highlight js %}
PlatformElement.extend({
    initialize: function(){
    console.log(this.assets_path);
    }
});
{% endhighlight %}
* `element_id`, `user_id`, `site_id`: We also expose some identifying information about the current user, site, and element. The `element_id`  is the unique element ID for this element instance. The `user_id` and the `site_id` are the unique identifiers for the current user and site.
{% highlight js %}
PlatformElement.extend({
    initialize: function(){
    console.log(this.element_id);
    }
});
{% endhighlight %}

{% include note.html content="We cannot guarantee that `element_id` and `site_id` will be universally unique. We recommend that you use a composite key for any storage you may be doing on your servers or services!" %}
