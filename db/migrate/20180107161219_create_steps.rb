class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.references :lesson, foreign_key: true
      t.string :name
      t.string :video_link
      t.text :desc
      t.integer :step_type, defaut: 0

      t.timestamps
    end
  end
end
