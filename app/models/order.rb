class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  before_save :set_total

  def product_already_in_cart?(product_id)
    order_products.exists?(product_id:)
  end

  def total
    order_products.collect { |order_product| order_product.total.to_d }.sum
  end

  private

  def set_total
    self[:total] = total
  end
end
