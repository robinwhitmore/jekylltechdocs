# jekylltechdocs

## Quick Start

```
# Install Jekyll and the Gem Bundler
gem install jekyll bundler

# Install gems (~5 min)
bundle install

# Start dev env. Specify one the config files in the root folder.
jekyll serve --config _config_Cloud.yml

```

## Troubleshooting

*jQuery not found error.*
Make sure jQuery is loaded ahead of bootstrap.js.

*JSON load error.*
- Remove comma at end of search.json.
- Remove malformed entry using `"` in description.
