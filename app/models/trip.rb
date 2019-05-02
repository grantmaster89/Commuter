class Trip < ApplicationRecord
    has_many :visits, dependent: :destroy

    def add_place(place)
        current_stop = visit.find_by(place_id: place.id)
        if current_stop
            current_stop.increment(:quantity)
        else
            current_stop = visit.build(place_id: place.id)
        end
        current_stop
    end

    def distance
        # TODO: distance between two places
    end
    
end
