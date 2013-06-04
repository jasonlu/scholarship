class UserOrder < ActiveRecord::Base
  attr_accessible :order_id, :payment_method, :payment_price, :payment_status, :user_id
end
