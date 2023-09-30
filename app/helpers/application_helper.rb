module ApplicationHelper
  def current_order
    return Order.find(session[:order_id]) if session[:order_id].present?

    Order.new
  end

  def format_price(price)
    number_to_currency(price, unit: '€', precision: 2)
  end
end
