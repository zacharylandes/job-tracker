class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
  end

  def create
    job = Job.find(params[:job_id])
    company = Company.find(job.company_id)
    comment = job.comments.create(comment_params)
    redirect_back(fallback_location: company_job_path(company,job))
  end

  def show
    @job = Job.find(params[:job_id])
    @company = Company.find(@job.company_id)
    @comment = Comment.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    job = Job.find(params[:job_id])
    company = Company.find(job.company_id)
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "comment updated!"
      redirect_to company_job_path(company,job)
    else
      render :edit
    end
  end

  def destroy
      job = Job.find(params[:job_id])
      company = Company.find(job.company_id)
      comment = Comment.find(params[:id])
      comment.destroy
      redirect_to company_job_path(company,job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end
