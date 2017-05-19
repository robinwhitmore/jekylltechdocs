## Brand Your Sites and the Cloud Admin
You can brand Weebly {{site.name}} by adding your company's name and uploading your company's logo and a fav icon. Once configured, your company's name displays in a number of places, such as {%if site.project="cloud"%}the footer of published sites,{% endif %} in the Site Editor and in invitation emails.

For example, {% if site.project="cloud" %}here's the footer of a published site showing the company name Nash Hosting.
{% include image.html file="cl_settings_footerName.png" caption="Footer of a published site on Nash Hosting" %}

And {% endif %}here's an email sent inviting a new user.
{% include image.html file="cl_settings_mail.png" caption="Footer of a published site on Nash Hosting" %}

## Set Your Domain

You can set a domain that is used to access both the Cloud Admin (`your_domain/admin`) and the User portal (`your_domain/portal`), and that displays in the user's address bar when using the Site Editor. You can choose to use a subdomain of `weeblycloud.com` or you can use a custom domain.

{% include note.html content="If you don't configure a domain, you will not be able to generate and send emails from the Cloud Admin and you will not have access to the User portal." %}

To set a subdomain, in the Domain area, click the **Edit** icon, click **Subdomain**, enter the subdomain to be used, and click **Save**. If the subdomain is available, a green checkmark displays. The subdomain will be applied to both the Cloud Admin and the User Login portals.