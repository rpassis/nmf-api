class Trip < ApplicationRecord
  belongs_to :route
  has_many :stop_times, dependent: :delete_all
end
