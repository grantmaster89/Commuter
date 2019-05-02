module CurrentTrip

    private

    def set_trip
        @trip = Trip.find(session[:trip_id])
    rescue ActiveRecord::RecordNotFound
        @trip = Trip.create
        session[:id] = @trip.id
    end
    
end