class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.order(id: :desc)
  end
end
