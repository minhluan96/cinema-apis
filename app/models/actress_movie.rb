class ActressMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :actress
end
