---
title: Create and Manage Clients
keywords: clients, admin, configure,
t_type: [task]
tags: [getting_started, clients, sites]
sidebar: ds_gs_sidebar
permalink: ds_gs_clients.html
summary: You create and manage your clients in the Cloud Admin. Along with contact information, you can manage a client's sites and their access to functionality on those sites.
---
You create and manage your clients from the Clients tab of the Cloud Admin. Here, you can browse through a list of your clients or search for a specific client.
{% include image.html file="ds_cloudAdmin.png" caption="View clients" %}
Clicking a client's name leads to the Client Details page where you can manage things like their password, their sites, view activity logs, and turn test mode on and off.
{% include image.html file="ds_clientDetails.png" caption="Manage Clients" %}

## Create a New Client
You create a client from the Client tab of the Cloud Admin.

**To create a client:**
1. From the Client tab of the Cloud Admin, click **Add Client**.
2. Enter a name and email for your client and optional ID and phone number.
    {% include image.html file="ds_clientsAdd.png" caption="Add a client" %}
    The email must be unique to Weebly, as this is what they will use to log into the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.user_portal}}">User Portal.</a>

Once you create a client, they are assigned an ID and you're taken to their detail page.

## Manage Clients
You manage clients from the client's detail page.
You can do the following from here:

* Edit their personal info
* [Add a site](ds_gs_cr_sites.html)
* Add notes

**To manage a client:**
1. From the Clients tab of the Cloud Admin, browse or search for the client and click their name.
2. Use links on the details page to take the required action. Click [here](ds_gs_cr_sites.html) to find info about creating sites for a client or [here](ds_gs_access_sites.html) for setting contributor access.

<!-- Todo: need to hide until functionality is available
{% include note.html content="You can't delete a client if they are contributors to any active sites. You need to delete the sites first." %} -->
