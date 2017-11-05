class Lesson < ApplicationRecord
  belongs_to :course
  validates :name, :video_desc, presence: true
end
