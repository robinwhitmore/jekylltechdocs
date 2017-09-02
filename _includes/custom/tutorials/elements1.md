A Weebly app is a package that can contain a number of different components used in a Weebly site. For example, an app might contain a back end service that manages mailing lists. Or an app might contain an element that the user drops onto their page to declaratively create a widget. Or it could contain both. In this tutorial, we’ll create an app with an element that allows users to display complicated pricing plans on a web page.

The first thing you need to do when creating an element is determine the look, feel, and functionality of the element and then determine which parts need to be configurable by the web site owner.

Here’s a screenshot of the Price Chart we’ll be developing in this tutorial:

{% include image.html file="sh_priceChart.png" alt="Weebly Price Chart" caption="The Weebly Price Chart" %}

The user can click on all text to edit it, and can edit the button size and text. We can get the text and button elements using Weebly tags. We need to create the table and these configurable settings:
* The number of plans (represented by the number of columns)
* The number of metrics per plan
* Justification of the element in the parent column on the page (left, right, or center)
* Where to place the button: in the bottom row or in the top row with the price
* The currency symbol to use
* Color for backgrounds, number and border

Since each of these need to be configured by the user, they’ll need to be settings on our element.

Now we need to decide how to display these settings to the user in the Settings dialog. Since the settings for the number of plans and metrics affect the table, let’s group those together in the dialog, and group the rest of the settings together since they all affect the display. And since it's important that users understand plans and metrics, let's add a tooltip to both those settings.

We have our design determined, so let’s get started!
