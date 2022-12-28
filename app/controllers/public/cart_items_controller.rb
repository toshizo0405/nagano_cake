class Public::CartItemsController < ApplicationController
  def index
    @cart_items= current_customer.cart_items
    @total= 0
  end

  def create
    @cart_item= current_customer.cart_items.new(cart_item_params)
    @cart_item.item_id=params[:cart_item][:item_id]
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
