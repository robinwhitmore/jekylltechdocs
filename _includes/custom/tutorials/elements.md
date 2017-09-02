In this tutorial, youll learn how to recreate the [Weebly Price Chart](ds_apps_samples.html#pricing-chart-element) sample element, package it up and test it. This element displays a given number of price plans, each with a given number of metrics.

{% include note.html content="The theme determines things like font and color, so how the Price Chart Displays in your site may be different than what you see in this tutorial." %}

{% include image.html file="sh_priceChart.png" alt="Weebly Price Chart" caption="The Weebly Price Chart" %}

**You'll learn how to:**
* Follow Weebly best practices for designing an element
* Register an app
* Create the needed directory structure
* Create the apps manifest, including the configuration settings needed for the element to function properly
* Create the HTML, CSS, and JavaScript files for the element
* Package up the app and install it to a test site

**Time to complete:** About 45 minutes

**User experience:** Intermediate web design with knowledge of CSS

**Prerequisites:**
* The Price Chart sample application
  We'll be recreating this application in this tutorial. Youll need the files to compare your work, and in some cases, to complete a step. [Download](https://github.com/Weebly/price-chart-app) the app and the assets zip files from our Git repository, and unzip them to a local directory.
* A code editor that can handle HTML, JavaScript, CSS, and JSON

<div class="next">
{% if site.project=="cloud" %}
<a href="cl_element_1.html"><button type="button" class="btn btn-primary">Let's get started!</button></a>
{% elsif site.project=="platform" %}
<a href="pf_element_1.html"><button type="button" class="btn btn-primary">Let's get started!</button></a>
    {% elsif site.project=="designer" %}
    <a href="ds_element_1.html"><button type="button" class="btn btn-primary">Let's get started!</button></a>
{% endif %}
</div>
