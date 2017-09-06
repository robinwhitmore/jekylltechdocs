## Access Your Apps
All of your apps are accessed and managed from the **APPS** tab of the <a data-container="body" data-toggle="popover" data-content="{{site.data.glossary.Cloud_Admin}}">Cloud Admin</a>. Your current apps are listed along with the latest version and date last updated.
{% include image.html file="cl_apps_list.png" caption="A list of apps in the Cloud Admin"%}
Click an app to view its detail page.

## View Detailed App Information
Clicking an app's row on the main admin page takes you to its detail page where you can see the latest version of your app, the number of installs, and where you can upload<!--TODO: add link--> and manage versions.
{% include image.html file="cl_apps.png" caption="App detail page in the Cloud Admin"%}

​​The top left card on this page displays your app's information, including the information used for Weebly to programmatically recognize you: your client ID and your secret.

We create a development user and site for you. The development site is the Weebly-hosted site you can use to test<!--TODO: add link--> your app. Click **Edit Site** to open the Weebly editor where you can set up your development site. Click **Show Details** to view the Site Details page for your developer site. Here, you can view the development user and site information. This site always publishes to `[some_random_id].weebly.com`{%if site.project=="cloud"%}, whether or not you allow `setPublishCredentials` for the site{%endif%}. You can install as many versions of the app to this site as you need, and they can be in any status (see next section).

The site is associated with the Developer Test plan, which is a Weebly plan used only for testing apps. It's associated with the highest level Weebly plan, so all features are enabled. You can not delete or edit this plan.

Once your app is fully tested, you can associate<!--TODO: add link--> your app to a different Weebly plan. Any site associated with that plan will have the app automatically installed.

## Set App Status
When you first upload your app, its status is automatically set to `Draft`, and it can only be installed to your development site. You can have as many draft versions as you need.

**To set app status:**

From the App Detail page of the Cloud Admin, click the ellipses for the version whose status you want to change.
<table width="100%">
    <tr>
     <th>If the current status is:</th>
     <th>You can change it to:</th>
     <th>Notes</th>
    </tr>
    <tr>
        <td><code>Draft</code></td>
        <td><code class="highlighter-rouge">Active (Published)</code></td>
        <td>You can have only one version in the <code class="highlighter-rouge">Active</code> status. The previously active version is set to <code>Archived</code>.</td>
    </tr>
    <tr>
        <td><code>Draft</code></td>
        <td><code>Archived</code></td>
        <td>If you set an <code class="highlighter-rouge">Active</code> version to <code>Draft</code> and then <code>Archived</code> and you don't set a different version to <code>Active</code>, then the app will be removed from the editor sidebar (if an element), but any elements already on a page will remain, and will use the last active version. All webhooks are immediately removed, and snippets are removed the next time the site is published.</td>
    </tr>
    <tr>
        <td><code class="highlighter-rouge">Active</code></td>
        <td><code>Draft</code></td>
        <td><!--todo: need to find out what happens to installs<!-->&nbsp;</td>
    </tr>
    <tr>
        <td><code>Archived</code></td>
        <td><code>Draft</code></td>
        <td> &nbsp;</td>
    </tr>
</table>
{% include image.html file="cl_app_status.png" caption="Set status for an app" %}

