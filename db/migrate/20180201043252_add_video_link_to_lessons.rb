class AddVideoLinkToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :video_link, :string
  end
end
