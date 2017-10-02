## `header.tpl`

The `header` partial displays the word **Search** and an input box displaying the search term.
{% include image.html file="partial_searchHeader.png" caption="Header search partial" %}


## `pagination-item.tpl`

The `pagination-item` partial displays the page navigation at the bottom of the search results page.
{% include image.html file="partial_searchPage.png" caption="Pagination search partial" %}


## `/results`

The partials in the `results` directory display search results under the header.
​
### `empty.tpl`

The `empty` partial displays when the search doesn't return any results.
{% include image.html file="partial_searchEmpty.png" caption="Empty search partial" %}

### `error.tpl`​

The `error` partial displays when an error occurs during the return of search results.

### `normal.tpl`
​
The `normal` partial displays a list of search results that are not products in a store.
{% include image.html file="partial_searchNormal.png" caption="Search results in the normal partial" %}

### `product-group.tpl` and `product.tpl`

The p`roduct-group` partial groups all product search results, while the `product` partial displays the individual product search results.
{% include image.html file="partial_searchProduct.png" caption="Products in search results" %}