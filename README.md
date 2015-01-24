**This endpoint is deprecated.**

Original README contents follows:

# Abandoned Carts Endpoint

For a detailted explanation check out the [Spree Guides - Abandoned Carts Endpoint](http://guides.spreecommerce.com/integration/abandoned_carts_integration.html).

## Save Cart (/save_cart)

* Saves the cart (number, whole payload, last_activity_at and abandoned_at fields) to MongoDB

## Match Cart (/match_cart)

* Finds a cart that matches the new order number and removes it from the database

## Poll for Abandoned Carts (/poll)

* Polls for carts that have been abandoned and generates cart:abandoned messages
* Uses `abandonment_period_hours` parameter to determine which carts should be considered as abandoned.
