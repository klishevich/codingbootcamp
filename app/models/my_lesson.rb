class MyLesson < ApplicationRecord
  belongs_to :my_course
  belongs_to :lesson
  has_many :my_steps
  has_one :st_lesson_feedback
  validates :my_course_id, :lesson_id, presence: true

  validates_uniqueness_of :lesson_id, scope: :my_course_id

  enum status: { active: 0, done: 1, hold: 2 }
end
