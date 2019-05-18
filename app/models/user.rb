# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :trips
  has_many :services

  def as_a(role)
    role = Role.find_by(name: role) if role.class == String
    user_roles.find_by(role: role)
  end
end
