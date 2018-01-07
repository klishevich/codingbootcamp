class CreateMySteps < ActiveRecord::Migration[5.1]
  def change
    create_table :my_steps do |t|
      t.references :my_lesson, foreign_key: true
      t.references :step, foreign_key: true
      t.boolean :is_new, default: true

      t.timestamps
    end
  end
end
