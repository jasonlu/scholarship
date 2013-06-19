class RenameOrderIdColumnInUserOrder < ActiveRecord::Migration
  def up
    rename_column :user_orders, :order_id, :order_number
    add_column :user_orders, :courses, :string
  end

  def down
    rename_column :user_orders, :order_number, :order_id
    remove_column :user_orders, :courses
  end
end
