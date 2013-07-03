class AddOrderNumberToCart < ActiveRecord::Migration
  def change
    add_column :carts, :order_number, :string
  end
end
