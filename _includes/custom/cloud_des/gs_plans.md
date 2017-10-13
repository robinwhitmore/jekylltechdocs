## About Plans

The Weebly Cloud platform uses plans to determine what a site does and does not have access to. For example, the Weebly Starter Plan doesn't allow site search, while the other plans do. Video and audio players are only available on the Pro plan{%if site.project=="cloud"%} and above{% endif %}.

You create your own plans, including pricing, page limits, and whether or not the plan allows access to the {%if site.project=="designer"%}[Weebly App Center](ds_gs_apps.html) {%elsif site.project=="cloud" %}[Weebly App Center](cl_gs_apps.html){% endif %} (if this is activated for your account), and then associate each of your plans with a Weebly plan. You must create at least one plan.
{%if site.project=="cloud"%}
{% include note.html content="The App Center is not white-labeled. That is, the Weebly brand appears throughout the center." %}
{%endif%}
When a site is created, it must be associated with a plan, so you need to designate one of your plans as the default plan automatically assigned to every site (it can then be changed). If anyone attempts to add functionality to the site that its plan does't support, they will be asked to {%if site.project=="designer"%}[upgrade](ds_gs_market.html) {%elsif site.project=="cloud"%}[upgrade](cl_gs_market.html){%endif%}.

Your account representative will setup a default set of plans for you to get started. You use <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a> to add and edit your plans{%if site.project=="cloud"%} and if using ﻿plug-ins, import plans using the plug-in interface{% endif %}. ​

## Create Plans with Cloud Admin

You use the **Packages** tab in Cloud Admin to create the plans you need. For reference, Cloud Admin provides a link that describes and compares all Weebly plans. Use this to decide which plans you'd like to implement for your {{site.customer}}s.
{% include image.html file="cl_plans_compare.png" caption="Comparison of Weebly plans" %}
{% include note.html content="Prices shown with the Weebly plan descriptions may not accurately reflect the prices for your account. Please use this only as a reference for plan descriptions, not prices." %}

**To create a plan:**
1. In the [Cloud Admin](https://weeblycloud.com/admin), click **PACKAGES** and click **Add Plan**.
2. Enter a plan name. The name must be unique.
3. Select the corresponding Weebly plan. Your plan will inherit the functionality available in the Weebly plan.
4. Optionally enable access to the [Weebly App Center](http://www.weebly.com/app-center). If you don't enable access, no links to the center will display in the Editor. {%if site.project=="cloud"%}You can still create and install your own <span style="color: red">custom apps</span> for this plan.{% endif %} Depending on how your account was configured, free sites may or may not be able to have access to the app center. Ask your account representative for more info.
   {% include note.html type="tip" content="Ask your account representative if your unsure whether or not your account has access to the App Center." %}
5. Optionally set a published page number limit (the site can have an unlimited amount of draft, unpublished pages).
6. Set the monthly and/or yearly pricing for the plan.
7. Optionally set the plan as the default. Only one plan can be the default.
<!--TODO: Need a new image for Designer that doesn't show annual plan -->
{% include image.html file="cl_plans.png" %}<br>
{% include note.html content="If you are editing a plan to add App Center access, any sites on that plan immediately gain access to the center once you save your changes. If you revoke access, then sites can't access the App Center going forward, but will continue to be able to use any apps already installed." %}
{% if site.project=="cloud" %}


## Create Plans with Plug-ins

If you are using plug-ins, then you can import any plans created in Weebly Cloud as shown above, directly into the plug-in. See the appropriate <span style="color:red">plug-in topics</span> for more info.
<!-- TODO: Cloud: add link -->
{% include image.html file="cl_plan_whmcs.png" %}

{% endif %}

