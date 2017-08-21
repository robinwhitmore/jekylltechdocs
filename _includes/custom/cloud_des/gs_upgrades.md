{% if site.project=="cloud"%}The Weebly Cloud platform provides a convenient way for external systems to handle changes to account billing and plans. {% endif %}When a user encounters a feature in the Weebly Editor that is part of a plan they do not currently have, they will be prompted to upgrade. This triggers a popup window which loads a URL showing the plans they can upgrade to. You need to create this content, and then handle the upgrade.

You set the upgrade URL in the Cloud Admin (or via the API) on either the Weebly Cloud Account or the Site level (in the event a different URL is set at the site and account level, the site level has the higher precedence).
{% include image.html file="cl_upgrade.png" caption="Upgrade settings in the Cloud Admin" %}

​When the user tries to access something requiring an upgrade, the following parameters are passed in the upgrade URL:
* `user_id`: The user identification number.
* `site`: The site the user is modifying.
* `plan`: The lowest supported Weebly plan that contains the requested feature. This may be empty if the upgrade is for an element or theme that is not part of a standard Weebly plan, such as a custom element or theme.
* `upgrade_type`: Element, theme or feature.
* `upgrade_id`: The identifier for the element, theme, or feature.
* `plan_ids`: Comma separated list of all plan ids that satisfy the upgrade request.
* `hash`: A SHA1 hash of the following fields, pipe-separated:
  * `user_id`
  * `site_id`
  * **upgrade hash** (the upgrade hash can be found in the Upgrade Settings section on the Settings tab of Cloud Admin - see the above image).
    Example hash: `"1234567|1234567891011234|fp16iw6bjadsubbpsok8wfze4l3cn222"`.

<p class="codeTitle">Example Upgrade URL:</p>
{% highlight shell%}
http://your-url.com/upgrade.html?user_id=1234567&site=1234567891011234&plan=starter&upgrade_type=feature&upgrade_id=edit_footer&plan_ids=40%2C14%2C41%2C10%2C35%2C39&hash=e71ca960fad7e87df447bb7879a27a8d14fa5a48&
{% endhighlight %}

<p class="codeTitle">Upgrade Hash:</p>
{% highlight json%}
$user_id = 4736582015;
$site_id = 59705954748010;
$upgrade_hash = 'fp16iw6bjadsubbpsok8wfze4l3cn222';
$hash = sha1($user_id . "|" . $site_id . "|" . $upgrade_hash);
{% endhighlight %}

This hash is a way for the upgrade window to verify the request is coming from the Weebly editor. You need to verify the hash by comparing it to the hash set the Settings section of Cloud Admin. Once verified, you then need to handle the purchase of the upgrade.

Once a {{site.user}} has successfully purchased a new plan, you must call the Plan API to change the plan for the site. You then should display confirmation content in the popup notifying the {{site.user}} that their account has been upgraded. Once the popup is closed, the Weebly Editor will be refreshed and the new plan loaded.