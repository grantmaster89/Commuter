# frozen_string_literal: true

class PlacesController < ApplicationController
  def index
    @places = Place.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.json { render json: @places }
    end
  end

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
    render json: @place.as_json(only: %i[name street city state zip]) if @place.save
  end

  # DELETE /place/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy if @place.present?
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(:name, :street, :city, :state, :zip)
  end
end
