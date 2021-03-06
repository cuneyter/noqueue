class QueuePositionsController < ApplicationController
  def new
  end

  def destroy
  end

  def show
    @queue_position = QueuePosition.find(params[:id])
  end
end
