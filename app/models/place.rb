class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    has_many :trips, class_name: "Trip", foreign_key: 'start_place_id'
    has_many :trips, class_name: "Trip", foreign_key: 'end_place_id'

    def address
        [street, city, state, zip].compact.join(", ")
    end

    def address_changed?
        street_changed? || city_changed? || zip_changed? || state_changed?
    end
end
