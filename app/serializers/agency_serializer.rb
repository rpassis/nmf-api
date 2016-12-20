class AgencySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :routes
end
