module JobsHelper
  include HomepageHelper
  
  def sort_jobs_by_city?
    if params[:sort]
      @sorted_by_city_note = "Sorted by city alphabetic order:"
      @jobs = Job.all.sort_by_city
    else
      @jobs = Job.all
    end
  end

  def display_only_one_location?
    if params[:city]
      @sorted_by_city_note = "Jobs in this city:"
      @jobs = Job.where(params[:city])
    else
      @jobs = Job.all
    end
  end

  def sort_jobs_by_interest?
    if params[:sort]
      @sorted_by_interest_note = "Sorted by level_of_interest:"
      @jobs = Job.all.sort_by_interest
      render :sorted_index
    else
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    end
  end

  def create_helper
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def update_helper
    if @job.save
      redirect_to company_jobs_path(@job.company, @job)
    else
      render :edit
    end
  end

  def category_helper
    @job.category.nil? ? 'not assigned' : @job.category.title
  end
end
