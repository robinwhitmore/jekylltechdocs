The manifest is where you define your settings (so that you can later access them from your code) and provide information as to how they should display in the Settings dialog.
Remember, we want to create the following configurable settings:
* The number of plans (represented by the number of columns)
* The number of features per plan (represented by rows below the price)
* Where to place the button: by itself in the bottom row, or in the middle row with the price
* Justification of the element in the parent column on the page (left, right, or center)
* The currency symbol to use
* Colors to use in background and borders of the chart

We’ll configure these settings in the manifest.

1. In the manifest, let’s start by saying we want the settings modal to automatically popup when the element is dragged onto the page.

   Enter the following code on the line below the version property nested within the `elements` array object:

   ~~~json
   "settings": {
      "config": {
         "autopop": true
      },
   ~~~

   {% include note.html type="tip" content="Remember that true and false don't need quotes in JSON!" %}
2. All settings must belong to a group, and that group is used to create a section in the Settings dialog. The first group we’ll create will be for the settings that determine how many price plans and features display, as well as alignment and button location. We want to title this section “Settings,” so we’ll enter the following:
   ~~~ json
   "properties": [{
      "name": "settings",
      "label": "Settings",
      "type": "group",
   ~~~
3. Now let’s create the settings that will display in the Settings group as child properties to the that group: the number of plans and number of features, location of the button, and the alignment of the chart. Let's add a tooltip to both the `plans` and `features` properties.
   Add the following code:
   ~~~ json
      "properties": [{
         "name": "plans",
         "label": "Plans",
         "type": "int",
         "default": 3,
         "step": 1,
         "min": 1,
         "tooltip": "Select the number of plans to display"
      },
      {
         "name": "features",
         "label": "Features",
         "type": "int",
         "default": 3,
         "step": 1,
         "min": 1
         "tooltip": "Select the number of features for each plan"
      },
      {
         "name": "location",
         "label": "Sign Up Button",
         "type": "select",
         "values" : [
            "Top,"
            "Bottom"
         ],
         "default": "Top"
      },
      {
         "name": "alignment",
         "label": "Align",
         "type": "align",
         "default": "center"
      }
      ]
   },
   ~~~
4. We need to create another group for the currency symbol and the colors used in the chart. We’ll call this group "Advanced."

   Add the following:
   ~~~json
   {
      "name": "advanced",
      "label": "Advanced",
      "type": "group",
   ~~~
5. Now we’ll add the settings to the Advanced group. We want the user to be able to select the currency symbol and the colors used in the chart.

   ​Add the following:
   ~~~json
   "properties": [{
         "name": "currency",
         "label": "Currency",
         "type": "select",
         "values": [
            {
               "name": "USD ($)",
               "value": "'$'"
            },
            {
               "name": "EUR (€)",
               "value": "'€'"
            },
            {
               "name": "GBP (£)",
               "value": "'£'"
            }
         ],
         "default":"'$'"
      },
      {
         "name": "titleColor",
         "label": "Title Background",
         "type": "color",
         "default": "#F8F8F8"
      },
      {
         "name": "backgroundColor",
         "label": "Content Background",
         "type": "color",
         "default": "#FFFFFF"
      },
      {
         "name": "numberColor",
         "label": "Number",
         "type": "color",
         "default": "#222222"
      },
      {
         "name": "borderColor",
         "label": "Border Color",
         "type": "color",
         "default": "#C9CDCF"
      }
    ]
   }]
   ~~~
6. That’s all that we need to add for our settings, so let’s close up all the brackets by adding the following:​
   ~~~json
         }
      }]
   }
   ~~~

​The settings are now complete and we can move on to the HTML template, where we’ll access those settings.

​Here's the complete manifest:
~~~json
{
   "manifest": "1",
   "version": "1.1.0",
   "elements": [
   {
      "name": "Price Chart",
      "path": "files",
      "version": "1.1.0",
      "settings": {
         "config": {
            "autopop": false
         },
      "properties": [
      {
         "name": "settings",
         "label": "Settings",
         "type": "group",
         "properties": [
         {
            "name": "plans",
            "label": "Plans",
            "type": "int",
            "default": 3,
            "step": 1,
            "min": 1,
            "tooltip": "Select the number of plans to display."
         },
         {
            "name": "features",
            "label": "Features",
            "type": "int",
            "default": 3,
            "step": 1,
            "min": 1,
            "tooltip": "Select the number of features for each plan."
         },
         {
            "name": "location",
            "label": "Sign Up Button",
            "type": "select",
            "values": [
               "Top",
               "Bottom"
            ],
            "default": "Top"
         },
         {
            "name": "alignment",
            "label": "Align",
            "type": "align",
            "default": "center"
         }
         ]
      },
      {
         "name": "advanced",
         "label": "Advanced",
         "type": "group",
         "properties": [
         {
            "name": "currency",
            "label": "Currency",
            "type": "select",
            "values": [
            {
               "name": "USD ($)",
               "value": "'$'"
            },
            {
               "name": "EUR (€)",
               "value": "'€'"
            },
            {
               "name": "GBP (£)",
               "value": "'£'"
            }
            ],
            "default": "'$'"
         },
         {
            "name": "titleColor",
            "label": "Title Background",
            "type": "color",
            "default": "#F8F8F8"
         },
         {
            "name": "backgroundColor",
            "label": "Content Background",
            "type": "color",
            "default": "#FFFFFF"
         },
         {
            "name": "numberColor",
            "label": "Number",
            "type": "color",
            "default": "#222222"
         },
         {
            "name": "borderColor",
            "label": "Border Color",
            "type": "color",
            "default": "#C9CDCF"
         }
         ]
        }
      ]
     }
   }
  ]
}
~~~
