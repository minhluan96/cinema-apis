class Movie < ApplicationRecord
  has_many :movie_genre
  has_many :genre, through: :movie_genre
  has_many :video
  has_many :actress_movie
  has_many :actress, through: :actress_movie
end
