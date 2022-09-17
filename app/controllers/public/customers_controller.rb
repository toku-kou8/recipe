class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @recipes = @customer.menus
  end
end
