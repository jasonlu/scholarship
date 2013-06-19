class ChangeDataTypeOfOrderNumber < ActiveRecord::Migration
  def up
    change_column :user_orders, :order_number, :string
  end

  def down
    change_column :user_orders, :order_number, :integer
  end
end
