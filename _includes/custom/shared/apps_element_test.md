{% if site.project=="cloud" or "developer" %}
To install your application to a test site, from the {%if site.project=="designer"%}[App Details](ds_gs_admin.html#apps){%elsif site.project=="cloud"%}App Details](cl_gs_admin.html#apps){%endif%} page in the Cloud Admin, click **Install to Dev Site**.
{%include image.html file="cl_apps_install.png" caption="Install to the developer site"%}
{%endif%}

​Test your app in the editor. If you created a tutorial, test that it displays properly and that the instructions and descriptions are correct. Publish your site and test the functionality on a published site. You may also want to test it on a mobile device.

As a developer, you can install multiple versions of your app onto your development site (and only your development site). When you reinstall your app, any previously installed versions will not be overwritten - you will have multiple versions installed to your test site. If you don't wish to have multiple versions, be sure to archive your previous version before installing a newer version.
{% include tip.html content="This is not the case for your customers. When you release a new version of your app, any customer that has it installed will automatically receive the new version and will have the older version uninstalled for them." %}

Repeat the install, editor development, and development site testing using the Weebly app from a mobile device, to be sure nothing breaks when used on smaller devices. Also make sure to test the scenario where a user may own multiple sites and wants to install your app onto more than one site.
{% if site.project=="cloud" or "designer" %}
To test on sites other than the development site:
* Create a new app with the updates you'd like to test.
* Create a test {%if site.project=="designer"%}[plan](ds_gs_plans.html) {%elsif site.project=="cloud"%}[plan](cl_gs_plans.html){%endif%}.
* Set {% if site.project=="designer" %}[Auto-Install](ds_apps_element_release.html){%elsif site.project=="cloud" %}[Auto-Install](cl_apps_element_release.html){%endif%} to the test plan.
* Create some test {%if site.project=="designer"%}[sites](ds_gs_cr_sites.html) {%elsif site.project=="cloud"%}[sites](cl_gs_cr_sites.html){%endif%} and associate those sites with your test plan.
* {% if site.project=="designer" %}[Release your app](ds_apps_element_release.html){%elsif site.project=="cloud" %}[Release your app](cl_apps_element_release.html){%endif%}  to that plan.
Your app should automatically be installed on your test sites.
{% endif %}