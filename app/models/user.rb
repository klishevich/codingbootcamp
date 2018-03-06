class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :full_name, :city, :source, presence: true
  validates_length_of :comment, maximum: 280

  def is_mentor_or_mentor_view?
    self.is_mentor? || self.is_mentor_view?
  end

end
