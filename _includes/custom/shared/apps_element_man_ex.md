{% highlight json %}
{
    "manifest": "1",
    "version": "1.1.0",
    "elements": [
    {
        "name": "Price Chart",
        "path": "files",
        "version": "1.1.0",
        "settings":
        {
            "config":
            {
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
        },
        "tutorial":
        {
            "introduction": "The price chart is a simple way to visually compare different plans with their features and prices.",
            "type": "topics",
            "content": [
            {
                "label": "Setup instructions",
                "introduction": "Follow these simple steps to help you get started!",
                "type": "steps",
                "content": [
                    "Choose the number of plans you would like. Each plan will add a new column
                        to the chart.",
                    "Choose the number of features for each plan. Each feature will add a row
                        to the chart.",
                    "Modify the currency setting to ensure the price of each plan is in the
                        correct currency.",
                    "Fill out each plan's name, price, and list of features.",
                    "Choose where to put your sign up button. It can be place at the end of the
                        features list or at the top with the plan's price.",
                    ]
                },
                {
                    "label": "Build an online store",
                    "introduction": "View an in-depth webinar about building an online store
                        with Weebly.",
                    "type": "video",
                    "content": "6clKBa8x1qk"
                }
            ],
            "autopop": true
        }
    }
    ]
}
{% endhighlight %}