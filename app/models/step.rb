class Step < ApplicationRecord
  belongs_to :lesson
  validates :name, presence: true
  enum step_type: { video: 0, text: 1 }
end
