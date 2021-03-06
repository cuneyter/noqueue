class QueuePositionsController < ApplicationController
  def new
  end

  def destroy
  end

  def create
    @queue_position = QueuePosition.new(queue_position_params)
    @store = Store.find(params[:store_id])
    # @current_customers_in_queue = QueuePosition.where(store: @store).count
    last_position = QueuePosition.where(store: @store).order(position: :desc).first.position
    # if last_position
    #   @queue_position.position = last_position + 1
    # else
    #   @queue_position.position =  1
    # end
    @queue_position.position = last_position ? last_position + 1 : 1
    # raise
    # if @queue_position.save
    #   redirect store_customer_queue_position_path(@queue_position)
    # else
    #   render 'new'
    # end
  end

  def show
    @queue_position = QueuePosition.find(params[:id])
  end

  private

  def queue_position_params

  end
end
