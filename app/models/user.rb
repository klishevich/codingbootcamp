class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :preferred_name, :city, presence: true

  def mentor?
    self.is_mentor? || self.is_mentor_view?
  end

end
