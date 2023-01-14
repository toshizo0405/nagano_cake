class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  	@order_items = @order.order_items
  	
  end

  def update
    @order = Order.find(params[:id])
  	@order_items = @order.order_items
  	@order.update(order_params)


  end






  private
  
  
  
  

  def order_params
  	params.require(:order).permit(:order_status, :address)
  end



end
