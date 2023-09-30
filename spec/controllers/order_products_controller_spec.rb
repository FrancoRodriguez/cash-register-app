require 'rails_helper'

RSpec.describe OrderProductsController, type: :controller do
  let(:product) { create(:product) }
  let(:quantity) { Faker::Number.between(from: 1, to: 10) }

  describe 'POST #create' do
    it 'creates a new order product' do
      expect do
        post :create, params: { order_product: { product_id: product.id, quantity: } }
      end.to change(OrderProduct, :count).by(1)
    end

    it 'assigns the newly created order product to @order_product' do
      post :create, params: { order_product: { product_id: product.id, quantity: } }
      expect(assigns(:order_product)).to be_a(OrderProduct)
    end

    it 'sets the session order_id to the new order id' do
      post :create, params: { order_product: { product_id: product.id, quantity: } }
      expect(session[:order_id]).to eq(assigns(:order).id)
    end
  end

  describe 'PATCH #update' do
    let(:order) { create(:order) }
    let(:order_product) { create(:order_product, product:, order:) }

    before do
      session[:order_id] = order.id
      patch :update, params: { id: order_product.id, order_product: { quantity: } }
    end

    it 'updates the order product quantity' do
      expect(order_product.reload.quantity).to eq(quantity)
    end

    it 'redirects to root_path after updating' do
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash notice after updating' do
      expect(flash[:notice]).to eq(I18n.t('order_products.product_updated'))
    end
  end

  describe 'DELETE #destroy' do
    let(:order) { create(:order) }
    let(:order_product) { create(:order_product, product:, order:) }

    before do
      session[:order_id] = order.id
    end

    it 'destroys the order product' do
      expect do
        delete :destroy, params: { id: order_product.id }
      end.to change(OrderProduct, :count).by(0)
    end

    it 'redirects to root_path' do
      delete :destroy, params: { id: order_product.id }
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash notice' do
      delete :destroy, params: { id: order_product.id }
      expect(flash[:notice]).to eq(I18n.t('order_products.product_deleted'))
    end
  end
end
