Your {{site.customer}}s access sites through the User Portal at `https://your-domain/portal`.

{% include note.html content="If your domain is a subdomain of `weeblycloud.com`, then you can also access the portal from `https://weeblycloud.com/portal`." %}
{% if page.permalink !="ds_gs_checklist.html" %}
{% include image.html file="cl_userPortal.png" caption="The User Portal" %}
{% endif %}
Here, they can view site stats as well as access the Weebly Editor. You configure the level of access {{site.user}}s have by setting {%if site.project=="designer"%}[site contributor permissions](ds_gs_access_sites.html){%elsif site.project=="cloud"%}[site contributor permissions](cl_gs_access_sites.html){%endif%}.

For example, you can completely [restrict a client's access](ds_gs_access_sites.html) so that they can't access the editor at all. Or you might give limited access so that the client can view their site's pages in the Weebly Editor, but they can't add pages or publish. This screenshot shows the Weebly Editor with restricted permissions. There's no Publish button and when the user clicks the Pages tab, instead of being shown the UI that lets them add pages, they're shown a list of pages they can view.
{% include image.html file="cl_editor_restricted.png" caption="The Weebly Editor with restricted permissions" %}

You can also send your clients a preview of the published site. When you click the **Preview** button in the editor, the site displays in a preview window with a temporary URL that you can send to clients. The URL remains valid for 30 days.
{% include image.html file="cl_site_preview.png" caption="A preview of a site" %}