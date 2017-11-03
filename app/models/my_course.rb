class MyCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user_id, :course_id, presence: true

  enum status: { is_new: '0', active: '1', closed: '2' }
end
