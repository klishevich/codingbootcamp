class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :my_courses
  validates :full_name, :reg_code, presence: true
  validates_length_of :comment, maximum: 280
  validate :is_reg_code_correct
  before_save :upcase_reg_code

  def is_mentor_or_mentor_view?
    self.is_mentor? || self.is_mentor_view?
  end

  def is_reg_code_correct
    errors.add(:reg_code, :reg_code_is_not_correct) unless
      ['2019ELBRUS', '2019JSONELOVE'].include?(reg_code.upcase)
  end

  def upcase_reg_code
    self.reg_code&.upcase!
  end
end
