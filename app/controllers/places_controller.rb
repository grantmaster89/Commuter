class PlacesController < ApplicationController
  
  def new
    @place = Place.new
  end


  def show
    @place = Place.find(params[:id])
  end

  def create
    # TODO: if called from trips
    # 1) populate name field
    # 2) redirect back to trip create or back
    @place = Place.new(place_params)
    redirect_to maps_path if @place.save
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(:name, :street, :city, :state, :zip, :address)
  end
end