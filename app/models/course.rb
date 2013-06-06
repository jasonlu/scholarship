class Course < ActiveRecord::Base
  attr_accessible :briefing, :category_id, :description, :due_at, :duration_days, :end_at, :group_id, :price, :start_at, :title, :unit, :serial
  #has_one :category
  belongs_to :category
  belongs_to :group
  validates :title, :presence => true
  validates :price, :presence => true
  validates :group_id, :presence => true
  validates :duration_days, :presence => true
  validates :category_id, :presence => true
  validates :start_at, :presence => true
  validates :end_at, :presence => true
  validates :due_at, :presence => true
  validates :serial, :presence => true, :uniqueness => true

end
