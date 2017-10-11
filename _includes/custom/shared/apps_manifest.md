Create your manifest with the following elements:

* `manifest`: (required)
   The version of the Weebly Platform API your application was built to work with.  The only currently supported value is `1`.
{% if site.project=="platform" %}
* `client_id`: (required if using the RubyGem) <!--todo: platform link-->
   The `client_id` of your application. The value is created when you register<!--todo: platform link--> your app.
{% endif %}
* `version`: (required)
   The version of your application.  Provided as a string, following Semantic Versioning guidelines (`Major.Minor.Patch`: for example `1.5.13`).

* `locale`: (optional)
   Describes the default and supported locales with the following properties:
   * `default`: The default locale that the application supports, provided as a language/country code. Default value is `en-us`, for US English.
   * `supported`: An array of country code strings, dictating which languages your application supports.
      {% include note.html content="Currently, the only supported local is `en-us`. Other locales will be supported in the future."%}

* `webhooks`: (optional)
   Describes the events and callback URL the webhook supports, using the following properties:
   * `callback_url`: (required)
      The url for the webhook to call each time a supported event occurs
   * `events`
      An array event names to subscribe to. See the webhooks section for full list.

* `snippet`: (optional)
   The relative path from the root to a file containing the snippet of html that will be included on every page of a published site. Useful for adding analytics to websites. This is a shortcut for calling the snippet API.

​Your manifest requires additional entries if you are creating an {% if site.project=="designer" %}[element](ds_apps_element_create.html){%elsif site.project=="cloud" %}[element](cl_apps_element_create.html){%elsif site.project=="platform" %}[element](pf_apps_element_create.html){%endif%}.

Here's a manifest showing all elements for a backend service or snippet - an element or dashboard card will require more.
{%highlight json%}
{
   "manifest": "1",
   "client_id": "123456D",
   "version": "1.0.0",
   "locale": {
      "default": "en-us",
      "supported": ["en-us", "fr", "de"]
   },
   "webhooks": {
      "callback_url": "https://my-site.com/webhooks",
      "events": ["site.publish", "site.update"]
   },
   "snippet": "path/to/snippet.tpl"
. . .
}
{% endhighlight %}