class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :number, :tenants
end
