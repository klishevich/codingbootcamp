class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :course, foreign_key: true
      t.string :name
      t.text :video_desc
      t.text :task_desc
      t.text :reading_desc
      t.text :comment_desc

      t.timestamps
    end
  end
end
