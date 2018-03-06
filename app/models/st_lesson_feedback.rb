class StLessonFeedback < ApplicationRecord
  belongs_to :my_lesson
  enum grade: { super: 5, normal: 3, improve: 1 }
  validates :grade, presence: true
end
