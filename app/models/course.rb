class Course < ActiveRecord::Base

  has_many :course_items, :dependent => :destroy, :inverse_of => :course
  belongs_to :category
  belongs_to :group

  accepts_nested_attributes_for :course_items, allow_destroy: true
  attr_accessible :course_items_attributes, :allow_destroy => true
  attr_accessible :briefing, :category_id, :description, :due_at, :duration_days, :end_at, :group_id, :price, :start_at, :title, :unit, :serial
  #has_one :category
  
  
  validates :title, :presence => true
  validates :price, :presence => true
  validates :group_id, :presence => true
  validates :duration_days, :presence => true
  validates :category_id, :presence => true
  validates :start_at, :presence => true
  validates :end_at, :presence => true
  validates :due_at, :presence => true
  validates :serial, :presence => true, :uniqueness => true

  rails_admin do 
    configure :group, :belongs_to_association 
    configure :category, :belongs_to_association
    configure :course_items

    list do

      field :serial, :string do
        label "課程編號"
      end

      field :category, :string do
        formatted_value do
          bindings[:object].category.title
        end
        label "課程類別"
        #searchable [Category => :title, Course => :category_id]
      end

      field :unit, :string do
        label "單元"
      end

      field :title, :string do
        label "課程標題"
      end

      field :duration_days do
        label "長度"
        formatted_value do
          bindings[:object].duration_days.to_s + '天'
        end
      end

    end

    edit do
      field :serial, :string do
        label "課程編號"
      end
      field :unit, :string do
        label "單元"
      end
      field :title, :string
      field :briefing, :text 
      field :start_at, :datetime 
      field :end_at, :datetime 
      field :due_at, :datetime 
      field :price, :float 
      field :duration_days, :integer do
        default_value do
          28
        end
      end
      field :group
      field :category
      field :description, :text do
        ckeditor do 
          true
        end
      end
      field :course_items
    end
  end



end
