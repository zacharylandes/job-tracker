class DashboardController < ApplicationController

  def index
      # if params[:location]
    # @company
    @jobs = Job.level_of_interest
    @avg_at_company= Company.avg_at_company
    @locations = Job.locations
    render :index

  end
end
