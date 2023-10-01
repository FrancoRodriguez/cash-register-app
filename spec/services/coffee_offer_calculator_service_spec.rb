require 'rails_helper'

RSpec.describe CoffeeOfferCalculatorService do
  let(:coffee) do
    create(:product,
           product_code: COFFEE_CODE,
           name: 'Coffee',
           price: Faker::Commerce.price(range: 1.00..100.00))
  end
  let(:non_coffee_product) { create(:product) }

  context 'when calculating the price of coffee' do
    it 'returns the original price for less than 3 coffees' do
      quantity_more_than_three = Faker::Number.between(from: 1, to: 2)
      calculator = described_class.new(coffee, quantity_more_than_three)
      expected_calculate = quantity_more_than_three * coffee.price

      expect(calculator.calculate).to eq(expected_calculate)
    end

    it 'returns the discounted price (2/3 of original) for 3 or more coffees' do
      quantity_more_than_three = Faker::Number.between(from: 3, to: 10)
      calculator = described_class.new(coffee, quantity_more_than_three)
      expected_calculate = (coffee.price * quantity_more_than_three * 2 / 3).round(2)

      expect(calculator.calculate).to eq(expected_calculate)
    end
  end

  context 'when calculating the price of non-coffee products' do
    it 'returns the original price' do
      quantity = Faker::Number.between(from: 1, to: 10)
      calculator = described_class.new(non_coffee_product, quantity)
      expected_calculate = quantity * non_coffee_product.price

      expect(calculator.calculate).to eq(expected_calculate)
    end
  end
end
