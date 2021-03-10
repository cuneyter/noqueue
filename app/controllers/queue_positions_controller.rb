class QueuePositionsController < ApplicationController
  def new
  end

  def destroy
    @queue_position = QueuePosition.find(params[:id])
    @queue_position.destroy

    redirect_to store_customers_path(@queue_position.store)
  end

  def show
    @queue_position = QueuePosition.find(params[:id])
  end
end
