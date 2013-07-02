class AddUserOrderIdToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :user_order_id, :integer
  end
end
