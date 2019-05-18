# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: 'Place'
  belongs_to :destination, class_name: 'Place'
  before_save :set_distance

  def set_distance
    self.distance = origin.distance_to(destination)
  end
end
