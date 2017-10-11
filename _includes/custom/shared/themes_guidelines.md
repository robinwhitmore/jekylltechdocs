## Page Guidelines

Weebly sites have different areas and pages in those areas need specific content. These areas include:
* **General**: Pages like Home, About, and Contact fall into this area
* **Blog**: Pages with functionality like listing blog posts and comments
* **Search**: Displays search results and potentially are filtered
* **Commerce**: Displays products and categories and the checkout flow
* **Navigation**: Area on every page and allows the user to jump from one page to another

Variables in partial files (`.tpl` files) provide the content needed in each of these areas. Only the variables currently on the partial are supported, but you can rearrange the content. The `main.less` file for the theme contains sections with styles for each of these areas. Review the current styles to learn the different classes and element IDs, and change as appropriate. But be sure to include styles for items noted {%if site.project=="designer"%}[here](ds_themes_page.html){%elsif site.project=="cloud"%}[here](cl_themes_page.html){%elsif site.project=="platform"%}[here](pf_themes_page.html){%endif%}.


## Layout Types

Weebly pages (no matter the area) can use one of three different default header layouts. You need to provide {%if site.project=="designer"%}[HTML templates](ds_themes_create_templates.html){%elsif site.project=="cloud"%}[HTML templates](cl_themes_create_templates.html){%endif%} and styling for each header layout you want your theme to support:
{% include custom/partials/parts_headers.md %}
Within the header, you can add an area that allows the user to change the background or layout without having to touch the code.
{% include image.html file="themeHeader.png" caption="You can add an image, color, or a video to the background of the header" %}

​​Within the body, you can add a section and the user can then change the background and layout and move or copy the section without the need for code.
{% include image.html file="themesSectionChange.png" caption="You can add a section" %}
You build headers and sections in the {%if site.project=="designer"%}[HTML templates](ds_themes_create_templates.html){%elsif site.project=="cloud"%}[HTML templates](cl_themes_create_templates.html){%elsif site.project=="platform"%}[HTML templates](pf_themes_create_templates.html){%endif%}.


## Element Guidelines

Weebly elements are what the user drags and drops onto the page to create HTML components. Often, these elements present the user with choices about how they want that element to display. For example, line dividers can have different widths. Forms can have different input elements. Your theme needs to account for each of these setting variables.

Follow these {%if site.project=="designer"%}[element](ds_themes_element_guidelines.html){%elsif site.project=="cloud"%}[element](cl_themes_element_guidelines.html){%elsif site.project=="platform"%}[element](pf_themes_element_guidelines.html){%endif%} guidelines when creating your theme.


## Display Size

Weebly websites are viewed on all sorts of devices - from phones to desktops. You need to make sure your theme looks great on all of them. We recommend designing for the following display sizes:
* **Mobile**: Less than 768 px
* **Tablet**: 768 - 992 px
* **Desktop**: 992-1200 px
* **WidescreenDesktop**: Greater than 1200 px

If your theme is responsive, you should also style for these respective breakpoints. Weebly normally uses the following:
* **Breakpoint 1**: 1024 px (widescreen screens)
* **Breakpoint 2**: 992 px
* **Breakpoint 3**: 767 px
* **Breakpoint 4**: 480 px (smaller mobile screens)


## Colors

Colors are very important in determining the look, feel, and versatility of your theme. There are two optional ways you can offer color versions for your theme: color palettes and variations.

### Color Palettes
{% if site.project=="designer" %}[Color palettes](ds_themes_palette.html){%elsif site.project=="cloud" %}[Color palettes](cl_themes_palette.html){%elsif site.project=="platform" %}[Color palettes](pf_themes_palette.html){%endif%} allow the user to select up to two color choices for their site: a primary color and an accent color. Users can choose the colors, allowing them to better personalize and brand their site. If you want, you can create default palettes that have the primary and accent colors already defined.
​
Here's a theme with one default color palette. Users click the dropper icon to select a different pair of colors if they don't want to use the defaults.
{% include image.html file="theme_palette.png" caption="Palettes provide default color choices and also allow the users to select their own" %}
​
As the theme developer, you decide where those colors are used. You might also use [LESS color operation functions](http://lesscss.org/functions/#color-operations) to create variations on those colors throughout the theme. For example, you might use the primary color for titles, H1 headings and backgrounds, and then a tint of that color for other headings. And you might use the accent color for buttons and links, and then a shade of that color for visited links.

When you activate color palettes, you can choose to have just a primary color or both a primary and accent color.  For example, the Brisk theme has only a primary color defined.
{% include image.html file="themes_palettePrimary.png" caption="Single primary color" %}

### Color Variations
You might also want to provide a light and a dark {% if site.project=="designer" %}[variation](ds_themes_variations.html){%elsif site.project=="platform" %}[variation](pf_themes_variations.html){%elsif site.project=="cloud" %}[variation](cl_themes_variations.html){%endif%} of the your theme. These variations allow you to color aspects of your theme other than where a primary or accent color is being used. For example, the light variation might use a white background on a header, while the dark version uses a black background.
{% include image.html file="theme_lightDark.png" caption="Light and dark versions of the theme" %}

You can also use color variations to create different color schemes for your theme. As with palettes, you determine what aspects of the theme changes when a variation is chosen. For example, you might decide that the background, link, and button colors will change. ​

For example, the Venue theme has four color variations.
{% include image.html file="theme_variations.png" caption="Theme variations are not changeable" %}
Create color variations when you want to provide multiple, but fixed, color options for your theme. But remember, with color variations users can't pick the colors they want. They have to choose from the variations you provide.

Use color palettes when you want users to be able to determine the main color scheme used for their site.

Check out our {% if site.project=="designer" %}[resources](ds_themes_design_resources.html){%elsif site.project=="cloud" %}[resources](cl_themes_design_resources.html){%elsif site.project=="platform" %}[resources](pf_themes_design_resources.html){%endif%} page for sites that can help you with deciding on color palettes for your theme.


## Images

When creating a theme, images often do the best job of selling your design. Because of this, you want to pick good ones. Make sure you understand the permission that comes with the photo(s) you decide to use. Our {% if site.project=="designer" %}[resources](ds_themes_design_resources.html){%elsif site.project=="cloud" %}[resources](cl_themes_design_resources.html){%elsif site.project=="platform" %}[resources](pf_themes_design_resources.html){%endif%} page lists a number of sites that offer free images.

You also need a screenshot of your theme in use on a site to be displayed in the theme chooser shown when users create a site or decide to change their theme. This screenshot  needs to be a `.jpg` file and be 1590px wide, 894px high, with a DPI of 480.


## Fonts

While Weebly users can use the **Theme** tab to change fonts for their site, you should still spend some time designating a few font choices. You can select as many base and accent fonts as your design requires, but we do recommend that you keep your fonts choices to a maximum of 3. Most text elements on a Weebly page will be some variation of an H2, paragraph, list, link, or a block quote.

Similar to images, fonts have their own set of permissions for distributing to third parties. For this reason, we strongly suggest using ​[Google Fonts](https://www.google.com/fonts)​ for your themes, as these are available to redistribute.


## Browser Support

Weebly sites and the editor support Internet Explorer 11 and later, as well as all current versions of self-updating browsers. Make sure to test accordingly, both in the editor and in a published site.
