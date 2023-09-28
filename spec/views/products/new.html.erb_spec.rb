require 'rails_helper'

RSpec.describe "products/new", type: :view do
  let(:product_name) { Faker::Commerce.product_name }

  before do
    assign(:product, Product.new(
      product_code: "#{product_name[0..1].upcase}1",
      name: product_name,
      price: Faker::Commerce.price(range: 1.00..100.00)
    ))
    render
  end

  it "renders new product form" do
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input[name=?]", "product[product_code]"
      assert_select "input[name=?]", "product[name]"
      assert_select "input[name=?]", "product[price]"
    end
  end
end
