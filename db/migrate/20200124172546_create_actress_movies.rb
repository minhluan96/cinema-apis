class CreateActressMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :actress_movies do |t|
      t.belongs_to :movie
      t.belongs_to :actress
      t.timestamps
    end
  end
end
