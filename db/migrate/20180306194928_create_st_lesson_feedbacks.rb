class CreateStLessonFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :st_lesson_feedbacks do |t|
      t.references :my_lesson, foreign_key: true
      t.integer :grade
      t.string :grade_comment
      t.boolean :hw_done, default: false
      t.string :hw_link

      t.timestamps
    end
  end
end
