class AddSerialToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :serial, :string
  end
end
