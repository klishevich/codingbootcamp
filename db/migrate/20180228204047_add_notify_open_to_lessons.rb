class AddNotifyOpenToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :notify_open, :boolean, default: false
  end
end
