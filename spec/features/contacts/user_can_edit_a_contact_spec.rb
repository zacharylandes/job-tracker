require 'rails_helper'

describe "User edits an existing contact" do
  scenario "a user can edit a contact" do
    job = create(:job,id:1)
    company = create(:company, id:1)
    contact= create(:contact,company_id: company.id)

    visit company_jobs_path(company,job,contact)

    click_on "Edit"


    expect(current_path).to eq("/companies/1/contacts/2/edit")
    expect(page).to have_content("Edit your comment here!")
    fill_in "contact[name]", with: "Flippity Flopper"

      click_on "Update Contact"

    expect(page).to have_content("Flippity Flopper")
  end


end
