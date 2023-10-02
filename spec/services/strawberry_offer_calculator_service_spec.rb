require 'rails_helper'

RSpec.describe StrawberryOfferCalculatorService do
  let(:strawberry) do
    create(:product,
           product_code: STRAWBERRIES_CODE,
           product_name: 'Strawberries',
           price: Faker::Commerce.price(range: 1.00..100.00))
  end

  context 'when quantity is less than 3' do
    it 'calculates the total without a discount' do
      quantity_more_than_three = Faker::Number.between(from: 1, to: 2)
      calculator = described_class.new(strawberry, quantity_more_than_three)
      expected_calculate = quantity_more_than_three * strawberry.price

      expect(calculator.calculate).to eq(expected_calculate)
    end
  end

  context 'when quantity is 3 or more' do
    it 'calculates the total with the discount' do
      quantity_more_than_three = Faker::Number.between(from: 3, to: 10)
      calculator = described_class.new(strawberry, quantity_more_than_three)
      expected_calculate = quantity_more_than_three * STRAWBERRIES_DISCOUNTED_PRICE

      expect(calculator.calculate).to eq(expected_calculate)
    end
  end
end
