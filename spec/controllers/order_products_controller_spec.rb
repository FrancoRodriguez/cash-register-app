require 'rails_helper'

RSpec.describe OrderProductsController, type: :controller do
  let(:product) { create(:product) }

  describe 'POST #create' do
    it 'creates a new order product' do
      expect do
        post :create, params: { order_product: { product_id: product.id, quantity: 2 } }
      end.to change(OrderProduct, :count).by(1)
    end

    it 'assigns the newly created order product to @order_product' do
      post :create, params: { order_product: { product_id: product.id, quantity: 2 } }
      expect(assigns(:order_product)).to be_a(OrderProduct)
    end

    it 'sets the session order_id to the new order id' do
      post :create, params: { order_product: { product_id: product.id, quantity: 2 } }
      expect(session[:order_id]).to eq(assigns(:order).id)
    end
  end

  describe 'PATCH #update' do
    let(:order) { create(:order) }
    let(:order_product) { create(:order_product, product: product, order: order)}

    before do
      session[:order_id] = order.id
    end

    it 'updates the order product' do
      quantity = Faker::Number.between(from: 1, to: 10)
      patch :update, params: { id: order_product.id, order_product: { quantity: } }

      expect(order_product.reload.quantity).to eq(quantity)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq(I18n.t('order_products.product_updated'))
    end
  end
end
