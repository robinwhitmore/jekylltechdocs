You update an app by uploading a new zip.

When you release a new version of your app, here's what happens:
* The previous version is moved to the state of `Archived` and the new version becomes `Active`.
* Previous versions of your apps on published sites are not replaced. The next time the site owner visits the editor, the app is updated in the editor and the user is prompted to publish the site in order for the published version to also update.
    {% include note.html content="Don't deprecate old server-side functionality that my be used by older versions until there is sufficient user adoption of newer versions." %}
* If your app contains an element with settings (configured either in a Weebly dialog or at an external site), the site owners settings are merged with the settings in the manifest. If you've added settings, the defaults will be used until the customer changes them.
    {% include note.html content="Customer settings will be overridden if you change an existing default setting." %}
* If your app includes webhooks,<!--todo: add links--> any webhook subscriptions previously configured in the manifest will be deleted and replaced with the subscriptions defined in the new version. Subscriptions managed by the API will be copied over to the new version.


**To update your app**:
1. In the new version, change the version number in the {%if site.project=="designer"%}[manifest](ds_apps_manifest.html){%elsif site.project=="cloud"%}[manifest](cl_apps_manifest.html){%elsif site.project=="platform"%}[manifest](pf_apps_manifest.html){%endif%}.

2. Make any other updates and then zip up and {%if site.project=="designer"%}[upload](ds_apps_element_upload.html){%elsif site.project=="cloud"%}[upload](cl_apps_element_upload.html){%elsif site.project=="platform"%}[upload](pf_apps_element_upload.html){%endif%} the app.
    The new version displays on the details page using the new version number.
3. {%if site.project=="designer"%}[Release](ds_apps_element_release.html){%elsif site.project=="cloud"%}[Release](cl_apps_element_release.html){%elsif site.project=="platform"%}[Release](pf_apps_element_release.html){%endif%} the new version by publishing it. The previous version's status is moved to `Archived` and this version becomes `Active`.
