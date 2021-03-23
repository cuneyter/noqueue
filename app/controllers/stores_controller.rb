class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @customer = Customer.new
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id
    @store.save
    if @store.save
      redirect_to store_customers_path(@store)
    else
      render 'new'
    end
  end

  private

  def store_params
    params.require(:store).permit(:store_name, :store_capacity, :logo_url)
  end
end
