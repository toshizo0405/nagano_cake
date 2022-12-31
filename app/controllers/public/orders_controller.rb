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
    
  end

  def confirm
  end

  def thanx
  end
end
