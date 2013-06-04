class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :id_number
      t.date :dob
      t.integer :gender
      t.string :education
      t.string :country
      t.string :state
      t.string :register_address
      t.string :address

      t.timestamps
    end
  end
end
