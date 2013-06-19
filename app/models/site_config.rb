class SiteConfig < ActiveRecord::Base
  attr_accessible :key, :value
  validates :key, :uniqueness => {:case_sensitive => false}, :presence => true

  rails_admin do
    edit do
      field :key, :string
      field :value, :text do
        ckeditor do 
          true
        end
      end
    end
  end
  
end
