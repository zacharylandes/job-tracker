require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(id:1, name: "science")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)

    visit company_jobs_path(company)

    fill_in "contact[name]", with: "Developer"

    click_button "Create Contact"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Developer")
  end
end
