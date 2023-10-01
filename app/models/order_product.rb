class OrderProduct < ApplicationRecord
  include ProductHelpers
  belongs_to :order
  belongs_to :product

  before_save :set_total

  def total
    return GreenTeaOfferCalculatorService.new(product, quantity).calculate if green_tea?(product)

    product.price * quantity
  end

  private

  def set_total
    self[:total] = total
  end
end
