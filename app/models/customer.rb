class Customer < ApplicationRecord
  has_one :queue_position

  validates :mobile_number, presence: true, numericality: true
end
