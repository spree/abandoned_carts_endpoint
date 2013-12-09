module Factories
  class << self

    def config(args={})
      [
        {
          'name' => 'dotcom.api_key', 'value' => api_key
        },
        {
          'name' => 'dotcom.password', 'value' => password
        },
        {
          'name' => 'dotcom.last_polling_datetime', 'value' => '2011-01-01'
        },
        {
          'name' => 'dotcom.shipping_lookup',
          'value' => [
            { 'name' => 'UPS Ground (USD)', 'value' => '03'},
            { 'name' => 'UPS Two Day (USD)', 'value' => '02'},
            { 'name' => 'UPS One Day (USD)', 'value' => '01'}
          ]
        }
      ]
    end

    def processed_config
      { 
        'abandoned_carts.api_key' => '',
        'abandoned_carts.password' => '',
        'abandoned_carts.last_polling_datetime' => '2011-01-01',
        "abandoned_carts.shipping_lookup"=> [
          {
            "UPS Ground (USD)" => "03",
            "UPS Two Day (USD)" => "02",
            "UPS One Day (USD)" => "01"
          }
        ]
      }
    end

    def original
      payload["original"]
    end

    def payload
      {
        "cart": {
          "id": 1,
          "number": "R123456789",
          "item_total": "15.99",
          "total": "6.6",
          "ship_total": "5.0",
          "state": "returned",
          "adjustment_total": "-9.390000000000001",
          "user_id": null,
          "created_at": "2013-12-06T19:29:37.000Z",
          "updated_at": "2013-12-06T21:08:13.000Z",
          "completed_at": "2013-12-05T19:29:38.000Z",
          "payment_total": "22.59",
          "shipment_state": "shipped",
          "payment_state": "credit_owed",
          "email": "spree@example.com",
          "special_instructions": null,
          "token": "2b852a72058f9dc8",
          "channel": "spree",
          "currency": "USD",
          "tax_total": "1.6",
          "bill_address": {
            "id": 2,
            "firstname": "Kaden",
            "lastname": "Steuber",
            "full_name": "Kaden Steuber",
            "address1": "322 Willow Flats",
            "address2": "Suite 516",
            "city": "Neilfurt",
            "zipcode": "16804",
            "phone": "544-044-4452 x10855",
            "company": null,
            "alternative_phone": null,
            "country_id": 49,
            "state_id": 48,
            "state_name": null,
            "country": {
              "id": 49,
              "iso_name": "UNITED STATES",
              "iso": "US",
              "iso3": "USA",
              "name": "United States",
              "numcode": 840
            },
            "state": {
              "id": 48,
              "name": "New York",
              "abbr": "NY",
              "country_id": 49
            }
          },
          "ship_address": {
            "id": 1,
            "firstname": "Nick",
            "lastname": "Harris",
            "full_name": "Nick Harris",
            "address1": "923 Schoen Pines",
            "address2": "Apt. 946",
            "city": "Birdieland",
            "zipcode": "16804",
            "phone": "865-711-4691",
            "company": null,
            "alternative_phone": null,
            "country_id": 49,
            "state_id": 48,
            "state_name": null,
            "country": {
              "id": 49,
              "iso_name": "UNITED STATES",
              "iso": "US",
              "iso3": "USA",
              "name": "United States",
              "numcode": 840
            },
            "state": {
              "id": 48,
              "name": "New York",
              "abbr": "NY",
              "country_id": 49
            }
          },
          "line_items": [
            {
              "id": 1,
              "quantity": 1,
              "price": "15.99",
              "variant_id": 1,
              "variant": {
                "id": 1,
                "name": "Ruby on Rails Tote",
                "sku": "ROR-00011",
                "price": "15.99",
                "weight": null,
                "height": null,
                "width": null,
                "depth": null,
                "is_master": true,
                "cost_price": "17.0",
                "permalink": "ruby-on-rails-tote",
                "options_text": "",
                "option_values": [

                ],
                "product_id": 1,
                "images": [
                  {
                    "id": 21,
                    "position": 1,
                    "attachment_content_type": "image/jpeg",
                    "attachment_file_name": "ror_tote.jpeg",
                    "type": "Spree::Image",
                    "attachment_updated_at": "2013-12-06T19:29:22.000Z",
                    "attachment_width": 360,
                    "attachment_height": 360,
                    "alt": null,
                    "viewable_type": "Spree::Variant",
                    "viewable_id": 1,
                    "attachment_url": "/spree/products/21/product/ror_tote.jpeg?1386358162"
                  },
                  {
                    "id": 22,
                    "position": 2,
                    "attachment_content_type": "image/jpeg",
                    "attachment_file_name": "ror_tote_back.jpeg",
                    "type": "Spree::Image",
                    "attachment_updated_at": "2013-12-06T19:29:22.000Z",
                    "attachment_width": 360,
                    "attachment_height": 360,
                    "alt": null,
                    "viewable_type": "Spree::Variant",
                    "viewable_id": 1,
                    "attachment_url": "/spree/products/22/product/ror_tote_back.jpeg?1386358162"
                  }
                ]
              }
            }
          ],
          "payments": [
            {
              "id": 1,
              "amount": "22.59",
              "state": "completed",
              "payment_method_id": 1,
              "payment_method": {
                "id": 1,
                "name": "Credit Card",
                "environment": "development"
              }
            }
          ],
          "shipments": [
            {
              "id": 1,
              "tracking": null,
              "number": "437516215",
              "cost": "5.0",
              "shipped_at": "2013-12-06T21:04:13.000Z",
              "state": "shipped",
              "order_id": "R123456789",
              "stock_location_name": "default",
              "shipping_rates": [
                {
                  "id": 1,
                  "cost": "5.0",
                  "selected": true,
                  "shipment_id": 1,
                  "shipping_method_id": 1
                },
                {
                  "id": 2,
                  "cost": "10.0",
                  "selected": false,
                  "shipment_id": 1,
                  "shipping_method_id": 2
                },
                {
                  "id": 3,
                  "cost": "15.0",
                  "selected": false,
                  "shipment_id": 1,
                  "shipping_method_id": 3
                }
              ],
              "shipping_method": {
                "name": "UPS Ground (USD)",
                "tracking_url": null
              },
              "inventory_units": [
                {
                  "id": 1,
                  "variant_id": 1,
                  "state": "returned"
                }
              ]
            }
          ],
          "adjustments": [
            {
              "id": 1,
              "amount": "0.8",
              "label": "North America 5.0%",
              "mandatory": false,
              "eligible": true,
              "originator_type": "Spree::TaxRate",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 3,
              "amount": "5.0",
              "label": "Shipping",
              "mandatory": true,
              "eligible": true,
              "originator_type": "Spree::ShippingMethod",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 5,
              "amount": "0.8",
              "label": "Tax",
              "mandatory": true,
              "eligible": true,
              "originator_type": "Spree::TaxRate",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 7,
              "amount": "0.0",
              "label": "Shipping",
              "mandatory": true,
              "eligible": true,
              "originator_type": "Spree::ShippingMethod",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 13,
              "amount": "-15.99",
              "label": "RMA Credit",
              "mandatory": null,
              "eligible": true,
              "originator_type": null,
              "adjustable_type": "Spree::Order"
            }
          ],
          "credit_cards": [
            {
              "id": 1,
              "month": "12",
              "year": "2014",
              "cc_type": "visa",
              "last_digits": "1111",
              "first_name": "Sean",
              "last_name": "Schofield",
              "gateway_customer_profile_id": "BGS-1234",
              "gateway_payment_profile_id": null
            }
          ]
        },
        "original": {
          "id": 1,
          "number": "R123456789",
          "item_total": "15.99",
          "total": "6.6",
          "ship_total": "5.0",
          "state": "returned",
          "adjustment_total": "-9.390000000000001",
          "user_id": null,
          "created_at": "2013-12-06T19:29:37.000Z",
          "updated_at": "2013-12-06T21:08:13.000Z",
          "completed_at": "2013-12-05T19:29:38.000Z",
          "payment_total": "22.59",
          "shipment_state": "shipped",
          "payment_state": "credit_owed",
          "email": "spree@example.com",
          "special_instructions": null,
          "token": "2b852a72058f9dc8",
          "channel": "spree",
          "currency": "USD",
          "tax_total": "1.6",
          "bill_address": {
            "id": 2,
            "firstname": "Kaden",
            "lastname": "Steuber",
            "full_name": "Kaden Steuber",
            "address1": "322 Willow Flats",
            "address2": "Suite 516",
            "city": "Neilfurt",
            "zipcode": "16804",
            "phone": "544-044-4452 x10855",
            "company": null,
            "alternative_phone": null,
            "country_id": 49,
            "state_id": 48,
            "state_name": null,
            "country": {
              "id": 49,
              "iso_name": "UNITED STATES",
              "iso": "US",
              "iso3": "USA",
              "name": "United States",
              "numcode": 840
            },
            "state": {
              "id": 48,
              "name": "New York",
              "abbr": "NY",
              "country_id": 49
            }
          },
          "ship_address": {
            "id": 1,
            "firstname": "Nick",
            "lastname": "Harris",
            "full_name": "Nick Harris",
            "address1": "923 Schoen Pines",
            "address2": "Apt. 946",
            "city": "Birdieland",
            "zipcode": "16804",
            "phone": "865-711-4691",
            "company": null,
            "alternative_phone": null,
            "country_id": 49,
            "state_id": 48,
            "state_name": null,
            "country": {
              "id": 49,
              "iso_name": "UNITED STATES",
              "iso": "US",
              "iso3": "USA",
              "name": "United States",
              "numcode": 840
            },
            "state": {
              "id": 48,
              "name": "New York",
              "abbr": "NY",
              "country_id": 49
            }
          },
          "line_items": [
            {
              "id": 1,
              "quantity": 1,
              "price": "15.99",
              "variant_id": 1,
              "variant": {
                "id": 1,
                "name": "Ruby on Rails Tote",
                "sku": "ROR-00011",
                "price": "15.99",
                "weight": null,
                "height": null,
                "width": null,
                "depth": null,
                "is_master": true,
                "cost_price": "17.0",
                "permalink": "ruby-on-rails-tote",
                "options_text": "",
                "option_values": [

                ],
                "product_id": 1,
                "images": [
                  {
                    "id": 21,
                    "position": 1,
                    "attachment_content_type": "image/jpeg",
                    "attachment_file_name": "ror_tote.jpeg",
                    "type": "Spree::Image",
                    "attachment_updated_at": "2013-12-06T19:29:22.000Z",
                    "attachment_width": 360,
                    "attachment_height": 360,
                    "alt": null,
                    "viewable_type": "Spree::Variant",
                    "viewable_id": 1,
                    "attachment_url": "/spree/products/21/product/ror_tote.jpeg?1386358162"
                  },
                  {
                    "id": 22,
                    "position": 2,
                    "attachment_content_type": "image/jpeg",
                    "attachment_file_name": "ror_tote_back.jpeg",
                    "type": "Spree::Image",
                    "attachment_updated_at": "2013-12-06T19:29:22.000Z",
                    "attachment_width": 360,
                    "attachment_height": 360,
                    "alt": null,
                    "viewable_type": "Spree::Variant",
                    "viewable_id": 1,
                    "attachment_url": "/spree/products/22/product/ror_tote_back.jpeg?1386358162"
                  }
                ]
              }
            }
          ],
          "payments": [
            {
              "id": 1,
              "amount": "22.59",
              "state": "completed",
              "payment_method_id": 1,
              "payment_method": {
                "id": 1,
                "name": "Credit Card",
                "environment": "development"
              }
            }
          ],
          "shipments": [
            {
              "id": 1,
              "tracking": null,
              "number": "437516215",
              "cost": "5.0",
              "shipped_at": "2013-12-06T21:04:13.000Z",
              "state": "shipped",
              "order_id": "R123456789",
              "stock_location_name": "default",
              "shipping_rates": [
                {
                  "id": 1,
                  "cost": "5.0",
                  "selected": true,
                  "shipment_id": 1,
                  "shipping_method_id": 1
                },
                {
                  "id": 2,
                  "cost": "10.0",
                  "selected": false,
                  "shipment_id": 1,
                  "shipping_method_id": 2
                },
                {
                  "id": 3,
                  "cost": "15.0",
                  "selected": false,
                  "shipment_id": 1,
                  "shipping_method_id": 3
                }
              ],
              "shipping_method": {
                "name": "UPS Ground (USD)",
                "tracking_url": null
              },
              "inventory_units": [
                {
                  "id": 1,
                  "variant_id": 1,
                  "state": "returned"
                }
              ]
            }
          ],
          "adjustments": [
            {
              "id": 1,
              "amount": "0.8",
              "label": "North America 5.0%",
              "mandatory": false,
              "eligible": true,
              "originator_type": "Spree::TaxRate",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 3,
              "amount": "5.0",
              "label": "Shipping",
              "mandatory": true,
              "eligible": true,
              "originator_type": "Spree::ShippingMethod",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 5,
              "amount": "0.8",
              "label": "Tax",
              "mandatory": true,
              "eligible": true,
              "originator_type": "Spree::TaxRate",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 7,
              "amount": "0.0",
              "label": "Shipping",
              "mandatory": true,
              "eligible": true,
              "originator_type": "Spree::ShippingMethod",
              "adjustable_type": "Spree::Order"
            },
            {
              "id": 13,
              "amount": "-15.99",
              "label": "RMA Credit",
              "mandatory": null,
              "eligible": true,
              "originator_type": null,
              "adjustable_type": "Spree::Order"
            }
          ],
          "credit_cards": [
            {
              "id": 1,
              "month": "12",
              "year": "2014",
              "cc_type": "visa",
              "last_digits": "1111",
              "first_name": "Sean",
              "last_name": "Schofield",
              "gateway_customer_profile_id": "BGS-1234",
              "gateway_payment_profile_id": null
            }
          ]
        }
      }
    end
  end
end
