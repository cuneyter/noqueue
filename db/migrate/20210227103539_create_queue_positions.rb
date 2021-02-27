class CreateQueuePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :queue_positions do |t|
      t.boolean :entered
      t.references :customer, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
