class Product < ApplicationRecord
  validates :product_code, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
