## Using Plug-ins

We provide plug-ins that work with the following:
* cPanel<span style="color:red">[[URL:install-and-configure-cpanel]]</span>: Your customers can provision and manage their Weebly sites through cPanel
* WHMCS<span style="color:red">[[URL:install-and-configure-whmcs]]</span>: You can integrate WHMCS to to manage billing, upgrades and provisioning. Works in conjunction with our cPanel plugin or standalone.
* AppDirect<span style="color:red">[[URL:activate-the-appdirect-plugin]]</span>: You can integrate with AppDirect so your customers can create their Weebly site from the AppDirect marketplace.
* APS2<span style="color:red">[[URL:install-and-configure-aps2]]</span>: Customers can use APS2 to create and manage their Weebly sites.
***

## Working with the Weebly Cloud API

​When you need to access the API programmatically, you can use the Weebly Cloud API. It's a RESTful API that utilizes HTTP verbs GET, POST, PUT, PATCH and DELETE. Authorization for the API is handled through a public key and a private HMAC Hash. We provide client libraries[[URL:about-the-rest-apis]] in four different languages to help get you started. You can find information about our API here[[URL:about-the-rest-apis]].
***

## Working with the Cloud Admin

If you opt to not use plug-ins<span style="color:red">[[URL:using-plug-ins]]</span> with Weebly Cloud, then many of the operations needed to manage your customers' websites can be accomplished using the Cloud Admin. Some of these include the ability to delete and restore sites. You access the portal at https://weeblycloud.com/admin.

{% include image.html file=”cloudAdmin.png” %}

​​You can also access the Cloud Admin portal from the Admin Login button at the top right of this and every doc page.

{% include image.html file=”AdminLogin.png” %}

Steps for creating users of the Cloud Admin (called team members) can be found here <span style="color:red">[[URL:create-cloud-admin-users]]</span>.