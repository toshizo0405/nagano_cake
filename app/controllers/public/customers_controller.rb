class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def updete
  @public = Public.find(params[:id])

  @public.update(public_params)

  redirect_to edit_customer_path(@public.id)

  end


 def unsubscribe
  @customer=current_customer

end


def withdraw

@customer = current_customer

@customer.update(is_deleted: true)

reset_session

redirect_to root_path

end

end
