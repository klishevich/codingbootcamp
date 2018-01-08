class Step < ApplicationRecord
  belongs_to :lesson
  validates :name, :step_type, presence: true
  enum step_type: { video: 0, text: 1 }
end
