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
    @job = Job.find(params[:id])
    @contact = Contact.find(params[:id])
  end


  def destroy
      contact = Contact.find(params[:id])
      # contact.destroy
      redirect_to company_job_path(contact)
  end

  private

  def contact_params
    params.require(:contact).permit(:id, :name, :position, :email, :company_id)
  end

end
