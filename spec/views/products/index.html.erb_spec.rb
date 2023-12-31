require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before do
    assign(:products, [
      Product.create!(
        product_code: "Product Code",
        name: "Name",
        price: "9.99"
      ),
      Product.create!(
        product_code: "Product Code",
        name: "Name",
        price: "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Product Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
