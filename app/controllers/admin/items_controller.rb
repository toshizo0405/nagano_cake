class Admin::ItemsController < ApplicationController
  def index
    @items= Item.all
  end

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
  	if  @item.save
  	 redirect_to admin_item_path(@item)
  	else
  	  render :new
  	end
  end

  def show
    @item = Item.find(params[:id])
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
   redirect_to admin_item_path(@item.id)
  end


end


 private

  def item_params
  	params.require(:item).permit(:name,:introduction,:price,:is_active,:item_image)
  end