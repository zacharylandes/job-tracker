require 'rails_helper'

describe "User deletes existing comment" do
  scenario "a user can delete a comment" do
    company = create(:company)
    category = create(:category)
    job = create(:job)
    comment = Comment.create!(content: "yo", job_id: job.id)

    visit company_job_path(company,job)
   within(".list-group-comment-show") do
    click_link "Delete"
    end

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(Comment.count).to eq(0)
  end
end
