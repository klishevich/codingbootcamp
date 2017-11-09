class MyCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :my_lessons
  validates :user_id, :course_id, presence: true

  validates_uniqueness_of :course_id, scope: :user_id

  enum status: { active: 0, closed: 1, hold: 2 }
end
