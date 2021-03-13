class QueuePosition < ApplicationRecord
  belongs_to :customer
  validates_uniqueness_of :customer_id #! this can be mobile number validation so each mobile number is unique.
  belongs_to :store
end
