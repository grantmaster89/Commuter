# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :authenticate_user!

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show; end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit; end

  # POST /trips
  # POST /trips.json
  def create
    origin = Place.find_by(name: trip_params[:origin])
    redirect_to('/places/new') && return unless origin
    destination = Place.find_by(name: trip_params[:destination])
    @trip = Trip.new(origin: origin, destination: destination, user: current_user)

    respond_to do |format|
      if @trip.save
        format.html { render :show, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id]) if params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trip_params
    params.fetch(:trip, {}).permit(:origin, :destination)
  end
end
