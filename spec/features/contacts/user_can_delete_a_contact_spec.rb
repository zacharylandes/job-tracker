require 'rails_helper'

describe "User deletes existing contact" do
  scenario "a user can delete a contact" do
    job = create(:job,id:1)
    company = create(:company, id:1)
    contact= create(:contact,company_id: company.id)

    visit company_jobs_path(company,job)


    click_link "Delete"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(Contact.count).to eq(0)

  end
end
