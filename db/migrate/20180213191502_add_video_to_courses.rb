class AddVideoToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :video_link, :string
    add_column :courses, :comment_for_student, :text
  end
end
