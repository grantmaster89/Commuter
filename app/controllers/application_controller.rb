class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # include CurrentTrip
    # before_action :set_trip
end
