---
title: About the Weebly REST API
keywords:
tags: [getting started, development, apis]
sidebar: pf_apis_sidebar
permalink: pf_apis_about.html
summary: Weebly APIs are provided using REST over HTTPS. See the following sections for more general information about using our APIs.
---
## Enpoint
The endpoint is: `https://api.weebly.com/`.

## Versions
We encourage you to explicitly request this version via the Accept header.
 ~~~sh
 Accept: application/vnd.weebly.v1+json
 ~~~~

 ## Schema
 All API access is over HTTPS, and accessed from the `api.weebly.com` domain. All data is sent and received as JSON. Blank fields are included as null instead of being omitted. Dates and times are Unix Epoch timestamps.

 ### List View
 When retrieving a list of resources, a summary list view of each resource is returned. In some cases, this is akin to a compound primary key. In most root resource cases, like product, the list view contains enough information to make a workable list view in an application without making calls for each resource.

 ### Detail View
 When retrieving a single resource, you will receive a detailed view typically resulting in all the attributes of the resource. In addition, sub resources (like a product's skus) that are owned by this resource are inlined to the result. Other resources (like categories) which are associated but not owned by this resource provide the ids needed to look them up separately.

## HTTP Redirects
We may issue redirects. Any call may result in a redirect, at which point you should make an identical call but to the newly provided resource URL.

## HTTP Verbs
You can use the following:
* GET
​  Used for retrieving resources.
* POST
  Used for creating resources.
* PATCH
  Used for updating resources with partial JSON data.
* PUT
  Used for replacing resources or entire collections.
* DELETE
  Used for deleting resources.

## Authentication
To access the Weebly API, you will need to authenticate using OAuth, allowing you to access resources based on a particular user and site. After the OAuth flow, you will have a token for that user and site, and you must use it in the header to authenticate all requests. Examples in the API docs show how to add this to the header.

Authenticating with invalid credentials will return 401 Unauthorized, and continued failures will result in 403 Forbidden.
