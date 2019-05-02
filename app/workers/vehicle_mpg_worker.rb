class VehicleMpgWorker
  include Sidekiq::Worker

  def perform(params)
    puts "** LOGGING Back ground worker Fetching mpg"
    # flash[:notice] = "Back ground worker Fetching mpg #{params[:id]}"
  end
end
