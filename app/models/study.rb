class Study < ActiveRecord::Base
  attr_accessible :course_id, :progress_id, :status, :user_id
end
