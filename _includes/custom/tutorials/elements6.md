The template provides the HTML to display the element in both the editor and on a published page (if needed, you can create a separate HTML template for the editor and the published site. You can do that for the CSS and JavaScript as well). Templates use Mustache tags to access the settings.

In our template, we need to create a table that creates the right number of columns for the plans (using the `columns` setting) and the right number of metric rows (using the `rows` setting). We also need to add the button and the rows for heading and the price.

1. Create an HTML page, name it `element.tpl` and save it to the `PriceChart/files/html` directory.
2. Let's create a div for the whole element:
   {% raw %}
   ~~~html
   <div class="price-chart-wrapper">
   </div>
   ~~~
   {% endraw %}
3. Next, let's create a table to hold the chart, and set the theme color and button location based on the value of those settings. You access settings using mustache tags, like this: {% raw %}`{{setting}}`{% endraw %}.
   Add the following code:
   {% raw %}
   ~~~html
   <table class="price-chart {{theme}} buttonLocation-{{location}}">
   </table>
   ~~~
   {% endraw %}
   ​​In a future step, we’ll provide CSS for the button location classes with styles for the possible alignment values. For example, we’ll style a class named `buttons-bottom`.
4. ​Now let’s add a table row for the name. First, we need to determine the number of columns to display. To do that we’ll access the plans setting to find that number and then render a column that many number of times.

   When a setting’s value is an integer, you can use {% raw %}`{{#settings_each}}`{% endraw %} to iterate over all instances and {% raw %}`{{settings_index}}`{% endraw %} to access each individual instance. So we'll use {% raw %}`{{#plans_each}}`{% endraw %} to render the right number of columns, and the we'll use {% raw %}`{{plans_index}}`{% endraw %} to stamp out a name for each column. The name will be used for the text field.

   We’ll use the text tag to create a text field with a default value. This is the syntax for the text field:

   {% raw %}`{*field_name*:text default="some default text to display"}`.{% endraw %}
   ​

   We’ll use the index of each plan column to give each text field a unique name and default text. In other words, the name in the first column will be `Name #0.`
   {% raw %}
   ~~~html
   <tr class="name">
      {{#plans_each}}
      <td class="cell">{name_{{plans_index}}:text default="Name #{{plans_index}}"}</td>
      {{/plans_each}}
   </tr>
   ~~~
   {% endraw %}
5. ​Now let’s create a row for the price, repeating the loop over the `plans` setting. We’ll set `10` as the default value. The pricing prefix will be handled by CSS.
   {% raw %}
   ~~~html
   <tr class="price">
      {{#plans_each}}
         <td class="cell">{price_{{plans_index}}:text default="10"}</td>
      {{/plans_each}}
   </tr>
   ~~~
   {% endraw %}
6. Go ahead and do the same thing for the rate row, using `per unit` as the default text.
   {% raw %}
   ~~~html
   <tr class="rate">
      {{#plans_each}}
         <td class="cell">{rate_{{plans_index}}:text default="per unit"}</td>
      {{/plans_each}}
   </tr>
   ~~~
   {% endraw %}
7. We need to add code for the button when the corresponding setting is set to top (we’ll have CSS determine whether to display this button or one at the bottom).

   Let’s have it display right under the rate. You create a button using the {% raw %}`{name:button}`{% endraw %} tag.
   {% raw %}
   ~~~html
   <tr class="buttons-top">
      {{#plans_each}}
         <td class="cell">{buttonText_top_{{plans_index}}:button align="center"}</td>
      {{/plans_each}}
   </tr>
   ~~~
   {% endraw %}
8. Like the `plans` setting (which determines the number of columns), we need to loop over the `features` setting, to return the right number of feature rows. Let’s add the loop which will render the correct number of rows based on the value of the features setting.
   {% raw %}
   ~~~html
   {{#features_each}}
   <tr class="metric">
      {{#plans_each}}
         <td class="cell">{metric_{{plans_index}}_{{features_index}}:text default="Metric #{{features_index}}"}</td>
      {{/plans_each}}
   </tr>
   {{/features_each}}
   ~~~
   {% endraw %}
9. Now let’s add the code for when the button should be on the bottom.
   {% raw %}
   ~~~html
   <tr class="buttons-bottom">
      {{#plans_each}}
         <td class="cell">{buttonText_bottom_{{plans_index}}:button align="center"}</td>
      {{/plans_each}}
   </tr>
   ~~~
{% endraw %}

​You can see the complete template code {% if site.project=="designer" %}[here](ds_apps_element_temp_ex.html){%elsif site.project=="cloud" %}[here](cl_apps_element_temp_ex.html){%elsif site.project=="platform" %}[here](pf_apps_element_temp_ex.html){%endif%}.

​We now have the template for our Price Chart! Let’s create the styles next.





