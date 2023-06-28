class Admin::CustomersController < ApplicationController
def index
  @customers =Customer.all
end

def show
   @customer = Customer.find(params[:id])
end

def edit
    @customer = Customer.find(params[:id])
end

def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
end


end

 private

  def customer_params
    params.require(:customer).permit(
      :first_name, :first_name_kana,
      :postal_code, :address,
      :phone_number, :email, :is_deleted)
  end
