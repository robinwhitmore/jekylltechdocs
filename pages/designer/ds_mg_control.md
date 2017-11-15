---
title: Controlling Access to a Site
keywords: access, site, migrating, staff, team, migration
t_type: [reference]
tags: [getting_started, clients, sites]
sidebar: ds_gs_sidebar 
permalink: ds_mg_control.html
summary: This topic shows how to control client and staff access to sites.
---
## Client Access
{% include image.html file="old_clientAccess.png" caption="Controlling access in Designer Platform" %}

By default, when a site is created for a client, they have no access to it, other than viewing the published site. You can give them specific access levels to a site by making them a *site contributor*. The level of access that you can configure is slightly different than what it used to be.

To set access for a client, from the site's [detail page](ds_mg_sites.html#site_detail), in the Contributors section, click the **Add Contributor** link. 
{% include image.html file="new_Contributor.png" caption="Add site contributors from the site's detail page" %}

Make sure **New User** is selected at the top, and enter the client's name, email address (other settings are optional) and click **Set Permissions**.
{% include image.html file="new_ContributorAdd.png" caption="Add site contributor" %}
By default, the new contributor is given full access to the site. To limit access, select **Limit Editor Permissions** and configure the access level. More about setting access levels [here](ds_gs_access_sites.html).
{% include image.html file="new_contributorSet.png" caption="Set levels of access" %}

Once you set access, the client is listed as a contributor on the site's detail page and you can change the access level at any time by clicking the **Permissions** link.
{% include image.html file="new_contribPermssion.png" caption="Manage permissions" %}

## Staff Access
{% include image.html file="old_staffAccess.png" caption="Staff access in Designer Platform" %}

In Weebly Cloud, your staff are called *team members*. You create and manage team members from the **TEAM** tab of the Cloud Admin.
{% include image.html file="new_team.png" caption="Team members in the Cloud Admin" %}

Click **Add Member** to create a new team member. You can restrict Cloud Admin access and general site editing access from here.
{% include image.html file="new_teamAdd.png" caption="Add a team member" %}

You can further restrict access to specific sites in the same way that you restrict access for your clients. But instead of creating a new site contributor, choose **Existing User** from the Add Contributor dialog and search for the team member by their email address.
{% include image.html file="new_teamAccess.png" caption="Search for team member" %}



