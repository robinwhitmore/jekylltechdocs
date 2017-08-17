## Offering the Weebly App Center

Weebly’s App Center is a growing marketplace where site owners find new apps and services that enhance a site.
There are three types of Apps offered in the center:
* **App Elements:** Elements added to the site editor sidebar that can be dragged into a site, just like native Weebly elements.
* **Snippets:** JavaScript that is added to and runs on every published page. For example,  a live chat bubble in the footer is actually a snippet. You only need to install the app, nothing needs to be dragged onto the page.
* **Backend/API:** These apps leverage our APIs to sync store orders, products, blog posts, etc. They may not have any UI in the editor at all.
​
You find apps in the App Center by browsing through collections, categories and sub-categories, or you can filter based on ratings, popularity, freshness, or free apps, and you can search using keywords.

{% include note.html content="The App Center is not white-labeled. That is, the Weebly brand appears throughout the center." %}
{% include image.html file="appCenter.png" caption="The Weebly App Center" %}
Each app has a details page that describes the app, explains the pricing, displays ratings, and provides an install button. Apps can also have an optional live demo site where you can view the app in action.
{% include image.html file="appDetails_long.png" caption="An app's details page " %}
The App Center is accessed from the Editor, and installed apps are also accessed from here.
{% include image.html file="appCenter_editor.png" caption="Apps in the Editor" %}
Apps are managed and uninstalled from the Manage Apps page, also accessed from the Editor, or from the Settings page.
{% include image.html file="myApps_support.png" caption="My Apps page in the Editor" %}
To provide access to the Weebly App Center, get in touch with your Account Manager or Business Development contact who will turn this on for your account. Once the App Center is activated, you need to explicitly add App Center access to your site plan(s).<!--TODO: add link--> The links to the App Center (including those in the header and those in the Editor) display only for sites that have purchased plans that include the App Center.

If you allow site contributors<!--TODO: add link-->, those with Admin privileges will be able to access the App Center. All other contributors need to be granted explicit access.

If you want to be able to install apps for your customers, but not allow them access to the App Center, you or a team member can temporarily set the site's plan to one that allows App Center access, log into the site and install the app(s), and then change the plan to one that can't access the App Center. The customer will be able to use and manage the app, but will not be able to visit the App Center.

## Creating Your Own Custom Apps
Along with apps from the App Center, you can develop custom apps that are installed into sites, based on the plan they are associated with. For example, you might create a custom commenting app and automatically install it to all customers on the Pro plan. And just like the apps in the App Center, your custom apps can be as simple as a code snippet installed directly into your {{site.customer}}s' sites or they can be elements that get dragged onto a site's pages.

You work with the Weebly Cloud API to create your app and then configure its availability in the Cloud Admin. You'll also be given access to your own development site {%if site.project=="cloud"%}(hosted on Weebly) {%endif%}that you can use to test your app. This site has special developer features, such as being able to install more than one version of your app. Team members with the role of Admin or Technical are able to create and manage an app and use the development site.