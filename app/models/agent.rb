class Agent < ActiveRecord::Base
  ROLES = %w(Agent Admin)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable#, :registerable,
         #:recoverable, :rememberable, :trackable
  has_many :leads
  validates_inclusion_of(:role, in: ROLES)

  def to_s
    name
  end
end
