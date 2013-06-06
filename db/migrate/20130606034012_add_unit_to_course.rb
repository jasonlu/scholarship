class AddUnitToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :unit, :string
  end
end
