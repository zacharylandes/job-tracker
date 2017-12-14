require 'rails_helper'

describe "a user sees all comments" do
  scenario "a user sees all comments" do
    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)
    comment = job.comments.create!(content: "yo")
    comment1 = job.comments.create!(content: "no")

    visit company_job_path(company,job)

    expect(page).to have_content("yo")
    expect(page).to have_content("no")

  end
end
