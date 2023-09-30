class OrderProductsController < ApplicationController
  before_action :set_order

  def create
    @order_product = @order.order_products.new(order_product_params)
    return successful_return(I18n.t('order_products.product_added')) if @order_product.save

    render_error(I18n.t('order_products.failed_to_add_product'))
  end

  def update
    if order_product.update(order_product_params)
      return redirect_to root_path,
                         notice: I18n.t('order_products.product_updated')
    end

    render_error(I18n.t('order_products.failed_to_update_product'))
  end

  def destroy
    order_product.destroy
    redirect_to root_path, notice: I18n.t('order_products.product_deleted')
  end

  private

  def order_product
    current_order.order_products.find(params[:id])
  end

  def successful_return(message)
    session[:order_id] = @order.id
    redirect_to root_path, notice: message
  end

  def render_error(message)
    redirect_to root_path, notice: message
  end

  def set_order
    @order = current_order
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :quantity)
  end
end
