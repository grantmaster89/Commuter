class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
    has_many :user_roles
    has_many :roles, through: :user_roles
    has_many :trips
    has_many :services  

    def as_a(role)
        role = Role.find_by(name: role) if role.class == String
        self.user_roles.find_by(role: role)
    end
end
