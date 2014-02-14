class RemoveSongs < ActiveRecord::Migration
  def change
     drop_table :photos
   end
end
