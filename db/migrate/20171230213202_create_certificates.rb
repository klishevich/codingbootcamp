class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.string :student
      t.string :course_title
      t.text :course_desc
      t.text :mentors
      t.date :issue_date

      t.timestamps
    end
  end
end
