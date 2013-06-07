class Cart < ActiveRecord::Base
  attr_accessible :course_id, :order_id, :user_id
end
