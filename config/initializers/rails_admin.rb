# RailsAdmin config file. Generated on June 05, 2013 09:36
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Scholarship', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Course, SiteConfig, User, UserOrder, UserProfile]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Course, SiteConfig, User, UserOrder, UserProfile]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  config.models do
    edit do
      fields_of_type :text do
        ckeditor do 
          true
        end
      end
    end
  end


  config.model Page do
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

  config.model Course do
    
    configure :group, :belongs_to_association 
    configure :category, :belongs_to_association
    

    list do

      field :serial, :string do
        label "課程編號"
      end

      field :category, :string do
        formatted_value do
          bindings[:object].category.title
        end
        label "課程類別"
        searchable [Category => :title, Course => :category_id]
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
    end
  end

  
  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Course do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :description, :text 
  #     configure :briefing, :text 
  #     configure :start_at, :datetime 
  #     configure :end_at, :datetime 
  #     configure :due_at, :datetime 
  #     configure :price, :float 
  #     configure :duration_days, :integer 
  #     configure :group_id, :integer 
  #     configure :category_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SiteConfig do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :sitename, :string 
  #     configure :description, :string 
  #     configure :keywords, :string 
  #     configure :copyright, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :user_orders, :has_many_association 
  #     configure :user_profile, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model UserOrder do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :order_id, :integer 
  #     configure :payment_method, :integer 
  #     configure :payment_status, :integer 
  #     configure :payment_price, :float 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model UserProfile do
  #   # Found associations:
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :firstname, :string 
  #     configure :lastname, :string 
  #     configure :middlename, :string 
  #     configure :id_number, :string 
  #     configure :dob, :date 
  #     configure :gender, :integer 
  #     configure :education, :string 
  #     configure :country, :string 
  #     configure :state, :string 
  #     configure :register_address, :string 
  #     configure :address, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :cellphone, :string 
  #     configure :phone, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
