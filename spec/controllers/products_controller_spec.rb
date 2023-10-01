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
      let(:new_product_name) { Faker::Commerce.product_name }

      before do
        patch :update, params: { id: product.id, product: { name: new_product_name } }
      end

      it 'updates a product' do
        expect(product.reload.name).to eq(new_product_name)
      end

      it 'redirect to product path' do
        expect(response).to redirect_to(product_path(product))
      end
    end

    describe 'DELETE destroy' do
      before do
        delete :destroy, params: { id: product.id }
      end

      it 'destroys a product' do
        expect(Product.find_by(id: product.id)).to be_nil
      end

      it 'redirect to products path' do
        expect(response).to redirect_to(products_path)
      end
    end
  end
end
