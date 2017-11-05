class MyLesson < ApplicationRecord
  belongs_to :my_course
  belongs_to :lesson
  validates :my_course_id, :lesson_id, presence: true

  enum status: { active: 0, closed: 1, hold: 2 }
end
