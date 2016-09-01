class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.text :synopsis
      t.integer :episodes
      t.integer :score
      t.date :aired

      t.timestamps null: false
    end
  end
end
