---
title: About the Weebly Cloud REST APIs
keywords:
tags: [apis, getting started]
sidebar: cl_apis_sidebar
permalink: cl_apis_about.html
summary: Weebly APIs are provided using REST over HTTPS and utilize the HTTP verbs GET, POST, PUT, PATCH and DELETE. We provide a number of client libraries to help get you started. See the following sections for more general information about using our APIs.
---
## Client Libraries

Looking for an easy way to get started with our API rather than having to piece it all together yourself? Install one of our client libraries! These libraries make it easy to interact with our API:

* Language-specific calls that process the HTTP for you so you can work directly with resources in your code. For example, our PHP library has a createUser method that you can use without having to provide HTTP header info. The returned new user is a resource you can work with directly, instead of having to process an HTTP response.
* Easier authorization.
* Fully documented, with robust examples.

​Download our libraries on GitHub here:

* [PHP](https://github.com/Weebly/cloud-client-php)
* [Ruby](https://github.com/Weebly/cloud-client-ruby)
* [Python](https://github.com/Weebly/cloud-client-python)
* [Java](https://github.com/Weebly/cloud-client-java)

## Endpoint

The Weebly Cloud endpoint is https://api.weeblycloud.com.

{% include note.html content="Previously, the endpoint was https://api.weeblycloud.com/hosts. If any existing code uses this endpoint, it will continue to work." %}

## Schema

All API access is over HTTPS, and accessed from the api.weeblycloud.com domain. All data is sent and received as JSON. Blank fields are included as null instead of being omitted. Dates and times are unix epoch timestamps.

## HTTP Redirects
We may issue redirects. Any call may result in a redirect, at which point you should make an identical call, but to the newly provided resource URL.

## HTTP Verbs
The following are supported:

* GET
​  Used for retrieving resources.
* POST
  Used for creating resources.
* PATCH
  Used for updating resources with partial JSON data.
* PUT
  Used for replacing resources or entire collections. Fields will be replaced with given values and any fields without given values will be reset to their default. Any fields without defaults, for example ID fields, will remain unchanged.
* DELETE
  Used for deleting resources.

## Signing and Authenticating Requests
The API is validated using both a public key and a private HMAC Hash of the request contents. These values must be passed in the request header as X-Public-Key and X-Signed-Request-Hash. To get started making requests, you will need YOURAPIKEY and YOURAPISECRET which can be generated and obtained on the Settings tab in the Weebly Cloud Admin provided for your account.  YOURAPISECRET is a shared secret known only to you and Weebly Cloud. Do not share YOURAPISECRET.

```shell
POST /hosts/user/39793399/site HTTP/1.1
User-Agent: curl/7.30.0
Host: api.weeblycloud.com
Accept: */*
Content-type: application/json
X-Public-Key: YOURAPIKEY
X-Signed-Request-Hash: YOURSECRETHASH
````
In the example above, `YOURAPIKEY` refers to your API Key. This API Key is used by our system to identify your account. `YOURSECRETHASH` refers to the base-64 encoded HMAC-SHA256 signature. The signature will need to be computed for each request.  You can generate `YOURSECRETHASH` using an HMAC-SHA256 hash of the request TYPE (Ex. POST), URL (ex. user/234256/loginLink) and any REQUEST DATA (ex. `{ 'plan_id': 34 }`) using `YOURAPISECRET` as the key, and base-64 encoding the result. Any requests that do not contain a valid signature will be rejected. Since `YOURAPISECRET`  is shared only by you and Weebly Cloud, we are able to validate your request by generating the same HMAC-SHA256 signature and match it against `YOURSECRETHASH`.

```php
<?php
$base_api = "https://api.weeblycloud.com/";
$api_key = YOURAPIKEY;
$api_secret = YOURAPISECRET;

$request_type = "POST";
$url = "user/39793399/site";
$data = array(
    "domain" => "test-site.com"
);

$content = json_encode($data);
$hash = hash_hmac('SHA256', $request_type . "\n" . $url . "\n" . $content, $api_secret);
$hash = base64_encode($hash);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $base_api.$url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $request_type);
curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
	'Content-type: application/json',
	'X-Public-Key: ' . $api_key,
	'X-Signed-Request-Hash: ' . $hash
));

$out = curl_exec($ch);
$info = curl_getinfo($ch);
curl_close($ch);

$result = json_decode($out);
````
Note the line below which generates the hash for this request.

```php
$hash = hash_hmac('SHA256', $request_type . "\n" . $url . "\n" . $content, $api_secret);
````
## Search Parameters
Some endpoints allow you to use search parameters in order to filter your results. When using parameters, do not add that query string to your HMAC Hash.
