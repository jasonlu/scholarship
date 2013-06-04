class Course < ActiveRecord::Base
  attr_accessible :briefing, :category_id, :description, :due_at, :duration_days, :end_at, :group_id, :price, :start_at, :title
end
