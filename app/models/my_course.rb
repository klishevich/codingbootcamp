class MyCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :my_lessons
  validates :user_id, :course_id, presence: true

  enum status: { active: 0, closed: 1, hold: 2 }
end