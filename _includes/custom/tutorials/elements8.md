Our element doesn’t really require much JavaScript, except to initialize it and normalize styles that may be styled by the theme.

1. Create a JavaScript file named `element.js` and save it to the `PriceChart/files/js` directory.
2. Add the following initialization function and save the file:


   {%raw%}
   ~~~js
   (function() {
      var PricingTable = PlatformElement.extend({
         initialize: function() {
            // we normalize the styles on initial load.
            $(document).ready(function() {
               this.fixStyles();
            }.bind(this));

            this.fixStyles();
            },

         /**
         * Lots of styles are applied by default to editable areas of
         * the editor. To make the element looks how you want, some styles
         * need to be overwritten.
         */
         fixStyles: function() {
            this.$('.editable-text').each(function(index, value) {
               $(value).attr('style', '');
            });

            this.$('.element').each(function(index, value) {
               $(value).attr('style', '');
            });
         }
      });

      return PricingTable;
   })();
   ~~~
   {%endraw%}

We’re all done with the code. Now it’s time to zip up the element and test it out!
