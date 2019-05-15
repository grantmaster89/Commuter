class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def address
        [street, city, state, zip].compact.join(", ")
    end

    def address_changed?
        street_changed? || city_changed? || zip_changed? || state_changed?
    end

    private
end
