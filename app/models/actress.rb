class Actress < ApplicationRecord
  has_many :actress_movie
  has_many :movie, through: :actress_movie
end
