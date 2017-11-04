## store.info.update

Occurs when that appears on invoices for the store is updated.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
    <tr>
        <td><strong>Field</strong></td>
        <td><strong>Type</strong></td>
        <td><strong>Definition</strong></td>
    </tr>
    <tr>
        <td><code>user_id</code></td>
        <td>string</td>
        <td>​User associated with the site whose store was updated.</td>
    </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
</table>

## store.category.create

Occurs when a category is created for a store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>category_id</code></td>
    <td>string</td>
    <td>​Category that was created.</td>
  </tr>
</table>

## store.category.delete

Occurs when a category is deleted from a store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>category_id</code></td>
    <td>string</td>
    <td>​Category that was deleted.</td>
  </tr>
</table>

## store.category.update

Occurs when a category is updated.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>category_id</code></td>
    <td>string</td>
    <td>​Category that was updated.</td>
  </tr>
</table>


## store.product.create

Occurs when a product is created in the store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>product_id</code></td>
    <td>string</td>
    <td>Product that was created.</td>
  </tr>
</table>

## store.product.update

Occurs when a product is updated in the store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>product_id</code></td>
    <td>string</td>
    <td>Product that was updated.</td>
  </tr>
</table>

## store.product.delete

Occurs when a product is deleted from the store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>product_id</code></td>
    <td>string</td>
    <td>Product that was deleted.</td>
  </tr>
</table>

## store.cart.create

Occurs when a customer adds the first product to a cart in the store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>cart_id</code></td>
    <td>string</td>
    <td>Cart that was created.</td>
  </tr>
</table>

## store.cart.update

Occurs when a customer adds the additional products to a cart.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>cart_id</code></td>
    <td>string</td>
    <td>Cart that was updated.</td>
  </tr>
</table>

## store.order.create

Occurs when a customer's cart is converted to an order.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order that was created.</td>
  </tr>
</table>

## store.order.update

Occurs when a customer's order is updated.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order that was updated.</td>
  </tr>
</table>

## store.order.pay

Occurs when a customer makes a payment for an order.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order associated with the payment.</td>
  </tr>
  <tr>
    <td><code>order_billing_id</code></td>
    <td>string</td>
    <td>The unique <code>billing_id</code> (within the order) for the payment (Weebly defaults to only one).</td>
  </tr>
  <tr>
    <td><code>order_billing_transaction_id</code></td>
    <td>string</td>
    <td>The unique <code>billing_transaction_id</code> (within the order) for the payment.</td>
  </tr>
</table>

## store.order.refund

Occurs when a customer receives a refund for an order.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order associated with the refund.</td>
  </tr>
  <tr>
    <td><code>order_billing_id</code></td>
    <td>string</td>
    <td>The unique <code>billing_id</code> (within the order) for the refund (Weebly defaults to only one).</td>
  </tr>
  <tr>
    <td><code>order_billing_transaction_id</code></td>
    <td>string</td>
    <td>The unique <code>billing_transaction_id</code> (within the order) for the refund.</td>
  </tr>
</table>

## store.order.ship

Occurs when an order is shipped.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order that was shipped.</td>
  </tr>
  <tr>
    <td><code>order_shipment_id</code></td>
    <td>string</td>
    <td>The unique <code>shipment_id</code> (within the order) for this shipment (orders can have more than one).</td>
  </tr>
  <tr>
    <td><code>order_shipment_transaction_id</code></td>
    <td>string</td>
    <td>The unique <code>shipment_transaction_id</code> for the shipment.</td>
  </tr>
</table>

## store.order.return

Occurs when an order is returned.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order that was returned.</td>
  </tr>
  <tr>
    <td><code>order_shipment_id</code></td>
    <td>string</td>
    <td>The unique <code>shipment_id</code> for this shipment return (orders can have more than one).</td>
  </tr>
  <tr>
    <td><code>order_shipment_transaction_id</code></td>
    <td>string</td>
    <td>The unique <code>shipment_transaction_id</code> for the return.</td>
  </tr>
</table>

## store.order.cancel

Occurs when an order is cancelled.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order that was cancelled.</td>
  </tr>
</table>

## store.coupon.create

Occurs when a coupon is created for a store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>coupon_id</code></td>
    <td>string</td>
    <td>Coupon that was created.</td>
  </tr>
</table>

## store.coupon.delete

Occurs when a coupon is deleted.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>coupon_id</code></td>
    <td>string</td>
    <td>Coupon that was deleted.</td>
  </tr>
</table>

## store.coupon.update

Occurs when a coupon is created for a store.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>coupon_id</code></td>
    <td>string</td>
    <td>Coupon that was updated</td>
  </tr>
</table>

## store.coupon.use

Occurs when a coupon is used in an order.


The following table shows the fields that are returned as the `data` object of the webhook response.

<table>
  <tr>
    <td><strong>Field</strong></td>
    <td><strong>Type</strong></td>
    <td><strong>Definition</strong></td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>string</td>
    <td>​User associated with the site that contains the store.</td>
  </tr>
  <tr>
    <td><code>site_id</code></td>
    <td>string</td>
    <td>​Site that contains the store.</td>
  </tr>
  <tr>
    <td><code>coupon_id</code></td>
    <td>string</td>
    <td>Coupon that was used.</td>
  </tr>
  <tr>
    <td><code>order_id</code></td>
    <td>string</td>
    <td>Order that the coupon that was used on.</td>
  </tr>
</table>
