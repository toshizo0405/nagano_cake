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
  end

  def thanx
  end


  private

  def order_params
    params.require(:order).permit(:payment_method,:address)
  end

end
