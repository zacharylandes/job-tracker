class CommentsController < ApplicationController


  def new
  @comment = Comment.new()
  end

  def create
    job = Job.find(params[:job_id])
    company = Company.find(job.company_id)
    comment = job.comments.new(comment_params)
    if comment.save
      flash[:success] = "created"
      redirect_to company_job_path(company,job)
    end
  end

  def edit
    @job = Job.find(params[:id])
    @comment = Comment.find(params[:id])
  end


  def destroy
      job = Job.find(params[:job_id])
      company = Company.find(job.company_id)
      # comment = Comment.find(params[:id])
      # comment.destroy
      redirect_to company_job_path(company,job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end
