class GreenTeaOfferCalculatorService
  include ProductHelpers
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def calculate
    return discounted_total if green_tea?(product)

    product.price * quantity
  end

  private

  def discounted_total
    discounted_quantity = quantity / 2
    remaining_quantity = quantity % 2
    (discounted_quantity + remaining_quantity) * product.price
  end
end
