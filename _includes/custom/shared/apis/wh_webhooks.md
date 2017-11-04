Webhooks allow your app to be notified of events that happen in a Weebly site. For example, your app can be notified when a site is published, store products get updated, or an order is created. You configure a callback URL and events are sent to that address using a `POST` request. You can use the information you receive from the webhook to get further information from the API.

## Subscribe to Webhooks
Before you can use webhooks, you need to subscribe to the events, using your app's {% if site.project=="designer" %}[manifest](ds_apps_manifest.html){%elsif site.project=="cloud" %}[manifest](cl_apps_manifest.html){%elsif site.project=="platform" %}[manifest](pf_apps_manifest.html){%endif%}. Set the callback URL (where the event notice should be sent) and an array of the events you want to be notified of.

Refer to these docs for the supported events:
* {% if site.project=="designer" %}[User](ds_wh_user.html){%elsif site.project=="cloud" %}[User](cl_wh_user.html){%elsif site.project=="platform" %}[User](pf_wh_user.html){%endif%}
* {% if site.project=="designer" %}[Site](ds_wh_site.html){%elsif site.project=="cloud" %}[Site](cl_wh_site.html){%elsif site.project=="platform" %}[Site](pf_wh_site.html){%endif%}
* {% if site.project=="designer" %}[Store](ds_wh_store.html){%elsif site.project=="cloud" %}[Store](cl_wh_store.html){%elsif site.project=="platform" %}[here](pf_wh_store.html){%endif%}
* {% if site.project=="designer" %}[Membership](ds_wh_member.html){%elsif site.project=="cloud" %}[Membership](cl_wh_member.html){%elsif site.project=="platform" %}[Membership](pf_wh_member.html){%endif%}
* {% if site.project=="designer" %}[Form](ds_wh_form.html){%elsif site.project=="cloud" %}[Form](cl_wh_form.html){%elsif site.project=="platform" %}[Form](pf_wh_form.html){%endif%}
* {% if site.project=="designer" %}[Blog](ds_wh_blog.html){%elsif site.project=="cloud" %}[Blog](cl_wh_blog.html){%elsif site.project=="platform" %}[Blog](pf_wh_blog.html){%endif%}


For example, if you want to be notified when a store payment happens and when a site is updated, you'd set something like this in the manifest (read the {% if site.project=="designer" %}[manifest](ds_apps_manifest.html){%elsif site.project=="cloud" %}[manifest](cl_apps_manifest.html){%elsif site.project=="platform" %}[manifest](pf_apps_manifest.html){%endif%} topic for comprehensive placement and syntax info):


<p class="codeTitle">Subscribe to Webhooks:</p>
{% highlight json %}
"webhooks": {
  "callback_url": "https://my-site.com/webhooks",
  "events": ["store.order.pay", "site.update"]
},
{%endhighlight%}

## Receive Webhooks

​When you subscribe to an event, you’ll receive a `POST` request at the callback URL you specified. To acknowledge that you received the webhook without error, your server should return a `200` HTTP status code, otherwise we will consider it not received (we will attempt 12 retries over a space of 48 hours before failing).

All webhooks contain the following payload:
* `client_id`: Your client ID found on your Developer Admin Portal page
* `client_version`: The app’s version
* `event`: The event name
* `timestamp`: Unix epoc time
* `data `: Additional data, based on the event (refer to the docs to understand exactly what data will be returned)
* `hmac`: The `client_id`, `client_version`, `event`, `timestamp`, and `data`, process through HMAC-SHA256 using the app's secret key.

​Fields will be in the same order as the list above. For example, for the `site.publish` webhook, you might have this in the hash:
{% highlight json %}
{"client_id":"CLIENT_ID","client_version":"VERSION","event":"EVENT","timestamp":TIMESTAMP,"data":{"user_id":"USER_ID,"site_id":"SITE_ID","domain":"DOMAIN"}}
{% endhighlight %}

You might decode and verify like this:

{% highlight shell %}
$hash_string = '{"client_id":"[CLIENT_ID]","client_version":"[VERSION]","event":"[EVENT]","timestamp":[TIMESTAMP],"data":{"user_id":"[USER_ID],"site_id":"[SITE_ID]","domain":"[DOMAIN]"}}';
$hash = hash_hmac('sha256', $hash_string, SECRET_KEY);
{% endhighlight %}

You can use the data provided in the webhook to fetch additional data from a relevant API. For example, say you want to be notified when an order is paid and then get additional info about the transaction.  You would subscribe to the `store.order.pay webhook`. According the the doc, the additional payload will be:

* `user_id `(string)
* `site_id `(string)
* `order_id `(string)
* `order_billing_id `(string)
* `order_billing_transaction_id `(string)

So here’s what might be sent:
{% highlight json %}

{
  "client_id":"109104XXXX",
  "client_version":"1.0.0",
  "event":"store.order.pay",
  "timestamp":1440016771,
  "data": {
    "user_id":"5530XXXX",
    "site_id":"37391779819XXXX",
    "order_id":"1826571643",
    "order_billing_id":"1",
    "order_billing_transaction_id":"1"
  },
"hmac":"XXXXXXXX"
}
{% endhighlight %}

From that, you might use the `order_id` API to get info like the amount of the transaction, the order items, shipment info, etc.
