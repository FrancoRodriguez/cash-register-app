require 'rails_helper'

RSpec.describe GreenTeaOfferCalculatorService do
  subject(:calculator) { described_class.new(product, quantity) }

  let(:product) { create(:product) }
  let(:quantity) { Faker::Number.between(from: 1, to: 10) }

  describe '#calculate' do
    context 'when the product is green tea' do
      before { allow(calculator).to receive(:green_tea?).with(product).and_return(true) }

      it 'calculates the discounted total' do
        expected_discounted_total = (quantity / 2 + quantity % 2) * product.price
        expect(calculator.calculate).to eq(expected_discounted_total)
      end
    end

    context 'when the product is not green tea' do
      before { allow(calculator).to receive(:green_tea?).with(product).and_return(false) }

      it 'calculates the total without discount' do
        expected_total = product.price * quantity
        expect(calculator.calculate).to eq(expected_total)
      end
    end
  end
end
