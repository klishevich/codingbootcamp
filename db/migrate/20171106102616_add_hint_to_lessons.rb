class AddHintToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :hint, :text
  end
end
