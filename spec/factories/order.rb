FactoryBot.define do
  factory :order do
    total { Faker::Commerce.price(range: 1.00..100.00) }
  end
end
