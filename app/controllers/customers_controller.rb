class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customers_params)
    @customer.save! # ! think about phone number validations?
    @store = Store.find(params[:store_id])

    @queue_position = QueuePosition.new

    @queue_position.store = @store
    @queue_position.customer = @customer
    # @current_customers_in_queue = QueuePosition.where(store: @store).count
    last_position = QueuePosition.where(store: @store).order(position: :desc).first.position
    # if last_position
    #   @queue_position.position = last_position + 1
    # else
    #   @queue_position.position =  1
    # end
    @queue_position.position = last_position ? last_position + 1 : 1
    if @queue_position.save!
      redirect_to store_path(@store)
    else
      render 'new'
    end
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
