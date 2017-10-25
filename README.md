# jekylltechdocs

## Quick Start

```
# Install Jekyll and the Gem Bundler
gem install jekyll bundler

# Install gems (~5 min)
bundle install

# Start dev env. Specify one the config files in the root folder.
jekyll serve --config _config_Designer.yml

# Visit http://localhost:4008/

```

## Troubleshooting

*jQuery not found error.*
Make sure jQuery is loaded ahead of bootstrap.js.

*JSON load error.*
* Remove the trailing comma at the end of `x_designer_output/search.json`
* Search for “The element-specific information lives within the objects”. Remove the extra quotes around `
"elements"`.


## Documentations

### Includes

### note.html

```
{% include note.html content="..." %}
{% include note.html type="tip" content="..." %}
```

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

- [Liquid Template Docs](https://shopify.github.io/liquid/)
