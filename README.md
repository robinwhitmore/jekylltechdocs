# jekylltechdocs


## Developing


### Quick Start

```
# Install Jekyll and the Gem Bundler
gem install jekyll bundler

# Install gems (~5 min)
bundle install

# Start dev env. Specify one the three config files in the root folder.
jekyll serve --config _config_Designer.yml
# jekyll serve --config _config_Cloud.yml
# jekyll serve --config _config_Platform.yml

# For speedier compilation (0.5s rather than 5s) use the incremental flag.
# Note: Some edits, such as those to data files will not be caught with this flag on.
jekyll serve --config _config_Designer.yml --incremental

# Visit http://localhost:400[X]/
# Check the port number noted in your Terminal. It will be 4000, 4006, or 4008.
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
├── _site: Auto-generated. Do not edit.
├── _x_*: Auto-generated. Do not edit.
```

### Third-party Libraries

- [Jekyll](https://jekyllrb.com/) - Static site generator.
- [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) 
- [Bootstrap](http://getbootstrap.com/docs/3.3/) - We don't pull in the Bootstrap CSS. We just use the BootstrapJS for Tooltip and Popover functionality.

## Writing

### Includes

#### note.html

![Example of Notes](https://raw.githubusercontent.com/robinwhitmore/jekylltechdocs/gh-pages/images/readme/notes.png)

```
{% include note.html content="..." %}
{% include note.html type="tip" content="..." %}
{% include note.html type="warning" content="..." %}
{% include note.html type="error" content="..." %}
```

If you don't specify a note type, it will default to `type="info"`.

#### Using HTML and Variables in a Note

If you want to add HTML to the content of a Note, for example a link, or use variables to construct the message, then you'll need to use the `capture` tag to construct the message and store it in a varaible ahead of passing it to the *note*.

![Note with HTML](https://raw.githubusercontent.com/robinwhitmore/jekylltechdocs/gh-pages/images/readme/note_with_html.png)

```
{% capture my_var_name %}
Add [links](home.html) and use variables inside of the capture tag. {%if site.project=="designer" %}Hi Designer.{% endif %}
{% endcapture%}

{% include note.html content=my_var_name %}
```

Don't use quotes around the content value if you are using a variable.


#### label.html

![Example of Labels](https://raw.githubusercontent.com/robinwhitmore/jekylltechdocs/gh-pages/images/readme/labels.png)

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
