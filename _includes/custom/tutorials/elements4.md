The manifest provides the metadata needed for the element to work correctly, both in the editor and when published.

1. Create a JSON file named manifest.json and save it to the PriceChart root directory.
2. Add the following properties:
   * `manifest` = `1`
   * `client_id` = the client ID listed for the app, as created when we registered your app.
   * `version` = the version for the app, in this case `1.0.0`.
   * `elements:` =
     * `name` = `Price Chart`. This is the name that will be displayed in the sidebar of the editor.
     * `path` = the subdirectory for the element, in this case `files`.
     * `version` = the version for the element, in this case, `1.0.0` (the app and the element can be different versions).

For example:
{% highlight json %}
{
    “manifest”: “1”,
    “client_id”: “123456”,
    “version”: “1.0.0”,
    “elements”:[{
        “name”: “Price Chart”,
        “path”: “files”,
        “version”: “1.0.0”
    }]
}
{% endhighlight %}