class Course < ApplicationRecord
  has_many :lessons
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
