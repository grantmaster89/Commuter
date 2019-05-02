class TripsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_trip
    before_action :set_trip, only: [:show, :edit, :update, :destroy]

    def index
        @trip = Trip.new
        @vehicles= Vehicle.all
    end

    def show
    end
    

    def new
        @trip = Trip.new
    end

    def edit
        
    end

    def create
        @trip = Trip.new(trip_params)

        respond_to do |format|
            if @trip.save
                format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
                format.json { render :show, status: :created, location: @place }
            else
                format.html { render :new }
                format.json { render json: @trip.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @trip.destroy if @trip.id == session[:trip_id]
        session[:trip_id] = nil
        respond_to do |format|
            format.html { redirect_to trip_url, notice: 'Trip was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    private

    def set_trip
        @trip = Trip.find(params[:id])
    end

    def trip_params
        params.require(:trip).permit(:start_latitude, :start_longitude, :end_latitude, :end_longitude)
    end

    def invalid_trip
        logger.error "Attempt to access invalid trip #{params[:id]}"
        redirect_to root_path, notice: "this Trip doesnt exist"
    end
end