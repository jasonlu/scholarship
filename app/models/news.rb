class News < ActiveRecord::Base
  attr_accessible :user_id, :close_at, :content, :publish_at, :title
  belongs_to :user

  rails_admin do

    edit do
      field :title, :string
      field :content, :text do
        ckeditor do 
          true
        end
      end
      field :publish_at, :datetime
      field :close_at, :datetime
    end
    
  end

end
