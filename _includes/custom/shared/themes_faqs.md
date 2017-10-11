## ​WHAT HAPPENS TO OPTION, COLOR, AND FONT SETTINGS WHEN A THEME IS UPDATED?

{% if site.project=="designer" %}[Theme options](ds_themes_options.html){%elsif site.project=="cloud" %}[Theme options](cl_themes_options.html){%elsif site.project=="platform" %}[Theme options](pf_themes_options.html){%endif%} are set at the site level. All settings are retained after an update. However, if you make a change to an existing option, then the that option is set to the default after an update.


## CAN I FORCE A THEME UPDATE TO PUBLISHED SITES?

If you want to force theme updates to live sites, use the Site API<!--todo: API link--> to republish sites after you upload the new zip.


## WILL OPTION SETTINGS ON ONE SITE AFFECT ANOTHER?

{% if site.project=="designer" %}[Theme options](ds_themes_options.html){%elsif site.project=="cloud" %}[Theme options](cl_themes_options.html){%elsif site.project=="platform" %}[Theme options](pf_themes_options.html){%endif%} allow site owners to personalize some aspect of the theme. These settings live in the manifest for that site and that site only, so these settings will never affect how the theme displays on another site. The same holds true for color palette and variation settings and any changes made to fonts from the Theme tab of the editor.


## WILL COLOR PALETTE OR VARIATION SETTINGS ON ONE SITE AFFECT ANOTHER?

{% if site.project=="designer" %}[Color palette](ds_themes_palette.html){%elsif site.project=="cloud" %}[Color palette](cl_themes_palette.html){%elsif site.project=="platform" %}[Color palette](pf_themes_palette.html){%endif%} and {% if site.project=="designer" %}[variation](ds_themes_variations.html){%elsif site.project=="cloud" %}[variation](cl_themes_variations.html){%elsif site.project=="platform" %}[variation](pf_themes_variations.html){%endif%} settings allow site owners to change colors used in the theme. These settings live in the manifest for that site and that site only, so these settings will never affect how the theme displays on another site. The same holds true for option settings and any changes made to fonts from the Theme tab of the editor.


## WHAT HAPPENS IF A USER EDITS THE THEME?

As long as a user has {% if site.project=="designer" %}[access](ds_gs_access_sites.html){%elsif site.project=="cloud" %}[access](cl_gs_access_sites.html){%elsif site.project=="platform" %}[access](pf_gs_access_sites.html){%endif%} to the Theme tab, then they can edit the theme's files. However, as soon as they try to save those changes, the theme is forked and they are forced to save the theme with a new name, and the site will now use that new theme. No other site will be affected by their changes.


## HOW CAN I RESTRICT ACCESS TO THE THEMES TAB?

Users that are owner's of a site will always have access to the Theme tab and will be able to edit the theme. If don't want a user to have that access, then you need to make that user a {% if site.project=="designer" %}[site contributor](ds_gs_access_sites.html){%elsif site.project=="cloud" %}[site contributor](cl_gs_access_sites.html){%elsif site.project=="platform" %}[site contributor](pf_gs_access_sites.html){%endif%} rather than the owner. When you create a contributor, make sure to limit their editor permissions. You can choose to hide the Theme tab by not selecting Theme Tab, or you can disallow just editing the theme's files by not selecting Edit HTML/CSS.