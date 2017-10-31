# jekylltechdocs

## Quick Start

```
# Install Jekyll and the Gem Bundler
gem install jekyll bundler

# Install gems (~5 min)
bundle install

# Start dev env. Specify one the config files in the root folder.
jekyll serve --config _config_Designer.yml --incremental

# Visit http://localhost:4008/

```

## Troubleshooting

*JSON load error breaking Search*
* Remove the trailing comma at the end of `x_designer_output/search.json`. (Or whichever config you are loading)
* Search for “The element-specific information lives within the objects”. Remove the extra quotes around `
"elements"`.


## Includes

### note.html

```
{% include note.html content="..." %}
{% include note.html type="tip" content="..." %}
{% include note.html type="warning" content="..." %}
{% include note.html type="error" content="..." %}
```

If you don't specify a note type, it will default to `type="info"`.

### label.html

```
# Using any of the following content values will automatically color the label.
{% include label.html content="get" %}
{% include label.html content="put" %}
{% include label.html content="post" %}
{% include label.html content="patch" %}
{% include label.html content="delete" %}

# But you are free to pass any content in to the label. It will use default styling.
{% include label.html content="Hello There" %}

```

### image.html

```
{% include image.html file="cl_apps.png" caption="App Detail page in the Cloud Admin" alt="Interface showing form to change details of an app" %}
{% include image.html file="weebly.png" url="http://weebly.com" caption="Weebly.com" alt="Weebly logo" %}
```


## External Resources
- [Orbit](https://github.intern.weebly.net/weebly/orbit) - Orbit is being imported with the css file `css/orbit.css`. Do not make changes directly to this file.
- [Liquid Template Docs](https://shopify.github.io/liquid/)
