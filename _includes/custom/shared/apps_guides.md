## Element Flow

How an element behaves when dropped onto a page is an important user interaction, so try to emulate the Weebly elements, as closely as possible. Weebly elements generally fall into one or a combination of one of the following user flows:
* **Simple**: There are no settings. Weebly examples include Title and Text.
* **Settings**: The element has configurable settings. The Weebly Map and Button are examples of elements that use settings.
* **Connect**: The element connects to external data. The user is presented with a popup dialog (optionally auto-pop) in order to find or create the data needed for the element. The Weebly Product element is an external element. It connects to a product in the store's catalog.

## Design the Element Settings

When determining settings for your element, try to use the same setting metaphors that you see in Weebly elements. Use the Weebly settings UI (the default) and try to not call out to an external site that displays in an iFrame. External settings can be confusing to our users as they are used to the way Weebly elements and their settings behave.

Here are some questions to think about before you start coding. You'll need the answers in order to create your element:
* Should the element dialog display automatically when the element is dropped onto the page? Or will the user need to click the element to open the dialog?
* Will the element's settings display in the native Weebly dialog using Weebly components (preferred) or will the user be presented with an external site displayed in an iframe?
* What type of display (such as text, integer, color picker) is needed for each setting? The Weebly dialog supports {% if site.project=="designer" %}[these types](ds_apps_element_settings.html#setting-types){%elsif site.project=="cloud" %}[these types](cl_apps_element_settings.html#setting-types){%elsif site.project=="platform" %}[these types](pf_apps_element_settings.html#setting-types){%endif%}.
* What settings can be grouped together and displayed on one dialog page? What settings will need their own section?
* Do the settings require tooltips to help the user configure them correctly?
* Is configuring and using the element complicated and so might need a tutorial? Should the tutorial be include a set of steps or a video?
* What needs to be handled if a user copies the element to another page?
  Users can copy elements and place the copy on other pages in their site. All setting values are also copied over.
* Will your element need to behave differently in the editor than on the published site? If so, you may want to create two sets of JavaScript, HTML, and/or CSS files.

## Element Icon

​You need to create an `svg` file to represent your element in the element tray. It must be named `icon.svg`, and must live in the root folder of your element.  Follow our element icon {% if site.project=="designer" %}[guidelines](ds_apps_icon.html){%elsif site.project=="cloud" %}[guidelines](cl_apps_icon.html){%elsif site.project=="platform" %}[guidelines](pf_apps_icon.html){%endif%} when creating your icon.

## Element Placeholder

​Your element when displayed in the editor (the element placeholder) should give a preview of the content that will be displayed on the published site. This placeholder can allow minimal interactivity. For example, when dropped onto a page, your element might allow users to directly edit content or forms in the content, but there shouldn't be any navigation or any wizard-like behavior. Plan your settings to handle this type of interactivity. You can create alternate HTML templates, Javascript, and CSS for the element placeholder when you need it to behave differently in the editor than on the published page.

{% include note.html content="The width of the placeholder can always be adjusted by the user. Weebly handles this resizing for you - please don't set a width on your element or it will not resize correctly on the page. For example, if the element has a set width and is dropped on a page and then a column is put next to it, it will stay at the predefined width and not display properly." %}
