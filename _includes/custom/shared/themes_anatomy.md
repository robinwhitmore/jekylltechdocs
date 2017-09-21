## HTML Template Pages and Layout
<div style="width:100%;overflow:hidden">
    <div style="width:60%;overflow:hidden;float:left">
        <p>Weebly templates are HTML pages that use the Mustache templating language. Mustache allows pages to use variables that are resolved using data from the site. A Weebly page usually has the following:</p>
<ul>
<li><strong>Menu/navigation</strong>: This area contains the generated navigation (created based on how the site owner organizes their pages), cart, login, and optionally search. Some themes place this at the top of the page, some after a header image, and others at the bottom.</li>

<li><strong>Header/banner</strong>: At the top of the page, this area generally includes the headline and any headline text, often in a banner. The user can change the background of a header, insert a video, or change the height or layout, all without needing to touch any code. And as a theme developer, you don't need to do anything extra to provide this functionality if you start with the Base theme (or other theme). It's built in.
    <!--todo: figure out why size isn't working here-->
    <img src="images/themeHeader.png" width="100px"></li>
</ul>

    </div>
<div style="float:right">
{% include image.html file="themeslayout.png" %}
    <!--todo: not displaying on git pages-->
</div>
</div>
* **Body/content**: This is the area where site owners add their main content by choosing from predefined layouts, or by designing the area from scratch using elements (you don't need to add that functionality to your theme - like the header layouts, it's built in). You can add sections to the body, which allow the owner to add distinct areas with different layouts. If you don't include sections in your template, users can add them later, after they choose your template.
    {% include image.html file="themesSectionChange.png" caption="You can drag elements into the body area" %}

* **Footer**: The universal section at the bottom of every page.
​
<p>&nbsp;</p>
When site owners create a page, they choose from three different header types that determine where the above areas are displayed:
* **Header**: Has a title bar area with navigation and title/logo above a header area that normally consists of a banner image or video. The content area displays below the banner image.
    {% include image.html file="theme_header.png" caption="The Header type contains a banner above the content" %}

* **No Header**: Doesn't have a header area with a banner image. Only the title bar area and content areas display.
    {% include image.html file="theme_noheader.png" caption="The No Header type doesn't display a banner" %}

* **Splash**: Doesn't have a content area and the banner image is the full size of the page.
    {% include image.html file="theme_splash.png" caption="The Splash type has a banner image and doesn't have a content area" %}

As a theme designer, you determine how each of the header types should be designed. For example, one theme might have a Header template designed like this:

{% include image.html file="themeLayout1.png" caption="Header template with logo and navigation above a banner" %}

While another theme's Header page might look like this:

{% include image.html file="themeLayout2.png" caption="Header template with logo above navigation" %}

You need to create templates for these header types (you don't have to create one for every type and you can create different types). The templates are in HTML and use variables to provide the content. You add `div` tags for each of the areas on the page (eg: logo/title, navigation, banner) to provide the general layout, and then add references to variables like `{menu}` or to pull the content into those areas. More about creating the templates here<!--todo: link-->.

## Partials

While the template determines the general layout of a page, the specific content displayed on that page is controlled by partials. Partials are just what they sound like - an incomplete page, like an include or import. For example, any page in the site can use any template (one with a header, one without), but a page containing products has a very specific way of displaying a product within that template.  The Product partial determines that display. As a theme developer, you can customize the structure and styling of some of these partials.
{% include image.html file="themePartial.png" caption="Partials determine how content displays" %}

You can also create your own partials. This might be useful when you want something to appear throughout the site. You create your own partial, include it in a Weebly partial, and then it will appear on every page that uses that partial.

More about partials here.<!--todo: link-->

## Theme Styles and Colors
Weebly themes use {%if site.project=="designer"%}[LESS](ds_themes_LESS.html){%elsif site.project=="cloud"%}[LESS](cl_themes_LESS.html){%elsif site.project=="platform"%}[LESS](pf_themes_LESS.html){%endif%}
to style components on a page. LESS extends CSS and adds features like variables and mixins. The main stylesheet for all themes is named main.less. It contains the classes, pseudo-classes, and IDs to style the different areas of the page - headers, navigation, banner, content, footer, forms and buttons, and so on. You can edit the existing LESS file as needed. In fact, you'll likely do most of your work in this file.

Themes can use a {%if site.project=="designer"%}[color palette](ds_themes_palette.html){%elsif site.project=="cloud"%}[color palette](cl_themes_palette.html){%elsif site.project=="platform"%}[color palette](pf_themes_palette.html){%endif%} to deterimine the main color scheme for a site. Palettes are optional, but they do provide a way for users to determine the main colors used on their site. A palette defines the primary color for the site, plus an optional accent color. As a theme designer, you determine where these two colors are used. You can provide any number of predefined palettes for the theme, and users can also select their own.

Here's a theme with two predefined palettes. The user can click the eyedropper icon to select any other two colors they'd prefer.
{% include image.html file="theme_paletteBlue.png" caption="Theme with a blue and pink palette" %}

​You can further define the color scheme of a theme by providing light and dark {%if site.project=="designer"%}[color variations](ds_themes_variations.html){%elsif site.project=="cloud"%}[color variations](cl_themes_variations.html){%elsif site.project=="platform"%}[color variations](pf_themes_variations.html){%endif%}. Color variations are a way to define specific colors for areas of a site. For example, you might create a light variation that has a white background in the header like the one above, and a dark variation that uses a black background.
{% include image.html file="theme_paletteBlueDark.png" caption="Same theme with a dark variation" %}

​Aside from light and dark variations, you can create color variations to provide color schemes that the user can't customize. For example, the Venue theme offers 4 different color variations:
{% include image.html file="theme_variations.png" caption="Theme with color variations" %}

​Clicking a color changes the colors used for the header background and button background, among other things. Here's the same theme, but using the dark red version.
{% include image.html file="theme_variationsRed.png" caption="Theme with color variations" %}

Both versions and palettes use variables in the LESS files to handle the color selections. More about implementing color variations for your theme {%if site.project=="designer"%}[here](ds_themes_variations.html){%elsif site.project=="cloud"%}[here](cl_themes_variations.html){%elsif site.project=="platform"%}[here](pf_themes_variations.html){%endif%}.

​Palettes and variations are completely optional. If you don't want users to be able to change the color scheme of your theme, then you don't need to implement them.

## Theme Functionality

When you create a Weebly theme, you can provide {%if site.project=="designer"%}[options](ds_themes_options.html){%elsif site.project=="cloud"%}[options](cl_themes_options.html){%elsif site.project=="platform"%}[options](pf_themes_options.html){%endif%} that allow the user to change the way the theme functions or displays. For example, you might allow the user to choose how the nav bar displays (either sticky or static) or you might allow them to place a color overlay over the banner image. If you can control it with CSS, you can make it an option. Or you can choose to not provide any options at all.
{% include image.html file="theme_optionNav.png" caption="Users set options in the editor" %}
{% include note.html content="When you provide options or color palettes/variations, if you update your theme, the user's choices will remain after they receive the update." %}

## JavaScript

Weebly themes use JavaScript to add functionality like event handling and mobile display. You should include the basic scripts that come with the theme you are using as your base, and then you can add your own scripts in your own custom file.
{%include note.html content="Any URLs used in external scripts for your theme must use the `HTTPS` protocol." %}

