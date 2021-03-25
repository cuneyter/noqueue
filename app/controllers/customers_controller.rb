class CustomersController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @queue_positions = QueuePosition.where(store: @store).all.order(position: :asc)
  end

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
    last_position = QueuePosition.where(store: @store).order(position: :desc).first
    if last_position.nil?
      @queue_position.position = 1
    else
      @queue_position.position = last_position.position ? last_position.position + 1 : 1
    end
    if @queue_position.save!
      redirect_to store_customer_queue_position_path(@store, @customer, @queue_position)
    else
      render 'new'
    end
  end

  private

  def customers_params
    params.require(:customer).permit(:mobile_number)
  end
end
