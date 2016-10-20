class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to company_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest)
  end

  def set_job
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end
end
