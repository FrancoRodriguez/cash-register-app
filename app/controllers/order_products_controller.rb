class OrderProductsController < ApplicationController
  before_action :set_order

  def create
    @order_product = @order.order_products.new(order_product_params)
    successful_return if @order_product.save

    render_error unless @order_product.save
  end

  private

  def successful_return
    session[:order_id] = @order.id
    redirect_to root_path, notice: I18n.t('order_products.product_added')
  end

  def render_error
    flash[:alert] = I18n.t('order_products.failed_to_add_product')
    render :new
  end

  def set_order
    @order = current_order
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :quantity)
  end
end
