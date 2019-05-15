class User < ApplicationRecord
    has_many :user_roles
    has_many :roles, through: :user_roles
    has_many :trips

    def as_a(role)
        role = Role.find_by(name: role) if role.class == String
        self.user_roles.find_by(role: role)
    end
end
