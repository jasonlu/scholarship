class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :briefing
      t.timestamp :start_at
      t.timestamp :end_at
      t.timestamp :due_at
      t.float :price
      t.integer :duration_days
      t.integer :group_id
      t.integer :category_id

      t.timestamps
    end
  end
end
