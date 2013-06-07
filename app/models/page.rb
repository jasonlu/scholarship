class Page < ActiveRecord::Base
  attr_accessible :body, :key, :title
  validates :key, :uniqueness => {:case_sensitive => false}, :presence => true
  validates :title, :presence => true

  rails_admin do

    edit do
      field :title, :string
      field :key, :string
      field :body, :text do
        ckeditor do 
          true
        end
      end
    end
    
  end

end
