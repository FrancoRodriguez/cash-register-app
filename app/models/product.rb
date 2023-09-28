class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy

  validates :product_code, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
