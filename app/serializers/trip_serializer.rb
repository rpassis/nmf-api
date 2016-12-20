class TripSerializer < ActiveModel::Serializer
  attributes :id
  has_many :stop_times
end
