class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :preferred_name, :string
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :comment, :text
    add_column :users, :is_student, :boolean, default: true
    add_column :users, :is_mentor, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
  end
end
