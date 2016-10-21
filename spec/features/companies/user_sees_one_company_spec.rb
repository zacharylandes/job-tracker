require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 90)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "a user adds a contact to a company" do
    company = Company.create(name: "ESPN", city: "LA")

    visit company_path(company)

    fill_in "contact[first_name]", with: "Anna"
    fill_in "contact[last_name]", with: "Dolan"
    fill_in "contact[position]", with: "Director of Cats"
    fill_in "contact[email]", with: "anna.dolan@gmail.com"
    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Director of Cats")
    expect(page).to have_content("anna.dolan@gmail.com")
  end
end
