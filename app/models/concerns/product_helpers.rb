module ProductHelpers
  def green_tea?(product)
    product.product_code == GREEN_TEA_CODE
  end

  def strawberry_discount?(product, quantity)
    product.product_code == STRAWBERRIES_CODE && quantity >= STRAWBERRIES_QUANTITY_DISCOUNT
  end

  def coffee_discount?(product, quantity)
    product.product_code == COFFEE_CODE && quantity >= COFFEE_QUANTITY_DISCOUNT
  end
end
