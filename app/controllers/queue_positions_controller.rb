class QueuePositionsController < ApplicationController
  def new
  end

  def destroy
  end


  def show
    @queue_position = QueuePosition.find(params[:id])
  end

  private

  def customers_params
    params.require(:customer).permit(:mobile_number)
  end
end
