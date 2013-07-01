class Study < ActiveRecord::Base
  attr_accessible :course_id, :progress_id, :status, :user_id, :score, :starts_at, :ends_at, :passed
  belongs_to :course
  #has_many :progresses
end
