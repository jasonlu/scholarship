class CreateCourseItems < ActiveRecord::Migration
  def change
    create_table :course_items do |t|
      t.integer :course_id
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
