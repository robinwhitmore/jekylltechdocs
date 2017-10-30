---
title: Using Weebly Cloud Admin
keywords: cloud admin, admin
t_type: [concepts]
tags: [getting_started]
sidebar: ds_gs_sidebar
permalink: ds_gs_admin.html
summary: The Weebly Cloud Admin is where you manage your clients, their sites, and your Weebly account and installation.
---
{% include custom/cloud_des/inc_cloudAdmin.md %}
{% if site.project=="cloud" %}
{% include image.html file="cl_cloudAdmin.png" caption="The Cloud Admin" %}
{% elsif site.project=="designer" %}
{% include image.html file="ds_team.png" caption="Team Member page" %}
{%endif%}

The tabs on the side of the portal allow you manage different parts of Weebly Cloud:

## Clients
The Clients tab is where you [create](ds_gs_clients.html) new clients, as well as browse through or search for existing clients.
{% include image.html file="ds_cloudAdmin.png" caption="Clients tab" %}

When you click on a client name, you're taken to the client's detail page. Here, you can [manage](ds_gs_clients.html#manage-clients) different aspects of the client, as well as create sites for them.
{% include image.html file="ds_clientDetails.png" caption="Client Details page" %}
## Team
If your company has more than one person who will use the Cloud Admin, you create [create](ds_gs_team_members.html#create-a-team-member) those users as Team Members.
{% include image.html file="ds_team.png" caption="Team Member page" %}

When you click on a member name, you navigate to their detail page where you [assign a role](ds_gs_team_members.html#team-member-roles) that determines the level of access they have in the Cloud Admin.
{% include image.html file="ds_teamDetail.png" caption="Team Member detail page" %}
## Packages
The Packages tab is where you create and manage your plans. Weebly plans determine the functionality available to a site. For example, the Weebly Starter Plan doesn't allow site search, while the other plans do. Video and audio players are only available on the Pro plan{%if site.project=="cloud"%} and above{% endif %}. You create your own plans and set pricing and other plan settings. Then you associate your plans with Weebly plans to determine the functionality available with each of your plans.

The main Package page displays each of your plans and is where you [create](ds_gs_plans.html#create-plans-with-cloud-admin) a plan.

{% include image.html file="ds_plan.png" caption="Packages page" %}

Click on a plan to edit it's configuration, including its associated Weebly plan.
{% include image.html file="ds_planDetail.png" caption="Plan detail page" %}
## Apps
You can develop custom apps that you install to your client's sites. You use the Apps tab to [create](ds_apps_gs.html), manage, and [release](ds_apps_element_release.html) those apps.

{% include image.html file="ds_apps.png" caption="App detail page" %}

## Themes

Weebly [themes](ds_themes_start.html) provide a general structure and design palette for any website built using the Weebly editor. While Weebly provides a number of themes, you may want to create your own. You use the Themes tab to upload your custom themes so that they are available to your sites.

{% include image.html file="ds_theme.png" caption="Manage Themes in Cloud Admin" %}

## Billing
The Billing tab allows you to [view and pay](ds_gs_invoice.html) your Weebly invoices.

{% include image.html file="ds_billing.png" caption="Invoices on the Billing tab" %}

When you click an invoice, you can view its details.

{% include image.html file="ds_billing_details.png" caption="Invoice details" %}

## Settings

You [configure](ds_gs_configure.html) the Admin and how it behaves from the Settings tab.
{% include image.html file="ds_settingsLogo.png" caption="Settings for the Cloud Admin" %}