FactoryBot.define do
  factory :order_product do
    quantity { Faker::Number.between(from: 1, to: 10) }
    total { Faker::Commerce.price(range: 1.00..100.00) }
    association :order
    association :product
  end
end
