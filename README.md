# jekylltechdocs


## Developing

### Quick Start

```
# Install Jekyll and the Gem Bundler
gem install jekyll bundler

# Install gems (~5 min)
bundle install

# Start dev env. Specify one the config files in the root folder.
jekyll serve --config _config_Designer.yml --incremental

# Visit http://localhost:4008/
```

### Directory Structure

A list of commonly modified files in the repo.

```
.
├── search.json - Generates JSON that powers search. Builds index from pages.
├── css
|   └── orbit.css - Generated from Orbit. Classes that map to Orbit components. ex. Nav, Card
|   └── orbit-external.css - Generated from Orbit. Styles some HTML elements. ex. h1, h2, h3, p
|   └── theme-weebly.scss - Styles for site layout and filling in Orbit's gaps. Also includes Orbit overrides. 
├── js
|   └── customscripts.js - All the JS we write lives in here.
├── _x_*: Generated content.
```

### Third-party Libraries

- [Jekyll](https://jekyllrb.com/) - Static site generator.
- [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) 
- [Bootstrap](http://getbootstrap.com/docs/3.3/) - We don't pull in the Bootstrap CSS. We just use the BootstrapJS for Tooltip and Popover functionality.

## Writing

### Includes

#### note.html

```
{% include note.html content="..." %}
{% include note.html type="tip" content="..." %}
{% include note.html type="warning" content="..." %}
{% include note.html type="error" content="..." %}
```

If you don't specify a note type, it will default to `type="info"`.

#### label.html

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

#### image.html

```
{% include image.html file="cl_apps.png" caption="App Detail page in the Cloud Admin" alt="Interface showing form to change details of an app" %}
{% include image.html file="weebly.png" url="http://weebly.com" caption="Weebly.com" alt="Weebly logo" %}
```
