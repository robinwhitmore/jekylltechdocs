## Brand Your Sites and the Cloud Admin
You can brand Weebly {{site.name}} by adding your company's name and uploading your company's logo and a fav icon. Once configured, your company's name displays in a number of places, such as {%if site.project=="cloud"%}the footer of published sites,{% endif %} in the Site Editor and in invitation emails.

For example, {% if site.project=="cloud" %}here's the footer of a published site showing the company name Nash Hosting.
{% include image.html file="cl_settings_footerName.png" %}
And{% endif %} here's an email sent inviting a new user.
{% include image.html file="cl_settings_mail.png" %}<br>

​Once uploaded, the logo displays in the Cloud Admin as shown here:
{% include image.html file="cl_settings_logo.png" %}<br>


To brand {% if site.project=="cloud" %}sites and{%endif%} the [Cloud Admin](http://weeblycloud.com/admin), from the **Settings** tab, in the **Customize** area, click the **Edit** icon and enter the company name and upload your logo and favicon.
{% include image.html file="cl_settings_uploadLogo.png" %}

<hr>
## Set Your Domain

You can set a domain that is used to access both the Cloud Admin (`your_domain/admin`) and the User portal (`your_domain/portal`), and that displays in the user's address bar when using the Site Editor. You can choose to use a subdomain of `weeblycloud.com` or you can use a custom domain.

{% include note.html content="If you don't configure a domain, you will not be able to generate and send emails from the Cloud Admin and you will not have access to the User portal." %}

To set a subdomain, in the Domain area, click the **Edit** icon, click **Subdomain**, enter the subdomain to be used, and click **Save**. If the subdomain is available, a green checkmark displays. The subdomain will be applied to both the Cloud Admin and the User Login portals, and to the Site Editor URL.
{% include image.html file="cl_settings_domain.png" %}<br>

For custom domains, click **Custom domain**, enter the domain you'd like to use and click **Next**.
{% include image.html file="cl_settings_customDomain.png" %}<br>

You now need to add a `CNAME` that points `weeblycloud.com` to the DNS for your domain. Follow the instructions in the resulting dialog.
<hr>
## {%if site.project=="cloud"%}Footer Link and {%endif%}Email URL

{%if site.project=="cloud"%}Your company name displays as a link in the footer of all your customer sites (the color and styling of the link is determined by the theme in use). {%endif%}You must add a URL to a specific page about your company {% if site.project == "designer" %}that will be {%elsif site.project=="cloud"%} for that link. This URL is also {%endif%}used as the return email address on emails automatically sent by the Cloud Admin, such as the team member and {{site.customer}} invitations. This URL is required. {%if site.project=="cloud"%}In this example, the company's name is Nash Hosting.
{% include image.html file="cl_settings_footerName.png" %}{% endif %}

{% include note.html content="While the emails will appear to be from this destination, they are actually sent from a Weebly IP address. Because of this, you need to create an SPF record for the Weebly IP. More info here." %}
<!--TODO: URL to troubleshooting topic -->

To set the URL, in the **Footer Message** area, click the **Edit** icon and enter the URL.
{% include image.html file="cl_settings_URL.png" %}

<hr>
## Configure Basic Settings

You can configure locale settings for your sites, such language, time zone, and you can also configure upgrade and upsell URLs. To configure these settings, in the **Configuration** area, click the **Edit** icon and enter the appropriate info for the following:
* **Upgrade URL**: When a user encounters a feature in the Weebly Editor that is part of a plan they do not currently have, they will be prompted to upgrade. This triggers a popup window that loads a URL showing the plans they can upgrade to. Enter that URL here. More about how upgrades work can be found here.
<!--TODO: enter URL to upgrade topic -->
* **Publish Upsell URL**: When a user publishes a site, the Weebly editor displays a publishing modal with a link to the site just published, and often Weebly promotional material as well. You can set a link to a promotion for your company by entering a URL here. The resulting content loads in an iframe (640px W by 200px H) when the site is published. More info here.
<!--TODO: enter URL to upgrade topic -->
* **Default User Language**: Select the default language displayed to your team and {{site.customer}}s. They can always change this by selecting a different language from the Settings tab of the editor, or if enabled, the language picker in the User Portal.
* **Default Time Zone**: Select the default time zone used by the Site Editor.
* **Default Date Format**: Select how you want dates displayed by default. You can choose either `MM/DD/YYYY` or `DD/MM/YYYY`.
* **Default Time Format**: Select how time should display by default - either 12 or 24 hour.

<hr>
## View Your Upgrade Hash

As part of the upgrade URL, Weebly passes in a hash that includes the user ID, the site ID, and a reseller-specific hash. You need to decode this hash to verify that the URL was accessed from the Weebly editor. You can see that hash from the Upgrade Settings area of the Cloud Admin. More about the hash and how to handle the upgrade process here.
<!--TODO: user_ID? enter URL to upgrade topic -->

To view the hash, click the **Show link** in **Upgrade Settings** area. You can also edit the hash by clicking the **Edit** icon.
{% if site.project == "cloud" %}
{% include note.html content = "If you edit the upgrade hash and you use the WHMCS plug-in, then you must update that configuration as well." %}
{% endif %}
{% include image.html file="cl_settings_hash.png" %}

<hr>
## Create a Support Message

You can create a message that displays to Weebly agents when you contact Weebly Support. This message might include important information they need to know, like a specific support process.

To create a message, click the **Edit** icon in the **Agent Message** area and enter your message. You can use up to 125 characters.
{% include image.html file="cl_settings_message.png" %}

<hr>
## Set Contact Info

You can create three different ways that you can be contacted:
* **Support**: Shown to your customers in the Weebly editor. The phone number and a link to the URL (shown as Support Center) display in the Help menu. All other entered information for this type of contact displays to the Weebly support team, in the case where the customer contacts Weebly directly.
{% include image.html file="cl_settings_support.png" %}
* **Billing**: Shown to Weebly support. This contact should be someone who can handle billing inquiries.
* **Technical**: Shown to Weebly Support. This contact should be someone equipped to handle technical issues.<br>

To add a contact, click the **Add Contact** link in the **Contact Info** area, select the contact type, and enter the needed information. You can only create one contact for each type. You can edit a created contact by clicking the **Edit** icon.
{% include image.html file="cl_settings_contact.png" %}

{% if site.project == "cloud" %}
<hr>
## View and Create API Keys and Secrets
API keys and secrets are used during <span style="color: red"> API calls </span>to verify the sender of a request. You need to create a key to use the API, and you'll also need to create a key when you install any <span style="color: red">plug-ins</span>.

Create a key by clicking the **Add Key** link in the **API Key** area. Enter a name of your choice. The API key and secret are automatically generated for you and cannot be changed. Click **Save Key** when done.

Click the **Show link** to view the API secret. Click the Edit icon to edit the name of the key or to delete the key.
{% include image.html file="cl_settings_api.png" %}
{%endif%}