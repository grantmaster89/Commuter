class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    if @vehicle.save
      flash[:notice] = "Vehicle was successfully created"
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    flash[:notice] = "Vehicle was successfully deleted"
    redirect_to vehicles_path
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      flash[:notice] = "Vehicle was successfully updated"
      redirect_to vehicle_path(@vehicle)
    else
      render :edit
    end
  end

  def fetch_mpg
    @vehicle = Vehicle.find(params[:id])
    flash[:notice] = "Fetching mpg #{params[:id]}"
    VehicleMpgWorker.perform_async(@vehicle)
    redirect_to vehicles_path
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end  

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :yr)
  end
end
