Now we need to create the styles so that the price chart displays correctly. Weebly sites use LESS, which can access the element’s settings using LESS variables. But we’re not going to do a lot of styling, as we want the Price Chart to inherit most of its styles from the site’s theme.

As this isn’t a tutorial for LESS or CSS, it won’t cover every selector for the price chart, but it will point out the more interesting ones. You may want to copy over the CSS file from the downloaded zip to your css directory and study that, rather than retype everything. Be sure to note how the styles are written to work with whatever theme the user has selected.

1. Create a stylesheet named `element.css` and save it to the `PriceChart/files/css` directory.

2. We can access the element's settings using LESS variables. For example to access the border color, we can use `@borderColor`. The following code shows how to handle the using the color settings.
   {% raw %}
   ~~~css
   .price-chart {
      @border: 1px solid @borderColor;

      width: 100%;
      background-color: @backgroundColor;
      border: @border;
      border-spacing: 0;
   ~~~
   {%endraw%}
3. To access the currency, we’ll use `@currency`. We also need to handle the case where the user doesn’t enter a prefix:
   {% raw %}
   ~~~css
   /* if the user has defined a specific price, that gets applied here
    * if they haven't defined one, then the before doesn't exist, because
    * that messes up caret positioning for an empty paragraph */
      .prefix() when not (@currency = "") {
         &:not(:empty)::before {
            content: @currency;
            font-size: 50%;
            vertical-align: super;
         }
      }
   ~~~
   {%endraw%}
4. Remember that at the beginning of our HTML template, we created two classes based on the value of the location setting: `buttonLocation-top` and `buttonLocation-bottom`.

   Now we need to hide the button that hasn’t been selected to display:
   {%raw%}
   ~~~css
   .buttons() {
      .buttonLocation-Bottom {
         .buttons-top {
            display: none;
         }
      }
      &.buttonLocation-top{
         .buttons-bottom {
            display:none;
      }
   }
   ~~~
   {%endraw%}
5. Review the `element.css` file from the sample to see how the rest of the Price Chart is styled.
