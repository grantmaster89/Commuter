class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    render json: @place.as_json(only: [:name, :street, :city, :state, :zip]) if @place.save
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :street, :city, :state, :zip)
    end
end
