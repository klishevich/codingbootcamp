class AddIsMentorViewToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_mentor_view, :boolean, default: false
  end
end
