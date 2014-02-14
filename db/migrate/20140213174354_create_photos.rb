class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :photo_id
      t.text :photo_url
      t.integer :likes_count
      t.string :title
      t.string :created_time
      t.string :username
      t.references :story
    end
  end
end
