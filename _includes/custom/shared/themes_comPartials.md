## `/category`

The partials in this directory display category hierarchies, as well as the products in those categories.
​​
### `main.tpl`

When a site is configured to use a sidebar, this partial displays categories in that sidebar, and the corresponding products to the right. Otherwise, it displays a breadcrumb of categories with corresponding products below.
{% include image.html file="partial_commerce_main.png" caption="The main commerce partial" %}

The `main.tpl` partial includes a number of other pages that use the following partials.

### `hierarchy.tpl`


The `hierarchy` partial displays the hierarchy of categories. It references itself to create a nested hierarchy.
{% include image.html file="partial_commerce_hierarchy.png" caption="The hierarchy partial" %}
​
### `product-pagination.tpl`


This partial provides the **next** and **previous** links when there are more products to display.
{% include image.html file="partial_commerce_page.png" caption="Pagination partial" %}

### `​product.tpl`

The `product` partial displays the product images, titles, inventory level alerts, and prices (sale and regular) in the category grouping.
{% include image.html file="partial_commerce_product.png" caption="Product partial" %}

### `subcategory.tpl`

The subcategory partial displays the subcategory images and titles.
{% include image.html file="partial_commerce_subcat.png" caption="Subcategory partial" %}


## `/mini-cart`

The mini cart partials display the dropdown cart for the site.
​
### `empty.tpl`

The empty partial displays the text when the cart is empty.
{% include image.html file="partial_commerce_empty.png" caption="Empty partial" %}

### `footer.tpl`

The footer partial displays the subtotal for the cart and the checkout button.
{% include image.html file="partial_commerce_footer.png" caption="Footer partial" %}

### `item.tpl`

The item partial shows the items in the cart.
{% include image.html file="partial_commerce_item.png" caption="Item partial" %}


## `/product`

The product partials display the product page where the user can view a product and add it to the cart.

### `main.tpl`​
This partial displays the product page.
{% include image.html file="partial_commerce_mainProd.png" caption="Main product partial" %}

The `main.tpl` partial displays the product information and includes the following partials:

* `images.tpl`: Displays the large image and, if available, thumbnails of additional images.
* `inventory.tpl`: Provides the text for when the inventory is low, based on the quantity of products to be added to the cart.
* `long-description.tpl`: Provides an area below the images where other elements can be added.
* `quantity.tpl`: Displays the selected quantity.
* `short-description.tpl`: Displays the short description.
* `sku.tpl`: Displays the sku number
* `title.tpl`: Displays the title

{% include image.html file="partial_commerce_mainProd2.png" caption="Product partials included in the main.tpl partial" %}

## `/product/social`

These partials display the social icons that the user can click to share the product:

* `facebook.tpl`
* `pinterest.tpl`
* `twitter.tpl`
​* `plus.tpl`

{% include image.html file="partial_commerce_social.png" caption="Social partials" %}
