class QueuePositionsController < ApplicationController
  def new
  end

  def destroy
    @queue_position = QueuePosition.find(params[:id])
    current_qp = @queue_position.position
    @queue_position.destroy
    # find table - queue position table
    # select the queue positions higher than deleted queue position.
    queue_positions_deleted_position = QueuePosition.where("position > ?", current_qp)
    # select the position column
    # update each position of queue_position by - 1
    queue_positions_deleted_position.each do |qp|
      qp.update(position: (qp.position - 1))
    end

    redirect_to leave_path
  end

  def remove_from_store
    @queue_position = QueuePosition.find(params[:id])
    current_qp = @queue_position.position
    @queue_position.destroy
    # find table - queue position table
    # select the queue positions higher than deleted queue position.
    queue_positions_deleted_position = QueuePosition.where("position > ?", current_qp)
    # select the position column
    # update each position of queue_position by - 1
    queue_positions_deleted_position.each do |qp|
      qp.update(position: (qp.position - 1))
    end

    redirect_to store_customers_path(@queue_position.store)
  end

  def show
    @queue_position = QueuePosition.find(params[:id])
  end
end
