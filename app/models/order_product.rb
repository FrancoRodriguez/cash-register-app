class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_total

  def total
    product.price * quantity
  end

  private

  def set_total
    self[:total] = total
  end
end
