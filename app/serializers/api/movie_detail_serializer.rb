module Api
  class MovieDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :trailer_url, :actresses, :genres

    def actresses
      object.actress
    end

    def genres
      object.genre
    end
  end
end