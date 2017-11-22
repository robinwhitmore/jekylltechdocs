---
title: Working with Clients
keywords: migration, clients
t_type: [reference]
tags: [getting_started, clients]
sidebar: ds_migration_sidebar
pdf: true
permalink: ds_mg_clients.html
summary: This topic shows how to work with your clients in the Cloud Admin
---
## View Your Client List
{% include image.html file="old_clientList.png" caption="View Client List in Designer Platform" %}

In the Cloud Admin, just as in the old Designer Platform, your clients are listed on the **CLIENTS** tab when you first log in.

If you're on another tab, click the **CLIENTS** tab to return to your client list.
{% include image.html file="new_ClientsTab.png" caption="Client tab in the Cloud Admin" %}

About this page:
* Clients are listed alphabetically.
* By default, the first 25 are displayed.
* Use the dropdown at the bottom left to change the number of clients displayed.
* Use the pagination controls at the bottom right to move between pages.
* Use the search bar at the top to search for clients. You can search by the client's name, ID, email, or site URL.
* Click on a client's name to open the details page.

## Add a Client
{% include image.html file="old_addClient.png" caption="Adding a Client in Designer Platform" %}

You add a client from the **Client List** page on the Clients tab.
{% include image.html file="new_clientAdd1.png" caption="Add a client from the client list" %}

{% include image.html file="new_clientAdd2.png" caption="Add a client" %}

More about creating clients {% if site.output=="web" %}[here](ds_gs_clients.html){%elsif site.output=="pdf" %}[here](https://robinwhitmore.github.io{{site.baseurl}}/ds_gs_clients.html){%endif%}.

## Edit a Client
{% include image.html file="old_editClient.png" caption="Edit a client from the Designer Platform" %}
{% include image.html file="old_editClient2.png" caption="Edit a client from the Designer Platform" %}

Click a client's name from the Client List to open details page to edit the client.
{% include image.html file="new_clientDetailsMap.png" caption="Client details page" %}

You'll do most of your client work from this page.

Here's what you can do:
<ul>
  <li>Edit the name, email, phone, and ID: Click <strong>Edit</strong> in the client card to change contact info.
    {% include image.html file="new_clientEdit.png" caption="Edit a client's info" %}</li>
  <li>{% include label.html content="NEW!" %}Add a note: Click <strong>Edit</strong> in the Notes area to add a note.
    {% include image.html file="new_clientNote.png" caption="Add a note for the client" %}</li>

  <li>View the list of client's current sites</li>
  <li>{% include label.html content="NEW!" %}View a list of any {% if site.output=="web" %}<a href="ds_gs_cr_sites.html#delete-a-site">deleted</a>{%elsif site.output=="pdf" %}<a href="https://robinwhitmore.github.io{{site.baseurl}}/ds_gs_cr_sites.html#delete-a-site">deleted</a>{%endif%} sites: Click the <strong>Deleted Sites</strong> link.</li>
  <li>{% include label.html content="NEW!" %}{% if site.output=="web"%}<a href="ds_gs_restore.md">Restore</a>{%elsif site.output=="pdf"%}<a href="https://robinwhitmore.github.io{{site.baseurl}}/ds_gs_restore.md">Restore</a>{%endif%} deleted sites</li>
  <li>{% if site.output=="web"%}<a href="ds_gs_cr_sites.md">Add Sites</a>{%elsif site.output=="pdf"%}<a href="https://robinwhitmore.github.io{{site.baseurl}}/ds_gs_cr_sites.md">Add sites</a>{%endif%}</li>
</ul>
