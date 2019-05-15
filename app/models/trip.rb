class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: "Place", foreign_key: "origin_id", required: false
  belongs_to :destination, class_name: "Place", foreign_key: "destination_id", required: false
end
