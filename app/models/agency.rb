class Agency < ApplicationRecord
  has_many :routes, dependent: :delete_all
end
