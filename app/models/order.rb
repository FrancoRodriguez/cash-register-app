class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  def product_already_in_cart?(product_id)
    order_products.exists?(product_id:)
  end
end
