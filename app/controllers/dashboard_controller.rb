class DashboardController < ApplicationController

  def index

    @jobs = Job.level_of_interest
    @top_three_by_interest= Company.top_three_by_interest
    @locations = Job.locations
    render :index

  end
end
