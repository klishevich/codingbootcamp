class Certificate < ApplicationRecord
  validates :student,
            :course_title,
            :course_desc,
            :mentors,
            :issue_date,
            presence: true
end
