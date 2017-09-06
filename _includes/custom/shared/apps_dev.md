## Initial Development Steps

1. Get familiar with Weebly and how our users develop websites with it. Go ahead and experiment with Weebly elements. As you start planning and designing, keep in mind that Weebly users expect elements and apps to behave like they were developed by Weebly. Try to keep your app as close to the Weebly paradigm as possible.
3. {%if site.project=="designer"%}[Register](ds_apps_reg.html) {%elsif site.project=="cloud"%}[Register](cl_apps_reg.html){elsif site.project=="platform"%}[Register](pf_apps_reg.html){%endif%}your app.<!--todo: add links to all procedures-->
4. Create your initial file structure. You will create and upload a ZIP of this directory as your app.
5. Create your manifest. Back end services and elements must include the initial manifest entries. There will be additional entries if you create an element.

Once you create those initial entries, follow the specific instructions for the type of app you are creating - backend service, or element. Then come back here to finish up the development process.

## Final Development Steps

1. Bundle up your app and upload.
   Create a zip file FROM the root directory and not OF the root directory. In other words, open the root directory (where the manifest.json file should be), select all files/directories, and create a zip of those. If you create a zip of the root directory, your zip file will not be able to upload to Weebly.
2. Install your app and test it, including tutorials (if you created them).
