class StopTime < ApplicationRecord
  belongs_to :trip
  has_many :stops
end
