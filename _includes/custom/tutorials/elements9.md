We’re done with all the coding, so now it’s time to package up the element, upload it to a site, and test it out!
1. Navigate to your local `PriceChart` directory, select all the contents, and create a zip file.
   {% include note.html content="Be sure to create a zip from the contents of the PriceChart directory and not OF the PriceChart directory." %}
2. In a web browser, open the [{{site.portal}}]({{site.portal_url}}) {%if site.project=="cloud" or "designer" %} and click the **APPS** tab{%elsif site.project=="platform"%} and open the Dev Admin portal by clicking **Developer Login**{%endif%}.
3. Click **Price Chart** to open the app’s detail page.
4. Click **Upload New Version**.
5. Click **Upload New Zip** and select the zip file and click **Upload Version**.
   Your element now appears in the Version History area.
{%if site.project=="platform"%}
6. Fill out the App Store Listing fields as follows:
   * **Short Description**: Create easy to read price charts
   * **Key Features**:
     * Create any number of plans and features
     * Multiple layouts
     * Configurable color scheme
   * **Long Description**: You can create price charts the reflect your price plans. Choose any number of charts and plans.
7. For the graphic assets, upload the files from the assets directory you downloaded and unzipped from Git.
8. Click **Save Draft**.
   Your element now appears in the Version History area.
9. Click **Pricing** at the top of the page. Click the first **Add Plan** link and enter `Free` as the plan name. Select *Free* for the **Plan Type** and click **Save**.
10. Hover over **Get started** and click **Edit**. Replace **Get Started** with `Any number of plans and features`, and remove the description text. Select **Included** from the dropdown. Click **Done** and then click **Save**.
11. Click **Versions** at the top of the page to return to the version overview.
12. Click the **Create a Demo Site** link. This creates a new site where you can build a page to showcase your app (you cannot change the domain of the site, but you can change the name). The site automatically has this version of the price chart app installed. Click **Edit Site** and create a page using the price chart element. Note that a tutorial opens because this is the first time it's being used (you can find out more about creating a tutorial here<!--todo: add link-->). Dismiss the tutorial and view the element's settings, including the tooltip you created. Add another element or two and then click **Publish**.
13. Navigate back to the Dev Admin portal and on the Versions page, click **View in App Center**. A new tab opens and displays what your element will look like once posted to the App Center. Scroll down to view the features, descriptions, and price plan. Click the **Live Demo** button to view the demo site.
{%endif%}
6. {% if site.project=="platform" %}Back on the Dev Admin portal tab, c{%elsif site.project=="cloud" or "designer"%}C{% endif %}lick **Install to Dev Site**, choose the version, and click **Install**.
7. ​Open your test site, and you’ll see that the Price Chart now appears at the bottom of the Editor's sidebar, in the THIRD PARTY group (it will be highlighted to show that it's a new element).{% if site.project=="cloud" %}However, when installed on reseller accounts (and not dev accounts) any custom apps appear at the top of the Editor in a branded area. Note that a tutorial opens because this is the first time it's being used (you can find out more about creating a tutorial here <!--todo: add link -->). Dismiss the tutorial and view the element's settings, including the tooltip you created.{% elsif site.project=="designer" %}However, when installed on your clients' accounts (and not dev accounts) any custom apps appear at the top of the Editor in a branded area. Note that a tutorial opens because this is the first time it's being used (you can find out more about creating a tutorial here <!--todo: add link -->). Dismiss the tutorial and view the element's settings, including the tooltip you created.{% endif %}