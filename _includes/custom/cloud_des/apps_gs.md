## Get Started with Developing Apps
You can create custom apps that you install on your {{site.customer}}s' sites. You work with Weebly's Elements API to create new integrations and elements, extending the features Weebly offers to help meet the many needs of your {{site.customer}}s. Once you've created your app, you associate it to a plan, and all sites with that plan will have the app automatically installed.

{% include note.html content="App development is not available to all Weebly installations. If you do not have this functionality and want more info, contact your Weebly business development sales rep." %}

## What are Apps?
​Apps are containers for various things that are installable to a Weebly site. They are ZIP files that contain, along with all the code, a manifest file that contains configuration metadata for your app, and an icon used to display your app in the Weebly Editor. Consider an app to be a bundle that contains one or more of the following types of functionality:
* {%if site.project=="designer"%}[**Backend Services**](ds_apps_backend.html) {%elsif site.project=="cloud"%}[**Backend Services**](cl_apps_backend.html){%endif%}: Apps that integrate directly with Weebly to provide some sort of additional functionality, such as managing mailing lists, providing security, or additional e-commerce functionality. A backend service may or may not also include an element. For example, you might provide an element for your backend service so users can drag and drop it onto their page. Or you might directly install a snippet of code onto each page and skip the element.
* {%if site.project=="designer"%}[**Elements**](ds_apps_elements.html) {%elsif site.project=="cloud"%}[**Elements**](cl_apps_elements.html){%endif%}: Widgets that site owners can drag and drop onto a page. You configure settings that affect how the widget displays and behaves at runtime. If needed, you can also create a tutorial to help users install, configure, and use the element. An icon for your element appears in the Weebly editor and looks and behaves as though it were native to Weebly.

While each type has its own development process, they also all share some development steps. Please read the {%if site.project=="designer"%}[Development](ds_apps_dev.html) {%elsif site.project=="cloud"%}[Development](cl_apps_dev.html){%endif%} topic first - these are requirements and the steps that all app types must follow. Then read the topics specific to the type you're developing.

## First Steps...

You use the {%if site.project=="designer"%}[**APPS**](ds_apps_manage.html) {%elsif site.project=="cloud"%}[**APPS**](cl_apps_manage.html){%endif%} tab in <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to work with your app, including testing, uploading new versions, and managing the plans that the app is available to.
<!--todo: get screenshot-->{% include image.html file="cl_apps.png"%}

You'll also be given access to your own development site {%if site.project=="cloud"%}(hosted on Weebly) {%endif%}that you can use to test your app. This site has special developer features, such as being able to install more than one version of your app. Team members with the {%if site.project=="designer"%}[role](ds_gs_team_members.html#team-member-roles) {% elsif site.project=="cloud"%}[role](cl_gs_team_members.html#team-member-roles){%endif%} of Admin or Technical are able to create and manage an app and use the development site.

If you're creating an element, go ahead and try our {%if site.project=="designer"%}[tutorial](ds_element_main.html) {%elsif site.project=="cloud"%}[tutorial](cl_element_main.html){%endif%}. It'll teach you everything you'll need to create your first Weebly element!

## Sample Apps

Download one of our {%if site.project=="designer"%}[sample apps](ds_apps_samples.html) {%elsif site.project=="cloud"%}[sample apps](cl_apps_samples.html){%endif%} to help you get started. The Bootstrap element is a very simple app, while the Pricing Chart app shows a bit more complexity. You can also download the source for our Weebly apps.