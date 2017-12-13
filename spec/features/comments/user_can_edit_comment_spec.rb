require 'rails_helper'

describe "User edits an existing comment" do
  scenario "a user can edit a comment" do
    company = Company.create!(name: "ESPN")
    science = Category.create!(id:1,name: "science")
    job = company.jobs.create!(id:2,title: "Developer", level_of_interest: 70, city: "Denver", category_id: 1)
    comment = job.comments.create!(content: "yo")

    visit edit_job_comment_path(job,comment)

    fill_in "comment[content]", with: "Flippity Flopper"

    click_button "Update Comment"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Flippity Flopper")
    # expect(page).to_not have_content("ESPN")
  end
end
