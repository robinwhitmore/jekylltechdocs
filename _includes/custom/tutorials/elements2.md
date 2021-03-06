In this step, we’ll register the app in the {{site.portal}} so that we have the info needed to create the manifest.
1. Open the [{{site.portal}}]({{site.portal_url}})
2. {% if site.project=="platform" %}Click **Create New App**.
   {%elsif site.project=="cloud" or "designer"%} Click the **APPS** tab and click **Create New App**{% endif %}.
3. Enter your account email in the **App Name** field, for example, `myemail@email.com`.
{% if site.project=="platform" %}
4. Select **eCommerce** for the Category.
{% endif %}
5. Click **Save**.
    {% include note.html type="tip" content="App names must be unique. Using your account email as a name for this tutorial ensures this name will be unique." %}

​We now have a Client ID and Secret for the app (located in the card on the left). We’ll need the Client ID when we create the element’s manifest.
{% if site.project=="cloud" %}
{% include image.html file="cl_apps.png" %}
{% elsif site.project=="designer" %}
{% include image.html file="ds_apps.png" %}
{% elsif site.project=="platfor" %}
{% include image.html file="pf_apps.png" %}
{% endif %}
