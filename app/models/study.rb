class Study < ActiveRecord::Base
  attr_accessible :course_id, :progress_id, :status, :user_id
  belongs_to :course
  #has_many :progresses
end
