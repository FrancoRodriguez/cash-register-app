module ApplicationHelper
  def current_order
    Order.find(session[:order_id]) if session[:order_id].present?

    Order.new
  end
end
