Your {{site.customer}}s access sites through the User Portal at `https://your-domain/portal`.
<!--todo: find out why note doesn't display correctly-->
{% include note.html content="If your domain is a subdomain of `weeblycloud.com`, then you can also access the portal from `https://weeblycloud.com/portal`." %}
{% if page.permalink !="ds_gs_checklist.html" %}
{% include image.html file="cl_userPortal.png" caption="The User Portal" %}
{% endif %}
Here, they can view site stats as well as access the Weebly Editor. You configure the level of access {{site.user}}s have by setting {%if site.project=="designer"%}[site contributor permissions](ds_gs_access_sites.html){%elsif site.project=="cloud"%}[site contributor permissions](cl_gs_access_sites.html){%endif%}.