require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Job Title", description: "Job Description", level_of_interest: 25)
    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Job Title was successfully deleted!")
  end
end
