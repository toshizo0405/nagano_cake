class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  	@order_items = @order.order_items
  	@order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
  	@order_items = @order.order_items
  	@order.update(order_params)


 	if @order.order_status == "入金確認"
	     @order_items.update_all(making_status: 1)
	end
  		 redirect_to  admin_order_path(@order)
  end

  private

  def order_params
  	params.require(:order).permit(:order_status, :user_address)
  end



end
