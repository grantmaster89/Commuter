module VehicleHelper
    def fetch_mpg(vehicle)
        vehicle.mpg ? vehicle.mpg : "Fetch MPG"
    end
end
