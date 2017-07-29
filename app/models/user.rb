class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [ :admin, :agent, :customer ]
  after_initialize :set_default_role, :if => :new_record?

  has_many :tickets

  def set_default_role
    self.role ||= :customer
  end
end
