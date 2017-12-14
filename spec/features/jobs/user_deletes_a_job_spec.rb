require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)

    visit company_jobs_path(company,job)


    click_link "Delete"


    expect(page).to have_content("Developer was successfully deleted!")
  end
end
