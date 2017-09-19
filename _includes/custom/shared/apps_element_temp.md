All templates make use of [Mustache](http://mustache.github.io/mustache.5.html) for the templating language. Your template can include static HTML and the following dynamic content:
* **Content fields**: You can insert text, button, and image components that the user can edit.
* **Settings**: You can access values for {%if site.project=="designer"%}[settings](ds_apps_element_settings.html) {%elsif site.project=="cloud"%}[settings](cl_apps_element_settings.html){%elsif site.project="platform" %}[settings](pf_apps_element_settings.html){%endif%} that the user has set on the element (you create settings in the manifest file).
* **Data**: Your template can include the values for the element, user, and site IDs, as well as the path to the element assets.

## Editor vs. Published Templates

Templates (`.tpl` files) are located in an {%if site.project=="designer"%}[html folder](ds_apps_element_folders.html){%elsif site.project=="cloud"%}[html folder](cl_apps_element_folders.html){%elsif site.project=="platform"%}[html folder](pf_apps_element_folders.html){%endif%} in the root of your element.  You need to create at least one template named `element.tpl`, which will be used for both the editor and the published site.  You can also provide an `editor_element.tpl` file to be used only within the editor.  This allows you to specify a different UI (or an augmented UI) within the editor. This may be necessary when your element requires major interactivity with the user on a published site, as the element placeholder in the editor can handle only basic interaction, such as direct editing.

## Add Content Fields

​Content fields are small sections of your element that are directly editable by the user.  They make use of existing Weebly components, providing a consistent UI between your element and the Weebly ecosystem. ​Weebly supports four types of content fields:
* text
* image
* button
* content (which allows the user to drag elements into this element).

This example shows the syntax for defining a field:
{% highlight html %}
<div class="example">
    {unique_name:field_type default="Default Text Here"}
</div>
{% endhighlight %}

For example:
{% highlight html %}
<div class="example">
    {name:text default="Put your name here"}
</div>
{% endhighlight %}

Every content field must have a unique name. If two content fields share a name, only the first one will act as an editable content field, with the other remaining as text within the element.
​
{% include note.html content="The DOM structure generated for the element differs between the editor and published sites.  You need to account for both DOM structures when styling your element." %}

If you want to be able to hide/display different areas of content at a time, then use CSS to set visibility and any content set to visible will be displayed. You can also set a width on the content area, for example, `{myContentArea:content width="50%"}`. If a user moves or copies a `{content}` field, all child elements will get moved/copied as well.

## Access Settings

Within your template(s), you can access element settings using Mustache tags.  Each setting is represented by the `name` attribute specified in the manifest.json.

When accessing settings, you can generate unique names for the content fields by using element settings as part of the name. For example, `{name_{{setting1}}:text}` and `{name_{{setting2}}:text} `are unique.

For example, the Price Chart allows the user to set Plan names. Plans have manifest entry like this:
{% highlight json %}
"properties": [{
{
    "name": "plans",
    "label": "Plans",
    "type": "int",
    "default": 3,
    "step": 1,
    "min": 1,
    "tooltip": "Select the number of plans to display."
},
. . .
}]
{% endhighlight %}

The template for the Price Chart uses this to create that text field:
{% highlight html %}
{% raw %}
<div class="example">
    {name_{{plans}}:text default="Plan Name"}
</div>
{% endraw %}
{% endhighlight %}


You need to be careful when using a setting value within a Content Field. <code>&#123;&#123;&#123;setting_name&#125;&#125;_field:text&#125;</code> is an invalid field!  This is because the template system can't discern whether you're trying to use an unescaped [Mustache tag](http://mustache.github.io/mustache.5.html#TAG-TYPES), or using a standard tag within one of our content fields.  To mitigate this, always start content field names with a static sting: <code>&#123;some_prefix_&#123;&#123;setting_name&#125;&#125;:text&#125;</code>.

​For any integer settings, we generate a iterable value for you, allowing you to perform loops within your templates. For any integer setting with a value less than 100, we generate an iterable setting item with the same name as your setting, appended with _each.  Within your loop, you can access the current index with the setting name appended with _index.

For example, using the above manifest entry for plans, you can iterate over the instances like this:
{% highlight html %}
{% raw %}
<div class="example">
    {{#plans_each}}
    {name_{{plans_index}}:text default="Plan Name"}
    {{/plans_each}}
</div>
{% endraw %}
{% endhighlight %}

{% include note.html content="There is potential for name collisions here! If you have a setting named `plans`, and also a setting named `plans_each`, we will not generate the iterable value for you!" %}
{% include note.html content="We will not generate loops for values that are greater than 100, for performance reasons.  If you have a setting that you intend to use as a loop, be sure to set appropriate minimums and maximums!" %}

## Access Additional Data

Within your template, you also have access to additional data.  Every piece of data is accessed in a similar way to settings, using mustache tags.  You can access the following:

* `assets_path`: This is the HTTP accessible root path to your elements' `assets` folder, in protocol-agnostic form. The path contains the trailing slash.
{% highlight html %}
   <div class="example">
     <img src="{{assets_path}}your_image.png" />
   </div>
{% endhighlight %}

{% include note.html content="If you provide a setting named `assets_path` in your manifest, it will be overridden with this value." %}

* `element_id`, `user_id`, `site_id`: These are the respective ID's for the current user, site, and element instance.  You can access these in your templates using standard Mustache syntax:
{% highlight html %}
{% raw %}
<div class="example">
    {{user_id}} - {{site_id}} - {{element_id}}
</div>
{% endraw %}
{% endhighlight %}

{% include note.html content="We can not guarantee that `element_id` and `site_id` will be universally unique.  We recommend that you use a composite key for any storage you may be doing on your servers or services!" %}

## Use IFrames

If your element contains an iframe, we will automatically add an additional invisible overlay `div` for your element. This `div` ensures that Weebly users will have a clickable target for accessing settings. Once the settings panel is opened, the overlay is removed so that users can interact with your iframe.
{% include note.html content="If you dynamically add an iframe after page load, our system may not properly add an overlay `div`.  This will cause users to be unable to access your element settings!  Please try to avoid dynamically creating iframes during the lifecycle of your element." %}


