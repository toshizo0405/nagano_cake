class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
    @orders=Order.all
  end

  def show
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items=current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_item= OrderItem.create(order_id: @order.id,
                                      item_id: cart_item.item_id,
                                      quantity: cart_item.amount,
                                      price: cart_item.item.price
                                      )
      end
      @cart_items.destroy_all
      redirect_to orders_thanx_path
    else
      render "confirm"
    end
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
    @cart_items = current_customer.cart_items
    @shipping_cost = 800
    @items_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @shipping_cost + @items_price
  end

  def thanx
  end


  private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name)
  end

end
