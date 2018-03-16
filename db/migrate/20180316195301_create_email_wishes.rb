class CreateEmailWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :email_wishes do |t|
      t.text :text

      t.timestamps
    end
  end
end
