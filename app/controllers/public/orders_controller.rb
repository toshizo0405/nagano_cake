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
    @cart_items= CartItem.all
    @order=Order.new(order_params)
    if params[:address2] =="1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:address2] =="0"
        @order.postal_code=current_customer.postal_code
        @order.address=current_customer.address
        @order.name=current_customer.last_name+current_customer.first_name
    elsif params[:address2] =="2"
         @order.postal_code=params[:order][:postal_code]
         @order.name=params[:order][:name]
         @order.address=params[:order][:address]


    end




  end

  def thanx
  end


  private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name)
  end

end
