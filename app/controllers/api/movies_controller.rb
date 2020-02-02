module Api
  class MoviesController < ApplicationController
    load_and_authorize_resource
    skip_authorization_check only: :index

    def index
      movies = Movie.all
      render json: ActiveModel::ArraySerializer.new(movies, each_serializer: MovieSerializer)
    end

    def show
      render json: @movie, serializer: MovieDetailSerializer
    end
  end
end
