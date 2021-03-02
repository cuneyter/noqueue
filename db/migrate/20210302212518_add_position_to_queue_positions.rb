class AddPositionToQueuePositions < ActiveRecord::Migration[6.1]
  def change
    add_column :queue_positions, :position, :integer
  end
end
