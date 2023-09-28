require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before do
    assign(:product, Product.create!(
      product_code: "Product Code",
      name: "Name",
      price: "9.99"
    ))
    render
  end

  it "renders the product's product_code" do
    expect(rendered).to match(/Product Code/)
  end

  it "renders the product's name" do
    expect(rendered).to match(/Name/)
  end

  it "renders the product's price" do
    expect(rendered).to match(/9.99/)
  end
end
