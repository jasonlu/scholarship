class Message < ActiveRecord::Base
  attr_accessible :content, :subject, :user_id
  has_many :inboxes
  has_many :users, through: :inboxes
  
  has_many :senders, :foreign_key => 'user_id', :class_name => "User"
end
