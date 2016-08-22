class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :not_sponsorship, -> { where(sponsorship_id: nil) }

  def fullname
    "#{lastname.capitalize} #{firstname.capitalize}"
  end
end
