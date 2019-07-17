# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :authenticate_user!

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id]) if params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trip_params
    params.fetch(:trip, {}).permit(:origin_id, :destination_id, :place_id)
  end
end
