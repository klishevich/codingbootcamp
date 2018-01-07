class Lesson < ApplicationRecord
  belongs_to :course
  has_many :steps
  validates :name, presence: true
end
