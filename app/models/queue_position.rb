class QueuePosition < ApplicationRecord
  belongs_to :customer
  validates_uniqueness_of :customer_id
  belongs_to :store
end
