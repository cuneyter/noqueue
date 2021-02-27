class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customers_params)
    # if @customer.save
    #   redirect_to queue_position_path(@queue_position)
    # else
    #   render 'new'
    # end
  end

  # def destroy
  #   @customer.destroy
  #   redirect_to customers_path
  # end

  private

  def customers_params
    params.require(:customer).permit(:mobile_number)
  end
end
