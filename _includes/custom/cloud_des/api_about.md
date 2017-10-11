## Signing and Authenticating Requests
The API is validated using both a public key and a private HMAC Hash of the request contents. These values must be passed in the request header as `X-Public-Key` and `X-Signed-Request-Hash`. To get started making requests, you will need YOURAPIKEY and YOURAPISECRET which can be generated and obtained on the {% if site.project=="designer" %}[Settings](ds_gs_configure.html#view-and-create-api-keys-and-secrets){%elsif site.project=="cloud" %}[Settings](cl_gs_configure.html#view-and-create-api-keys-and-secrets){%endif%} tab in the Weebly Cloud Admin provided for your account.  YOURAPISECRET is a shared secret known only to you and Weebly Cloud. Do not share YOURAPISECRET.


~~~ shell
POST /hosts/user/39793399/site HTTP/1.1
User-Agent: curl/7.30.0
Host: api.weeblycloud.com
Accept: */*
Content-type: application/json
X-Public-Key: YOURAPIKEY
X-Signed-Request-Hash: YOURSECRETHASH
~~~

In the example above, `YOURAPIKEY` refers to your API Key. This API Key is used by our system to identify your account. `YOURSECRETHASH` refers to the base-64 encoded HMAC-SHA256 signature. The signature will need to be computed for each request.  You can generate `YOURSECRETHASH` using an HMAC-SHA256 hash of the request TYPE (Ex. POST), URL (ex. user/234256/loginLink) and any REQUEST DATA (ex. `{ 'plan_id': 34 }`) using `YOURAPISECRET` as the key, and base-64 encoding the result. Any requests that do not contain a valid signature will be rejected. Since `YOURAPISECRET`  is shared only by you and Weebly Cloud, we are able to validate your request by generating the same HMAC-SHA256 signature and match it against `YOURSECRETHASH`.

~~~ php
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
~~~

Note the line below which generates the hash for this request.

~~~
$hash = hash_hmac('SHA256', $request_type . "\n" . $url . "\n" . $content, $api_secret);
~~~

## Errors

When a call can't sucessfully complete, Weebly throws an error and returns in the JSON response.

~~~ JSON
{
    "error": {
        "code": 900,
        "message": "brand_name field missing"
    }
}
~~~


Following are the error codes and descriptions&#58;
<table>
    <tr>
        <td>​100</td>
        <td>Invalid hash provided.<br>The hash does not match the request</td>
    </tr>
    <tr>
        <td>101</td>
        <td>Unknown API key provided.<br>Check the Admin portal to verify that your key still exists.</td>
    </tr>
    <tr>
        <td>102</td>
        <td>This Weebly account doesn't have API access.</td>
    </tr>
    <tr>
        <td>200</td>
        <td>This Weebly account doesn't have access to this user.</td>
    </tr>
    <tr>
        <td>201</td>
        <td>This Weebly account doesn't have access to this site.</td>
    </tr>
    <tr>
        <td>300</td>
        <td>Query cannot be routed.</td>
    </tr>
    <tr>
        <td>​900</td>
        <td>​Invalid request.</td>
    </tr>
    <tr>
        <td>​999</td>
        <td>​An unknown error occurred.</td>
    </tr>
    <tr>
        <td>​-32001</td>
        <td>​Invalid namespace or function name.</td>
    </tr>
    <tr>
        <td>​-32002</td>
        <td>​Class not found.</td>
    </tr>
    <tr>
        <td>​32404</td>
        <td>​Invalid request.</td>
    </tr>
    <tr>
        <td>​32600</td>
        <td>​Invalid request.</td>
    </tr>
    <tr>
        <td>​32601</td>
        <td>​Method not found.</td>
    </tr>
    <tr>
        <td>32602</td>
        <td>Invalid parameters - too few.</td>
    </tr>
</table>
