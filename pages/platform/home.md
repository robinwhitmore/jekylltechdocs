---
title: Get Started with Apps
keywords:
type: [concepts]
tags: [getting_started]
sidebar: pf_apps_sidebar
permalink: home.html
summary: Weebly is a powerful drag and drop website creator that allows people to quickly and easily set up a site, blog, or online store. As a developer, you’ll reach over 40 million users looking to purchase apps to power their businesses. You'll work with Weebly's Elements API to create new integrations and elements, extending the features Weebly offers to help meet our user's many needs. You'll be given access to APIs, code samples, and snippets to help you easily and quickly create new, and useful apps for Weebly users.
---
## What are Weebly Apps
Consider an <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.app}}">app</a> to be a bundle that contains one or more of the following types of functionality: <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.backend_service}}">backend services</a>, <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.snippet}}">snippets</a>, <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.element}}">elements</a>, <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.dashboard_cards}}">dashboard cards</a>, and <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.themes}}">themes</a>. Your app can include one or more of these (more on what these are, below). Apps are installable ZIP files accessed from the <a href="http://weebly.com/app-center" data-container="body" data-toggle="popover" data-content="{{site.data.glossary.App_Center}}">Weebly App Center</a>, and contain the following:

* Code that needs to reside on your customer's website, such as JavaScript, CSS, and HTML
* A JSON manifest file that defines configuration metadata for your app
* Assets used to display and market your app in the App Center.

All Weebly apps use a manifest to configure certain aspects of the app, such as name, version, and URLs used for installation and management. Weebly apps that require access to user and site information or otherwise need to access the Weebly API, must implement the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.OAuth}}">OAuth process</a>. This flow allows your customer to grant the app permission to be installed access specific data.

While each type of functionality has its own development process, to start creating your app, read the App Policy Requirements and Development topics. These are the requirements and the development steps that all app types must follow. Then use the topics specific to the type you're creating to continue your development.

{% include note.html content="All app types (other than themes) must be approved by Weebly prior to becoming available in the App Center, where all Weebly users can download/purchase them." %}

## Backend Services and Snippets

Backend services are apps that integrate directly with Weebly via the REST API to provide some sort of additional functionality, like analyzing eCommerce orders, synching products, or managing site membership. ​One example of a backend app is Paid Members. This app makes it easy to associate site membership with digital goods so that a site owner can sell access to content, like videos or tutorials. In the app (whose interface resides on an external site), the site owner creates rules that associate a product to a specific member group. When a customer attempts to buy that product, the app accesses the Weebly API to create a membership.
{% include image.html file="pl_backend_paidmembership.png" %}

Snippets are similar to backend apps, except they run on the front-end rather than the backend and include code that's added to every page on the site. For example, an analytics app might include a snippet on every page that gathers metrics.

​To implement a backend service or snippet, you need to create the interface between the Weebly site and the app functionality that lives on your external site. Configuration can be handled from your external site, or you might use an element or a dashboard card.

More about backend services and snippets here.
