class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :hashtag
      t.text :the_story
      t.text :photo_url 
      t.timestamps
      t.references :user
    end
  end
end
