class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    has_many :trips_origin, class_name: "Trip", foreign_key: "trips_origin_id"
    has_many :trips_destination, class_name: "Trips", foreign_key: "trips_destination_id"

    def address
        [street, city, state, zip].compact.join(", ")
    end

    def address_changed?
        street_changed? || city_changed? || zip_changed? || state_changed?
    end

    private
end
