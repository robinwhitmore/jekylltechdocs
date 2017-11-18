## Backend Service Apps

Backend services typically provide additional functionality for a user's website, often without requiring an element to be dropped onto a page. Once installed, the app runs natively on the user's site.

​For example, someone might create a backend service that  manages a site's data about its members. Let's call it Subscribe. The Subscribe app gains access to the Weebly API to get information about the customer and the site it's being installed into, as well as information about the site's members.

## Snippets

​You can also create a snippet of code to be installed on every page in a user's published site. To create a snippet, create an HTML page that includes the needed code and save it as an HTML template file (you can save it to the root of your directory with the manifest). Then include the path to the snippet in the manifest. When installed, the code is appended to every page.

This example shows the `snippet.tpl` - a very simple snippet.
{% highlight html %}
<script>
    console.log("a4 snippet found");
</script>
<div>here is snippet from test app 4 (a4-snippet)</div>
{%endhighlight%}

And here's the manifest entry  for it.

{%highlight json%}
{
    "manifest": "1",
    "version": "1.0.4",
    "locale": {
        "default": "en-us",
        "supported": [
            "en-us"
        ]
    },
    "snippet": "files/html/snippet.tpl"
}
{%endhighlight%}

{% include note.html content="Because apps that run natively on iOS mobile devices need to use App Transport Security, any URLS in your app must use HTTPS. Also note that because the Weebly editor and published sites use jQuery and Underscore, if your app also needs to use these libraries, do not expose any global variables, as conflicts may arise." %}

Snippets are active only on published sites and not in the Weebly editor.

## Create a Backend Service or Snippet
​To create a backend service or snippet, aside from the code for the app's functionality, you'll need to provide log in, configure, and manage capabilities at an external web site (if needed). Once you've created those sites and your app, follow the steps for {%if site.project=="designer"%}[developing an app](ds_apps_dev.html){%elsif site.project=="cloud"%}[developing an app](cl_apps_dev.html){%elsif site.project=="platform"%}[developing an app](pf_apps_dev.html){%endif%}.

