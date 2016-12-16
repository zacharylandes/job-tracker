class JobsController < ApplicationController
  include JobsHelper

  before_action :set_company, only: [:new, :edit, :update, :destroy]
  before_action :set_job,     only: [:show, :edit, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    # sort_jobs_by_city?
    # display_only_one_location?
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.create()
    # @job = Job.new()
    # @categories = Category.all
    # @comment = Comment.new(job_id: params[:job_id])
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.create(job_params)
    # create_helper
  end

  def show
    @comment = Comment.new
  end

  def edit
    @categories = Category.all
  end

  def update
    @job.update(job_params)
    update_helper
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :company_id, :city, :category_id)
  end
end
