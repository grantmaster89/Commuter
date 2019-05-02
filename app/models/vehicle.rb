class Vehicle < ApplicationRecord
    validates :make, presence: true
    validates :model, presence: true
    validates :yr, presence: true
end
