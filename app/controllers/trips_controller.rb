class TripsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_trip


    def index
        @trip = Trip.first
    end

    def show
        @trip = Trip.find_by(param[:id])
    end

    def create
        @trip = Trip.create(trip_params)
        @trip.places.build(latitude: trip.start_place.latitude, longitude: trip.start_place.longitude)
        render json: @trip.as_json if @trip.save
    end

    
    private


    def trip_params
        params.require(:trip).permit(:from, :to)
    end

    def invalid_trip
        logger.error "Attempt to access invalid trip #{params[:id]}"
        redirect_to root_path, notice: "this Trip doesnt exist"
    end
end