require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'POST #new_cart' do
    before do
      post :new_cart
    end

    it 'resets the order_id session variable' do
      expect(session[:order_id]).to be_nil
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash notice message' do
      expect(flash[:notice]).to eq(I18n.t('carts.new'))
    end
  end
end
