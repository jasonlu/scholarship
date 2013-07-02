class CourseItem < ActiveRecord::Base
  has_attached_file :audio, :url => "/files/:class/:attachment/:basename.:extension"

  attr_accessor :delete_audio
  attr_accessible :answer, :course_id, :question, :audio, :delete_audio
  belongs_to :course

  rails_admin do 
    configure :course, :belongs_to_association 

    edit do
      field :audio, :paperclip do
        label "錄音檔"
      end
      field :question, :string
      field :answer, :string
      field :course
    end
  end

end
