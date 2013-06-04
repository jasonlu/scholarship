class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :payment_method
      t.integer :payment_status
      t.float :payment_price

      t.timestamps
    end
  end
end
