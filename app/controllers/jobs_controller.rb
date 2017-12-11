class JobsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
    @company = Company.find(params[:company_id])
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
    @company = Company.find(params[:company_id])
    # redirect_to company_job_path(@job)
  end

  def edit
    @job = Job.find(params[:id])
        @company = Company.find(params[:company_id])


  end

  def update
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])

    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company.id,@job.id)
    else
      render :edit
    end
    # implement on your own!
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_jobs_path
    # implement on your own!
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
