class Public::CartItemsController < ApplicationController
  def index
    @cart_items= current_customer.cart_items
    @total= 0
  end

  def create
    @cart_item= current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      add_item= current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      add_item.amount+=params[:cart_item][:amount].to_i
      add_item.save
    else
      @cart_item.save
    end
      redirect_to cart_items_path
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:quantity].to_i)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
