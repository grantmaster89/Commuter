class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: "Place"
  belongs_to :destination, class_name: "Place"
end
