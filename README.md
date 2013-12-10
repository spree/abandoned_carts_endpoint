# Abandoned Carts Endpoint

For a detailted explanation check out the [Spree Guides - Abandoned Carts Endpoint](http://guides.spreecommerce.com/integration/abandoned_carts_integration.html).

## Save Cart

* Saves cart details to the database

## Remove Cart

* Matches up the cart with the order number and removes the card from the database

## Flush/Abandon Carts

* Checks the database to see which carts are considered to be abandoned and generates cart:abandoned messages