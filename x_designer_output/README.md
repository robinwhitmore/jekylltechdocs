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
- Remove comma at end of search.json.
- Remove malformed entry using `"` in description.


## Documentations

### Includes

### note.html

```
{% include note.html content="..." %}
{% include note.html type="tip" content="..." %}
```

### image.html

```
{% include image.html file="cl_apps.png" caption="App Detail page in the Cloud Admin" alt="Interface showing form to change details of an app" %}
{% include image.html file="weebly.png" url="http://weebly.com" caption="Weebly.com" alt="Weebly logo" %}
```


## External Resources

- [Liquid Template Docs](https://shopify.github.io/liquid/)
