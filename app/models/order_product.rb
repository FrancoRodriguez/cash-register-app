class OrderProduct < ApplicationRecord
  include ProductHelpers
  belongs_to :order
  belongs_to :product

  before_save :set_total

  def total
    return calculate_green_tea_offer if green_tea?(product)
    return calculate_strawberry_offer if strawberry_discount?(product, quantity)

    product.price * quantity
  end

  private

  def calculate_green_tea_offer
    GreenTeaOfferCalculatorService.new(product, quantity).calculate
  end

  def calculate_strawberry_offer
    StrawberryOfferCalculatorService.new(product, quantity).calculate
  end

  def set_total
    self[:total] = total
  end
end
