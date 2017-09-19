You upload your app using the {{site.portal}}. Upload versions when you want to:
* Test your latest changes
* Release new versions to your customers
Be sure any upload adheres to the required  application {%if site.project=="designer"%}[file structure](ds_apps_element_folders.html){%elsif site.project=="cloud"%}[file structure](cl_apps_element_folders.html){%elsif site.project=="platform"%}[file structure](pf_apps_element_folders.html){%endif%} and {%if site.project=="cloud"%}[manifest](cl_apps_manifest.html){%elsif site.project=="designer"%}[manifest](ds_apps_manifest.html){%elsif site.project=="platform"%}[manifest](pf_apps_manifest.html){% endif %} structure.
After you've uploaded your application, you'll want to install it on your test site to view and QA it.<!--todo: add link-->

## Package Your App
​Your app needs to be delivered as a zip file. Create a zip file FROM the root directory and not OF the root directory. In other words, open the root directory (where the `manifest.json` file should be), select all files and directories, then create a zip of those. If you create a zip of the root directory, your zip file will not be able to upload to Weebly. Also, make sure all directories and files have read and write permissions.

{% if site.project=="cloud" or "designer" %}
## Upload Using the Cloud Admin

You upload new versions from the administration page for your application. From the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> APPS page, click the application name to open up its details page. Click **Upload New Version**, navigate to the ZIP file that contains your latest application bundle, and click **Upload new ZIP**.
{% include image.html file="cl_cloudAdmin_newApp.png" caption="Upload from the App Details page" %}

Your new version appears in the Version History area. From here, you can change the status and install it to the development site.
{% endif %}
