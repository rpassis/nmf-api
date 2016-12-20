class RouteSerializer < ActiveModel::Serializer
  attributes :id
  has_many :trips
end
