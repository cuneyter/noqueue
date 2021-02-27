class Store < ApplicationRecord
  belongs_to :user
  has_many :queue_positions

  validates :store_name, :qr_code, presence: true
  validates :store_capacity, presence: true, numericality: true
end
