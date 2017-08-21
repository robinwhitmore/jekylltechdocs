---
title: View and Pay Weebly Invoices
keywords: invoices, clients, bills, billing
t_type: [task]
tags: [getting_started, clients]
sidebar: ds_gs_sidebar
permalink: ds_gs_invoice.html
summary: Cloud Admin has a Billing tab that displays your current Weebly invoices. You can view the details of those invoices and download the current activity. You can also pay invoices from here.
---
{% if site.project=="cloud" %}
{% include note.html content="If you are a subreseller, then access to the billing tab is restricted to your Parent reseller." %}
{% endif %}
## Configure a Billing Address
When you first visit the Billing tab, you need to set up contact information for where Weebly's invoice should be sent.
**To configure a billing address:**
1. From the Billing tab of the Cloud Admin, click **Add Billing Information**.
2. In the dialog, enter the appropriate info.
This is where all monthly invoices from Weebly will be sent.
{% include image.html file="cl_billing_create.png" caption="Create a billing address" %}

## View Weebly Invoices
You use the Billing tab of the Cloud Admin to review current Weebly invoices.

**To view Weebly invoices:**
1. From the Cloud Admin, click the **Billing** tab.
   {% include image.html file="cl_billing.png" caption="Current invoices in the Cloud Admin" %}
2. Click the invoice to view the charges on the details page.
   You can see the activity for each billing item - usually each Weebly plan that you support.
   {% include image.html file="cl_billing_details.png" caption="Current invoices in the Cloud Admin" %}
3. To download a CSV version, click **Request Site Activity Data**. The file will be sent to the email you entered for the billing contact and you can also download the file directly.
   The CSV includes the following:
   * User ID
   * Site ID
   * Domain
   * Plan ID
   * Plan name
   * Weebly plan name
   * Wholesale price
   * Date
   * Charge term
   * Charge type

## Pay Weebly Invoices
You can also pay your invoices from the Billing tab of the Cloud Admin.

**To pay your Weebly invoice:**
1. From the Cloud Admin, click the **Billing** tab.
2. Click **Pay Now** for the invoice you'd like to pay, or you can click the invoice to view the details and click **Pay Invoice**.
   {% include image.html file="cl_billing_details.png" %}
