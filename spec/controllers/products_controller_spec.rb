require 'bundler/setup'
require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'CRUD' do
    let(:product_params) { { product_code: 'GR1', name: 'Green Tea', price: 3.11 } }
    let(:product) { Product.create(product_params) }

    describe 'POST create' do
      it 'creates a new product' do
        post :create, params: { product: product_params }

        expect(response).to redirect_to(product_path(Product.last))
      end
    end

    describe 'PATCH update' do
      it 'updates a product' do
        new_product_name = 'Black Tea'

        patch :update, params: { id: product.id, product: { name: new_product_name } }

        expect(response).to redirect_to(product_path(product))
        expect(product.reload.name).to eq(new_product_name)
      end
    end

    describe 'DELETE destroy' do
      it 'destroys a product' do
        delete :destroy, params: { id: product.id }

        expect(response).to redirect_to(products_path)
        expect(Product.find_by(id: product.id)).to be_nil
      end
    end
  end
end
