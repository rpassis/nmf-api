class Route < ApplicationRecord
  belongs_to :agency
  has_many :trips, dependent: :delete_all
end
