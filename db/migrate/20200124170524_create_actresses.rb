class CreateActresses < ActiveRecord::Migration[5.2]
  def change
    create_table :actresses do |t|
      t.string :name, null: false
      t.string :country
      t.timestamps
    end
  end
end
