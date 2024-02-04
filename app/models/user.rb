class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  ROLES = [:"Admin", :"User"]
  def self.roles
    ROLES.map { |role| [role, role] }
  end
end
