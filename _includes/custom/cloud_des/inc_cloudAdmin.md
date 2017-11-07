<!--Cloud Admin-->

Many of the operations needed to manage your customers' websites are accomplished using the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a>, including the ability to create, manage, and delete sites. You access the portal from `https://your-domain/admin`.

{% include note.html content="If your domain is a subdomain of `weeblycloud.com`, then you can also access the admin from `https://weeblycloud.com/admin`." %}

{% if page.permalink !="ds_gs_checklist.html" %}
{% if site.project==cloud%}
{% include image.html file="cl_cloudAdmin1.png" caption="Cloud Admin User Page" %}
{% else %}
{% include image.html file="ds_cloudAdmin.png" caption="Cloud Admin Client Page" %}
{% endif %}
{% endif %}

Users of the Cloud Admin are called Team Members, and you can configure the access to functionality they have on the {%if site.project=="designer"%}[Team Member](ds_gs_team_members.html) {%elsif site.project=="cloud"%}[Team Member](cl_gs_team_members.html){%endif%} page.
