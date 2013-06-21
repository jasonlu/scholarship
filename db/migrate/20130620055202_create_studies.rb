class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :progress_id
      t.integer :status

      t.timestamps
    end
  end
end
