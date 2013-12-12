module Factories
  class << self

    def config(args={})
      [
        { 'name' => 'abandoned_carts.abandonment_period_hours', 'value' => 1 }
      ]
    end

    def processed_config
      { 'abandoned_carts.abandonment_period_hours' => 1 }
    end

    def order_new_payload(number = nil)
      {
        "order" => {
          "number" => (number || "R257883284")
        }
      }
    end

    def cart_new_payload
      {
        "cart" => {
          "id" => 5,
          "number" => "R257883284",
          "item_total" => "19.99",
          "total" => "19.99",
          "ship_total" => 0,
          "state" => "cart",
          "adjustment_total" => "0.0",
          "user_id" => nil,
          "created_at" => "2013-12-10T19:03:46.000Z",
          "updated_at" => "2013-12-10T19:03:46.000Z",
          "completed_at" => nil,
          "payment_total" => "0.0",
          "shipment_state" => nil,
          "payment_state" => nil,
          "email" => nil,
          "special_instructions" => nil,
          "token" => "4b9d4c16033c6d6c",
          "channel" => "spree",
          "currency" => "USD",
          "tax_total" => 0,
          "bill_address" => nil,
          "ship_address" => nil,
          "line_items" => [
            {
              "id" => 5,
              "quantity" => 1,
              "price" => "19.99",
              "variant_id" => 5,
              "variant" => {
                "id" => 5,
                "name" => "Ruby on Rails Ringer T-Shirt",
                "sku" => "ROR-00015",
                "price" => "19.99",
                "weight" => nil,
                "height" => nil,
                "width" => nil,
                "depth" => nil,
                "is_master" => true,
                "cost_price" => "17.0",
                "permalink" => "ruby-on-rails-ringer-t-shirt",
                "options_text" => "",
                "option_values" => [

                ],
                "product_id" => 5,
                "images" => [
                  {
                    "id" => 29,
                    "position" => 1,
                    "attachment_content_type" => "image/jpeg",
                    "attachment_file_name" => "ror_ringer.jpeg",
                    "type" => "Spree::Image",
                    "attachment_updated_at" => "2013-12-06T19:29:27.000Z",
                    "attachment_width" => 360,
                    "attachment_height" => 360,
                    "alt" => nil,
                    "viewable_type" => "Spree::Variant",
                    "viewable_id" => 5,
                    "attachment_url" => "/spree/products/29/product/ror_ringer.jpeg?1386358167"
                  },
                  {
                    "id" => 30,
                    "position" => 2,
                    "attachment_content_type" => "image/jpeg",
                    "attachment_file_name" => "ror_ringer_back.jpeg",
                    "type" => "Spree::Image",
                    "attachment_updated_at" => "2013-12-06T19:29:27.000Z",
                    "attachment_width" => 360,
                    "attachment_height" => 360,
                    "alt" => nil,
                    "viewable_type" => "Spree::Variant",
                    "viewable_id" => 5,
                    "attachment_url" => "/spree/products/30/product/ror_ringer_back.jpeg?1386358167"
                  }
                ]
              }
            }
          ],
          "payments" => [

          ],
          "shipments" => [

          ],
          "adjustments" => [

          ],
          "credit_cards" => [

          ]
        },
        "original" => {
          "id" => 5,
          "number" => "R257883284",
          "item_total" => "19.99",
          "total" => "19.99",
          "ship_total" => 0,
          "state" => "cart",
          "adjustment_total" => "0.0",
          "user_id" => nil,
          "created_at" => "2013-12-10T19:03:46.000Z",
          "updated_at" => "2013-12-10T19:03:46.000Z",
          "completed_at" => nil,
          "payment_total" => "0.0",
          "shipment_state" => nil,
          "payment_state" => nil,
          "email" => nil,
          "special_instructions" => nil,
          "token" => "4b9d4c16033c6d6c",
          "channel" => "spree",
          "currency" => "USD",
          "tax_total" => 0,
          "bill_address" => nil,
          "ship_address" => nil,
          "line_items" => [
            {
              "id" => 5,
              "quantity" => 1,
              "price" => "19.99",
              "variant_id" => 5,
              "variant" => {
                "id" => 5,
                "name" => "Ruby on Rails Ringer T-Shirt",
                "sku" => "ROR-00015",
                "price" => "19.99",
                "weight" => nil,
                "height" => nil,
                "width" => nil,
                "depth" => nil,
                "is_master" => true,
                "cost_price" => "17.0",
                "permalink" => "ruby-on-rails-ringer-t-shirt",
                "options_text" => "",
                "option_values" => [

                ],
                "product_id" => 5,
                "images" => [
                  {
                    "id" => 29,
                    "position" => 1,
                    "attachment_content_type" => "image/jpeg",
                    "attachment_file_name" => "ror_ringer.jpeg",
                    "type" => "Spree::Image",
                    "attachment_updated_at" => "2013-12-06T19:29:27.000Z",
                    "attachment_width" => 360,
                    "attachment_height" => 360,
                    "alt" => nil,
                    "viewable_type" => "Spree::Variant",
                    "viewable_id" => 5,
                    "attachment_url" => "/spree/products/29/product/ror_ringer.jpeg?1386358167"
                  },
                  {
                    "id" => 30,
                    "position" => 2,
                    "attachment_content_type" => "image/jpeg",
                    "attachment_file_name" => "ror_ringer_back.jpeg",
                    "type" => "Spree::Image",
                    "attachment_updated_at" => "2013-12-06T19:29:27.000Z",
                    "attachment_width" => 360,
                    "attachment_height" => 360,
                    "alt" => nil,
                    "viewable_type" => "Spree::Variant",
                    "viewable_id" => 5,
                    "attachment_url" => "/spree/products/30/product/ror_ringer_back.jpeg?1386358167"
                  }
                ]
              }
            }
          ],
          "payments" => [

          ],
          "shipments" => [

          ],
          "adjustments" => [

          ],
          "credit_cards" => [

          ]
        }
      }
    end
  end
end
