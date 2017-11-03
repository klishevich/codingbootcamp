class CreateMyCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :my_courses do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :status, default: 0
      t.string :ref
      t.date :date_start
      t.date :date_end
      t.integer :grade
      t.text :comment

      t.timestamps
    end
  end
end
