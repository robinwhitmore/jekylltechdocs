## Configure Theme Functionality
Create the `manifest.json` in the root directory.

All manifests must contain the following:

* `manifest`: The version of the Weebly Platform API your application was built to work with.  The only currently supported value is `1`.

* `version`: The version of your theme.  Provided as a string, following [Semantic Versioning](http://semver.org/) guidelines (Major.Minor.Patch: for example 1.5.13).
​
* `enableEditorJS`: Set to `true` if you want your theme to use JavaScript.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> Please be aware of the current {% if site.project=="designer" %}[known issues](ds_themes_issues.html){%elsif site.project=="cloud" %}[known issues](cl_themes_issues.html){%elsif site.project=="platform" %}[known issues](pf_themes_issues.html){%endif%} when enabling JavaScript.</div>
    {% include custom/notes/note_https.md %}



* `responsive`: Set to `true` if your theme is responsive, `false` if not. The default is `false`.

* `​glyph-icons`: Always set to `true` to use the `Glyphicons` social icons. (`False` uses the deprecated `tmpSocialIconFont` and should be avoided.)

* `is-dark`: Set to `true` if your theme has a dark background.
    If your theme has a dark background, certain portions of a site may not display correctly unless you specifically style those areas to account for it. By setting this property to `true`, this styling will be handled for you. ​For example, the Blog Comments area by default uses dark font on a light background. If your theme has a dark background, the font cannot be easily read. By setting this property to true, the font changes to a light color automatically.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If you're creating {% if site.project=="designer" %}[color variations](ds_themes_variations.html){%elsif site.project=="cloud" %}[color variations](cl_themes_variations.html){%elsif site.project=="platform" %}[color variations](pf_themes_variations.html){%endif%}, set this within the variation and not for the theme.</div>

* `color-support` and `color-presets`: You can create color palettes that provide a default primary and accent color that the user can then override, allowing them to personalize and brand their site. See {% if site.project=="designer" %}[Create a Color Palette](ds_themes_palette.html){%elsif site.project=="cloud" %}[Create a Color Palette](cl_themes_palette.html){%elsif site.project=="platform" %}[Create a Color Palette](pf_themes_palette.html){%endif%} for more info on these manifest elements.

* `variations`: You can create different color versions of your theme. For example, you might create a light version and a dark version. You configure the available versions in the manifest. See {% if site.project=="designer" %}[Add Color Variations](ds_themes_variations.html){%elsif site.project=="cloud" %}[Add Color Variations](cl_themes_variations.html){%elsif site.project=="platform" %}[Add Color Variations](pf_themes_variations.html){%endif%} for more info about configuring these elements.

* `custom-options`: You can create configurable options to your theme using our Options framework. For example, you might want to allow the user to turn off social icons or search, or display a phone number. The user sets these options on the Theme Tab. You configure options in the manifest. See {% if site.project=="designer" %}[Add Options to Your Themes](ds_themes_options.html){%elsif site.project=="cloud" %}[Add Options to Your Themes](cl_themes_options.html){%elsif site.project=="platform" %}[Add Options to Your Themes](pf_themes_options.html){%endif%} for details.


## Sample Manifest
Here's a sample manifest for a theme with a color palette, variations, and options

{% highlight json %}
"manifest": "1",
"version": "1.1",
"enableEditorJS": true,
"description": "Unite is a classic with some impressive accessories. Always in style, Unite delivers subtle, yet impressive design elements with neutral backgrounds that set the tone for a range of beautiful website building options.",
"color-support": {
    "primary": true,
    "accent" : true
    },
"color-presets": [
    {
        "primary": "#0cacae",
        "accent" : "#e6f6f6"
    },
    {
        "primary": "#eb6271",
        "accent" : "#fbdfe2"
    }
    ],
"variations": [
    {
        "value": "light",
        "sample": "#fff",
        "is-dark": false
    },
    {
        "value": "dark",
        "sample": "#000",
        "is-dark": true
    }
    ],
"custom-options" : [
    {
        "name" : "hide-sidebar",
        "title": "Collapse Blog Sidebar",
        "type" : "toggle",
        "default" : false,
        "is-body-class" : true,
        "is-less-var" : false
    }
    ]
}
{% endhighlight %}
