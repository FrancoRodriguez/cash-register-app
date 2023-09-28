require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) { create(:product) }

  before do
    assign(:product, product)
    render
  end

  it "renders the edit product form" do
    assert_select "form[action=?][method=?]", product_path(product), "post"
  end

  it "renders an input field for product_code" do
    assert_select "input[name=?]", "product[product_code]"
  end

  it "renders an input field for name" do
    assert_select "input[name=?]", "product[name]"
  end

  it "renders an input field for price" do
    assert_select "input[name=?]", "product[price]"
  end
end
