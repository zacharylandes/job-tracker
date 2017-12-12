require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do

    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)

    visit edit_company_job_path(company,job)
    # byebug
    save_and_open_page

    fill_in "job[title]", with: "Flippity Flopper"
    fill_in "job[description]", with: "Flops the flips"
    fill_in "job[city]", with: "Winters"
    select("science", from: "job[category_id]").select_option

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Flippity Flopper")
    # expect(page).to_not have_content("ESPN")
  end
end
