class CreateMyLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :my_lessons do |t|
      t.references :my_course, foreign_key: true
      t.references :lesson, foreign_key: true
      t.integer :status, defaut: 0
      t.date :date_start
      t.date :date_end
      t.integer :grade
      t.text :comment_for_student
      t.text :comment

      t.timestamps
    end
  end
end
