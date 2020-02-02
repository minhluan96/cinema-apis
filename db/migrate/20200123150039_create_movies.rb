class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :description
      t.string :trailer_url
      t.timestamps
    end
  end
end
