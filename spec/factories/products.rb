FactoryBot.define do
  factory :product do
    transient do
      product_name { Faker::Commerce.product_name }
    end

    sequence(:product_code) { |n| "#{product_name[0..1].upcase}#{n}" }
    name { product_name }
    price { Faker::Commerce.price(range: 1.00..100.00) }
  end
end
