class Trip < ApplicationRecord
    has_one :start_place, class_name: 'Place'
    has_one :end_place, class_name: 'Place'

    def create(from, to)
        start_place = Place.find_by(name: from)
        end_place = Place.find_by(name: to)
        @trip = Trip.new(start_place: start_place, end_place: end_place)
    end

    def distance
        # TODO: distance between two places
    end
    
end
