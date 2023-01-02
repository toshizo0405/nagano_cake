class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
  end

  def show
  end

  def create
    
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save

  end

  def confirm
    @order=Order.new(order_params)
    @order.postal_code=current_customer.postal_code
    @order.address=current_customer.address
    @order.name=current_customer.first_name+current_customer.last.name
  end

  def thanx
  end


  private

  def order_params
    params.require(:order).permit(:payment_method,:address,:postal_code,:neme)
  end

end
