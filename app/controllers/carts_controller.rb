class CartsController < ApplicationController
  def new_cart
    session[:order_id] = nil
    redirect_to root_path, notice: I18n.t("carts.new")
  end
end
