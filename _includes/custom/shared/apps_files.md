Applications are the core package that can contain backend services{% if site.project=="platform" %}, dashboard cards,{%endif%} and/or elements. You bundle each Application as a ZIP file. This archive must have a specific structure.
{% include note.html content="When zipping your application for upload, be sure to zip the contents of your root folder, and not the root folder itself.  This will cause your application to be invalid! Also, make sure all directories and files have read/write permissions." %}
The root directory of every application contains the `manifest.json` file.  The manifest provides the defining characteristics of the application. Backend services require only this file in the directory.

​This shows the structure for a backend service named `MyApp`.
{% highlight sh%}
MyApp
  - manifest.json
{% endhighlight%}
Your directory structure may also require additional directories and files if you are creating an element.

{%include custom/shared/apps_element_folders.md %}

