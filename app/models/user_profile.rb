class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :country, :dob, :education, :firstname, :gender, :id_number, :lastname, :middlename, :register_address, :state, :user_id
end
