---
title: About the Weebly REST API
keywords:
type: [concepts, reference]
tags: [getting_started, development, apis]
sidebar: pf_apis_sidebar
permalink: pf_apis_about.html
endpoint: "https://api.weebly.com"
summary: Weebly APIs are provided using REST over HTTPS. See the following sections for more general information about using our APIs.
---
{% include custom/shared/api_about.html %}

<h2>Authentication</h2>
<p>To access the Weebly API, you will need to authenticate using OAuth, allowing you to access resources based on a particular user and site. After the OAuth flow, you will have a token for that user and site, and you must use it in the header to authenticate all requests. Examples in the API docs show how to add this to the header.</p>

<p>Authenticating with invalid credentials will return <code>401 Unauthorized</code>, and continued failures will result in <code>403 Forbidden</code>.</p>

<h2>Scopes</h2>
<p>When you configure OAuth, you need to declare the scope of information your app needs access to. These scopes determine the permissions that the user will need to grant in order for your app to access the API on their behalf. Each endpoint notes the required scope.</p>
