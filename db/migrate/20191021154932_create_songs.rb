class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :genre
      t.string :artist
      t.references :user

      t.timestamps
    end
  end
end
