require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id:1)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end
