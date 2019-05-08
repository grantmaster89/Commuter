class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    before_destroy :not_referenced_by_any_visit
    has_many :visits

    def address
        [street, city, state, zip].compact.join(", ")
    end

    def address_changed?
        street_changed? || city_changed? || zip_changed? || state_changed?
    end

    private

    def not_referenced_by_any_visit
        unless visits.empty?
            errors.add(:base, "Visit present")
            throw :abort
        end
    end
end
