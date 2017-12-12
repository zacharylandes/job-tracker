require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment" do
    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)

    visit company_job_path(company,job)

    fill_in "comment[content]", with: "Developer"

    click_button "Create Comment"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Developer")
  end
end
