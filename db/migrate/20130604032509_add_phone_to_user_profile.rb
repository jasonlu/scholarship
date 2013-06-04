class AddPhoneToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :cellphone, :string
    add_column :user_profiles, :phone, :string
  end
end
