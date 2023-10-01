class CoffeeOfferCalculatorService
  include ProductHelpers
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def calculate
    return discounted_total if coffee_discount?(product, quantity)

    product.price * quantity
  end

  private

  def discounted_total
    (product.price * quantity * 2 / 3).round(2)
  end
end
