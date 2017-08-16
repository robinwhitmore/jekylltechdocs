## About Plans

The Weebly Cloud platform uses plans to determine what a site does and does not have access to. For example, the Weebly Starter Plan doesn't allow site search, while the other plans do. Video and audio players are only available on the Pro plan{%if site.project=="cloud"%} and above{% endif %}. You create your own plans, including pricing, page limits, and whether or not the plan allows access to the {%if site.project=="designer"%}[Weebly App Center](ds_gs_apps.html) {%elsif site.project=="cloud" %}[Weebly App Center](cl_gs_apps.html){% endif %} (if this is activated for your account), and then associate each of your plans with a Weebly plan. You must create at least one plan, and you must designate one plan as the default that is automatically assigned to a site{%if site.project=="cloud"%} if a user does not pick one{% endif %}.

{% include note.html content="The App Center is not white-labeled. That is, the Weebly brand appears throughout the center." %}

Every site must be associated with one, and only one plan. Sites are associated with a plan when {%if site.project=="designer" %}you [create a site](ds_gs_sites.html){%elsif site.project=="cloud"%}the [site is created](cl_gs_sites.html), either by the user, or by you in the Cloud Admin, or programmatically{% endif %}. If anyone attempts to add functionality to the site that the plan does not support, they will be asked to upgrade.

Your account representative will setup a default set of plans for you to get started. You use Cloud Admin to add and edit your plans{%if site.project=="cloud"%} and if using ﻿plug-ins, import them using the plug-in interface{% endif %}. ​
<hr>

## Create Plans with Cloud Admin

You use the **Packages** icon in Cloud Admin to create the plans you need. For reference, Cloud Admin provides a link that describes and compares all Weebly plans. Use this to decide which plans you'd like to implement for your {{site.customer}}s.
{% include note.html content="Prices shown with the Weebly plan descriptions may not accurately reflect the prices for your account. Please use this only as a reference for plan descriptions, not prices." %}

**To create a plan:**
1. In the [Cloud Admin](weeblycloud.com/admin), click **PACKAGES** and click **Add Plan**.
2. Enter a plan name. The name must be unique.
3. Select the corresponding Weebly plan. Your plan will inherit the functionality available in the Weebly plan.
4. Optionally enable access to the [Weebly App Center](www.weebly.com/app-center). If you don't enable access, no links to the center will display in the Editor. {%if site.project=="cloud"%}You can still create and install your own <span style="color: red">custom apps</span> for this plan.{% endif %} Depending on how your account was configured, free sites may or may not be able to have access to the app center. Ask your account representative for more info.
   {% include tip.html content="Ask your account representative if your unsure whether or not your account has access to the App Center." %}
5. Optionally set a published page number limit (the site can have an unlimited amount of draft, unpublished pages).
6. Set the monthly and/or yearly pricing for the plan.
7. Optionally set the plan as the default. Only one plan can be the default.
<!--TODO: Need a new image for Designer that doesn't show annual plan -->
{% include image.html file="cl_plans.png" %}<br>
{% include note.html content="If you are editing a plan to add App Center access, any sites on that plan immediately gain access to the center once you save your changes. If you revoke access, then sites can't access the App Center going forward, but will continue to be able to use any apps already installed." %}
{% if site.project=="cloud" %}
<hr>

## Create Plans with Plug-ins

If you are using plug-ins, then you can import any plans created in Weebly Cloud as shown above, directly into the plug-in. See the appropriate <span style="color:red">plug-in topics</span> for more info.
<!-- TODO: add link -->
{% include image.html file="cl_plan_whmcs.png" %}

{% endif %}

