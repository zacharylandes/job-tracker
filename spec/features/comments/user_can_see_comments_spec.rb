require 'rails_helper'

describe "User sees one comment " do
  scenario "a user sees a comment" do
    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)
    comment = job.comments.create!(content: "yo")


    visit company_job_path(company,job)
    expect(page).to have_content("yo")
  end
end
