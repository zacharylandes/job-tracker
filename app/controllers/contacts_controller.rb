class ContactsController < ApplicationController

  def new
    @contact = Contact.new()
  end

  def create
    company = Company.find(params[:company_id])
    contact = company.contacts.new(contact_params)
    if contact.save
      flash[:success] = "created"
      redirect_to company_path(company,contact)
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    job = Job.where(:company_id => @company.id)
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    if @contact.save
      flash[:success] = "contact updated!"
      redirect_to company_jobs_path(@company, job, @contact)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to company_jobs_path(company)
  end

  private

  def contact_params
    params.require(:contact).permit(:id, :name, :position, :email, :company_id)
  end

end
