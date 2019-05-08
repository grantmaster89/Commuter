class Trip < ApplicationRecord
    has_many :visits, dependent: :destroy

    def create(from, to)
        start_place = Place.find_by(name: from)
        end_place = Place.find_by(name: to)
        @trip = Trip.new(start_place: start_place, end_place: end_place)
    end

    def add_place(place)
        current_place = visits.find_by(place_id: place.id)
        if current_place
            current_place.increment(:quantity)
        else
            current_place = visits.build(place_id: place.id)
        end
        current_place
    end

    def distance
        # TODO: distance between two places
    end

    
    
end
