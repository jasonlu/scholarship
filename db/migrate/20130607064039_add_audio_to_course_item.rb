class AddAudioToCourseItem < ActiveRecord::Migration
  def change
    add_attachment :course_items, :audio
  end
end
