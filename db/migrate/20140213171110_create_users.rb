class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name 
      t.date :dob
      t.string :instagram_username
      t.string :profile_picture_url
      t.string :phone_number
      t.string :password_digest
    end
  end
end
