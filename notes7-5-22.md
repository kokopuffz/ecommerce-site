Users: metadata for human consumer
- username
- email 
- password 

Products: metadata for stock keeping unit
- name
- description
- url_link 
- landed cost (how much i paid for)
- price (what i sold for)
- qty_in_stock

ShoppingCarts: group of products, not mutually exclusive(or can shop for things regardless of if its in stock) that pertains to a users shopping session 
- Relationship with user
  - One to many: A user can have as many shopping carts as they want 
    - `is active?` Model level validation: Only one shopping cart can be is_active?(active denotes not purchased)

id | user_id | is_active? | details - jsonb string

  {
    products: [
      {
        product_id:
        qty:
        discount_id:
      }
    ]
  }

--------------
class ShoppingCart < ApplicationRecord 
  include Detailable
end 

module Detailable
  extend ActiveSupport::Concerns

  VALID_KEYS = [
    :products, 
    :product_id, 
    :qty,
    :discount_id
  ]

  included do 
    add custom validation
  end

  def parsed_details 
    JSON.parse(details).deep_symbolize
  end

  def is_valid?
  end
end
<!-- Warehouses: metadata for physical storage locations
- Address
- has many products *through* inventories

Inventories
- id (primary key bc it's a through model, not a joiner table)
- product_id
- warehouse_id 
- qty  -->