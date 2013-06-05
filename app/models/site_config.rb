class SiteConfig < ActiveRecord::Base
  attr_accessible :key, :value
  validates :key, :uniqueness => {:case_sensitive => false}
end
