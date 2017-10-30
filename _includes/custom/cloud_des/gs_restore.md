## Restore a Site
The Sites section of the {{site.user}}'s detail page lists all the sites for that {{site.user}}. From here, you can click the **Deleted Sites** link and pick a site to restore.
{% include image.html file="cl_recoverSite.png" caption="You can recover deleted sites" %}

## Restore a Page
Click on the arrow for a site to review the site's detail page. From the **Pages** section, you can click the **Deleted pages** link and choose the page to restore.
{%if site.project=="cloud"%}
{%include image.html file="cl_recoverPage.png" caption="You can recover deleted pages for a site." %}
{%elsif site.project=="designer"%}
{%include image.html file="ds_recoverPage.png" caption="You can recover deleted pages for a site." %}
{%endif%}

## Restore an Element
To restore elements, click the gear icon for the page containing the element(s). You can either use the Restore Deleted Elements dialog or if the restoration is complicated, you can open the page in the Weebly editor to restore it.
{%if site.project=="cloud"%}
{%include image.html file="cl_recoverElement.png" caption="You can recover deleted elements for a site." %}
{% elsif site.project=="designer"%}
{%include image.html file="ds_recoverElement.png" caption="You can recover deleted elements for a site." %}
{%endif%}
