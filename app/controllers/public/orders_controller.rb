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
    binding.pry
  end

  def thanx
  end


  private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name)
  end

end
