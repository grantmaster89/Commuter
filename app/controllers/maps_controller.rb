class MapsController < ApplicationController

  def show
    @place = Place.new(address: search_address)
  end

  private
 
  def search_address
    params[:address]
    
  end
end
