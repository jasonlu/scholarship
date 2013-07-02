class UserOrder < ActiveRecord::Base
  attr_accessible :order_number, :courses, :payment_method, :payment_price, :payment_status, :user_id
  belongs_to :user
  has_many :studies

  rails_admin do 
    configure :user, :belongs_to_association 
    

    list do
      sort_by :payment_status, :created_at

      field :order_number, :string do
        label "訂單編號"
      end

      field :user, :string do
        label "訂購人"
        formatted_value do
          bindings[:object].user.user_profile.lastname + ' ' + bindings[:object].user.user_profile.firstname
        end
      end

      field :payment_price, :float do
        label "金額"
        formatted_value do
          bindings[:object].payment_price.to_s + '元'
        end
      end

      field :payment_status, :integer do
        label "付款"
        formatted_value do
          case bindings[:object].payment_status 
          when 0 
            '未付款' 
          when 1
            '已付款'
          end
        end
        sort_reverse false
      end

      field :payment_method, :integer do
        label "付款方式"
        formatted_value do
          case bindings[:object].payment_status
          when 0
            '匯款' 
          when 1
            '信用卡'
          when 2
            '超商繳費'
          end
        end
      end   

    end

    
  end

end
