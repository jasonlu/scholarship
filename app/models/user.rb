class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :user_orders
  has_many :newses
  has_one :user_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  #:rememberable, 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
