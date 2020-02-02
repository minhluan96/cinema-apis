module Api
  class MovieSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :trailer_url
  end
end