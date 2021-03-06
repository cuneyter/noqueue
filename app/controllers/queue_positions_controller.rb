class QueuePositionsController < ApplicationController
    def new

    end

    def create
    end

    def show
        # when my cue was created:
        queue_creation = QueuePosition.find(params[:id]).created_at
        # find my store_id
        my_store_id = QueuePosition.find(params[:id]).store_id
        # how many people in que to my shop
        queue_to_my_store = QueuePosition.all.select { |queue| queue.store_id == my_store_id}
        #people created queue before me
        @people_before_me = queue_to_my_store.select { |queue| queue.created_at < queue_creation }
        # people that are still in quequ it means that they didnt enter the store
        @people_still_in_queue = @people_before_me.select { |queue| queue.entered == false }
        # @postitions = QueuePosition.all.select { |que| que.store_id == }

        @my_real_position = @people_still_in_queue.length + 1
        @my_queue = QueuePosition.find(params[:id])
        @my_queue.position = @my_real_position

    end

    def destroy
    end

    private

    def queue_positions_params
        params.require(:queue_position).permit(:entered, :position, :store_id)
    end
end
