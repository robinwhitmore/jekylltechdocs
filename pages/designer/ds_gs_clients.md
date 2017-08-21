---
title: Create and Manage Clients
keywords: clients, admin, configure,
t_type: [task]
tags: [getting_started, troubleshooting, configuration, clients, plans, sites]
sidebar: ds_gs_sidebar
permalink: ds_gs_clients.html
summary: You create and manage your clients in the Cloud Admin. Along with contact information, you can manage a client's sites and their access to functionality on those sites.
---
You create and manage your clients from the Clients tab of the Cloud Admin. Here, you can browse through a list of your clients or search for a specific client.
<!--TODO: add screenshot-->
Clicking a client's name leads to the Client Details page where you can manage things like their password, their sites, view activity logs, and turn test mode on and off.

## Create a New Client
You create a client from the Client tab of the Cloud Admin.

**To create a client:**
1. From the Client tab of the Cloud Admin, click **Add Client**.
2. Enter a name and email for your client.
The email must be unique to Weebly, as this is what they will use to log into the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.user_portal}}">User Portal.</a>
3. Optionally send an invite email to the client. This email will have a link to their User Portal, so be sure to configure their contributor access right away. You can also send an email at a later date from their detail page.<!--todo: Q: Is this true?-->
4. Set their contributor access. <!--todo: need to get info once coded-->
By default, clients have <!--todo: ?? --> access to their sites. You can restrict that access by setting their Site Contributor permissions. <!--todo: add link-->

Once you create a client, they are assigned an ID and you're taken to their detail page.
<!--todo: screenshot-->

## Manage Clients
You manage clients from the client's detail page.
You can do the following from here:
<!--todo: test-->
* Edit their personal info
* Reset their password
* Send an invite email
* Turn test mode on/off
* Disable the user
* Add a site
* View activity logs
* Create a support request
* Add notes

**To manage a client:**
1. From the Clients tab of the Cloud Admin, browse or search for the client and click their name.
2. Use links on the details page to take the required action. Click [here](ds_gs_cr_sites.html) to find info about creating sites for a client or [here](ds_gs_access_sites.html) for setting contributor access.

{% include note.html content="You can't delete a client if they are contributors to any active sites. You need to delete the sites first." %}
