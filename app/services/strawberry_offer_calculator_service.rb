class StrawberryOfferCalculatorService
  include ProductHelpers
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def calculate
    return discounted_total if strawberry_discount?(product, quantity)

    product.price * quantity
  end

  private

  def discounted_total
    quantity * STRAWBERRIES_DISCOUNTED_PRICE
  end
end
