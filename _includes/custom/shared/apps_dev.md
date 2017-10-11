## Initial Development Steps

1. Get familiar with Weebly and how our users develop websites with it. Go ahead and experiment with Weebly elements. As you start planning and designing, keep in mind that Weebly users expect elements and apps to behave like they were developed by Weebly. Try to keep your app as close to the Weebly paradigm as possible.
3. {%if site.project=="designer"%}[Register](ds_apps_reg.html) {%elsif site.project=="cloud"%}[Register](cl_apps_reg.html){elsif site.project=="platform"%}[Register](pf_apps_reg.html){%endif%}your app.
4. Create your initial {% if site.project=="designer" %}[file structure](ds_apps_files.html){%elsif site.project=="cloud" %}[file structure](cl_apps_files.html){%elsif site.project=="platform" %}[file structure](pf_apps_files.html){%endif%}. You will create and upload a ZIP of this directory as your app.
5. Create your {% if site.project=="designer" %}[manifest](ds_apps_manifest.html){%elsif site.project=="cloud" %}[manifest](cl_apps_manifest.html){%elsif site.project=="platform" %}[manifest](pf_apps_manifest.html){%endif%}. Back end services and elements must include the initial manifest entries. There will be additional entries if you create an element.

Once you create those initial entries, follow the specific instructions for the type of app you are creating - {% if site.project=="designer" %}[backend service](ds_apps_backend.html){%elsif site.project=="cloud" %}[backend service](cl_apps_backend.html){%elsif site.project=="platform" %}[backend service](pf_apps_backend.html){%endif%}, or {% if site.project=="designer" %}[element](ds_apps_element_create.html){%elsif site.project=="cloud" %}[element](cl_apps_element_create.html){%elsif site.project=="platform" %}[element](pf_apps_element_create.html){%endif%}. Then come back here to finish up the development process.

## Final Development Steps

1. Bundle up your app and {% if site.project=="designer" %}[upload](ds_apps_element_upload.html){%elsif site.project=="cloud" %}[upload](cl_apps_element_upload.html){%elsif site.project=="platform" %}[upload](pf_apps_element_upload.html){%endif%}.
   Create a zip file FROM the root directory and not OF the root directory. In other words, open the root directory (where the manifest.json file should be), select all files/directories, and create a zip of those. If you create a zip of the root directory, your zip file will not be able to upload to Weebly.
2. Install your app and {% if site.project=="designer" %}[test](ds_apps_element_test.html){%elsif site.project=="cloud" %}[test](cl_apps_element_test.html){%elsif site.project=="platform" %}[test](pf_apps_element_test.html){%endif%} it, including tutorials (if you created them).
