class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(customers_params)
    if @store.save
      redirect_to store_path(@store)
    else
      render 'new'
    end
  end

  def show
    @store = Store.find(params[:id])
    @customer = Customer.new
    # @queue_position = QueuePosition.new
  end

  def index
    @store = Store.all
  end

  private

  def stores_params
    params.require(:store).permit(:store_name, :store_capacity, :qr_code)
  end
end
