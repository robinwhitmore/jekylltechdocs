{% if site.project == "cloud" %}
## Client Libraries

Looking for an easy way to get started with our API rather than having to piece it all together yourself? Install one of our client libraries! These libraries make it easy to interact with our API&#58;

* Language-specific calls that process the HTTP for you so you can work directly with resources in your code. For example, our PHP library has a `createUser` method that you can use without having to provide HTTP header info. The returned new user is a resource you can work with directly, instead of having to process an HTTP response.
* Easier authorization.
* Fully documented, with robust examples.

​Download our libraries on GitHub here&#58;

* <a href="https://github.com/Weebly/cloud-client-php">PHP</a>
* <a href="https://github.com/Weebly/cloud-client-ruby">Ruby</a>
* <a href="https://github.com/Weebly/cloud-client-python">Python</a>
* <a href="https://github.com/Weebly/cloud-client-java">Java</a>

{% endif %}

## Endpoint
The endpoint is: `{{page.endpoint}}`

{% if site.project == "platform" %}
## Versions
We encourage you to explicitly request this version via the Accept header.

{% highlight shell %}
Accept application/vnd.weebly.v1+json
{% endhighlight %}

{% endif %}

## Schema
All API access is over HTTPS, and accessed from the `{{page.endpoint | remove: "https://"}}` domain. All data is sent and received as JSON. Blank fields are included as null instead of being omitted. Dates and times are Unix Epoch timestamps.

### List View
When retrieving a list of resources, a summary list view of each resource is returned. In some cases, this is akin to a compound primary key. In most root resource cases, like product, the list view contains enough information to make a workable list view in an application without making calls for each resource.

### Detail View
When retrieving a single resource, you will receive a detailed view typically resulting in all the attributes of the resource. In addition, sub resources (like a product's skus) that are owned by this resource are inlined to the result. Other resources (like categories) which are associated but not owned by this resource provide the ids needed to look them up separately.

## HTTP Redirects
We may issue redirects. Any call may result in a redirect, at which point you should make an identical call but to the newly provided resource URL.

## HTTP Verbs
You can use the following&#58;

* **GET**
    Used for retrieving resources.
* **POST**
​    Used for creating resources.
* **PATCH**
​    Used for updating resources with partial JSON data.
*  **PUT**
     Used for replacing resources or entire collections. Fields will be replaced with given values and any fields without given values will be reset to their default. Any fields without defaults, for example ID fields, will remain unchanged.
* **DELETE**
​    Used for deleting resources.

## Search Parameters
Some endpoints allow you to use search parameters in order to filter your results. When using parameters, do not add that query string to your HMAC Hash.

## Pagination
Pagination of certain resources in list view happens automatically. Information about the total number of resources, like the total count, are provided in headers.

* `X-Resultset-Total` shows the total number of records for the request.
* `X-Resultset-Page` shows the page for the call.
* `X-Resultset-Limit` shows the record limit for the page (i.e. each call). The default is `25`, the max is`200`.

If there are additional pages to be returned, a `Link` header will be included that has links to the first, previous, next and last pages.

For example, a response from the Site API might return the following in the header, showing that there are a total of 44 records to be returned, this is the first page, and that 25 is the record limit:

{% highlight json %}
"http_code": 200,
    "result": {
        "headers": [
            "HTTP\/1.1 200 OK",
            "Date: Sat, 25 Jun 2016 00:21:34 GMT",
            "Server: Apache",
            "X-REPOSITORY: repos\/myrepos",
            "X-Resultset-Total: 44",
            "X-Resultset-Page: 1",
            "X-Resultset-Limit: 25",
{% endhighlight %}

When you expect the result set to be greater than 25, use these parameters to determine the pages to return and to increase the limit&#58;

* `page` (int)
   Which page of results to return. Starts at `1`.
* `limit` (int)
   Number of results per page. Default `25`, Max `200`. Don't forget that raising the limit may affect performance.

{% include note.html content="Only the first 25 results are returned by default. If the result set is expected to be over 25, you **must** implement pagination."%}

For example, this CURL request to the Site API returns the second page of result sets.


{% if site.project == "cloud" %}
{% highlight shell%}
curl https://api.weeblycloud.com/user/USER_ID/site?page=2&limit=25  \
-H "X-Public-Key: YOURAPIKEY" \
-H "X-Signed-Request-Hash: YOURSECRETHASH"
{% endhighlight %}

{% elsif site.project == "platform" %}
{% highlight shell%}
curl --request GET \
    --url  https://api.weebly.com/v1/user/sites/{SITE_ID}/pages?page=2&limit=25 \
    --header 'accept: application/vnd.weebly.v1+json' \
    --header 'content-type: application/json' \
    --header 'x-weebly-access-token: [YOUR_TOKEN]'  \
{% endhighlight %}
{% endif %}
