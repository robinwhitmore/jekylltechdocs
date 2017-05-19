## Get Started with Developing Apps
You can create custom apps that you install on your {{site.customer}}s' sites. You work with Weebly's Elements API to create new integrations and elements, extending the features Weebly offers to help meet the many needs of your {{site.customer}}s. Once you've created your app, you associate it to a plan, and all sites with that plan will have the app automatically installed.

{% include note.html content="App development is not available to all Weebly installations. If you do not have this functionality and want more info, contact your Weebly business development sales rep." %}

## What are Apps?
​Apps are containers for various things that are installable to a Weebly site. They are ZIP files that contain, along with all the code, a manifest file that contains configuration metadata for your app, and an icon used to display your app in the Weebly Editor. Consider an app to be a bundle that contains one or more of the following types of functionality:
* **Backend service**: Apps that integrate directly with Weebly to provide some sort of additional functionality, such as managing mailing lists, providing security, or additional e-commerce functionality. A backend service may or may not also include an element. For example, you might provide an element for your backend service so users can drag and drop it onto their page. Or you might directly install a snippet of code onto each page and skip the element.
* **Elements**: Widgets that site owners can drag and drop onto a page. You configure settings that affect how the widget displays and behaves at runtime. If needed, you can also create a tutorial to help users install, configure, and use the element. An icon for your element appears in the Weebly editor and looks and behaves as though it were native to Weebly.

While each type has its own development process, they also all share some development steps. Please read Development topic first - these are requirements and the steps that all app types must follow. Then read the topics specific to the type you're developing.

## First Steps...

You use the APPS tab in Cloud Admin to work with your app, including testing, uploading new versions, and managing the plans that the app is available to.
{% include image.html file="cl_apps.png"%}

You'll also be given access to your own development site (hosted on Weebly) that you can use to test your app (see the image above). This site has special developer features, such as being able to install more than one version of your app. Team members with the role of Admin or Technical are able to create and manage an app and use the development site.

If you're creating an element, go ahead and try our tutorial. It'll teach you everything you'll need to create your first Weebly element!

## Sample Apps

Download one of our sample apps to help you get started. The Bootstrap element is a very simple app, while the Pricing Chart app shows a bit more complexity. You can also download the source for our new Weebly elements!